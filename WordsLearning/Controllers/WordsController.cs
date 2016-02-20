using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model;
using WordsLearning.Models;
using Business;
using WordsLearning.Shared;
using System.Text;
using System.IO;
using System.Reflection;


namespace WordsLearning.Controllers
{
    public class WordsController : BaseController
    {
        public WordsManage _wordsManage { get { return new WordsManage(); } }
        public UserManage _userManage { get { return new UserManage(); } }
        public LibraryManage _libraryManage { get { return new LibraryManage(); } }
        public TestedManage _testedManage { get { return new TestedManage(); } }
        public MarkManage _markManage { get { return new MarkManage(); } }
        public ScoreManage _scoreManage { get { return new ScoreManage(); } }

        public User _user { get { return GetUserByCookie(); } }
        public int _LibraryId { get { return GetConfiguationByCookie().LibraryId; } }
        
        //
        // GET: /Words/

        public ActionResult WordsList()
        {
            int LibraryId;
            int WordCount;
            int Page = GetPageNumber();
            var wordinfo = new List<WordInfo>();
            var words = (List<Word>)this.HttpContext.Session["words"];
            var Marks = _markManage.GetMark(_user.UserId);
            
            if (_user.UserId == 0)
                LibraryId = this.HttpContext.Session["LibraryId"] == null ? 1 : (int)this.HttpContext.Session["LibraryId"];
            else
                LibraryId = _LibraryId;

            words = GetWords(words, Page, 30, LibraryId, out WordCount);
            List<int> PageList = GetPageList(30, WordCount);

            foreach (var item in words)
            {
                var mark = Marks.FirstOrDefault(u => u.WordId == item.WordId) == null ? 0 : 1;
                var info = SetWordInfo(item);
                info.Marked = mark;
                wordinfo.Add(info);
            }

            ViewBag.userid = _user.UserId;
            ViewBag.LibraryId = LibraryId;
            ViewBag.WordCount = WordCount;
            ViewBag.PageList = PageList;
            ViewBag.CurrentPage = Page;
            ViewBag.LibraryList = SetLibraryInfo(_libraryManage.GetLibrary());
            return View(wordinfo);
        }

        [UserAuthorize(0)]
        public ActionResult Manage()
        {
            int LibraryId = this.HttpContext.Session["LibraryId"] == null ? 1 : (int)this.HttpContext.Session["LibraryId"];
            int Page = GetPageNumber();
            int WordCount = 0;
            var words = (List<Word>)this.HttpContext.Session["words"];
            var LibraryList = SetLibraryInfo(_libraryManage.GetLibrary());            

            words = GetWords(words, Page, 20, LibraryId, out WordCount);
            List<int> PageList = GetPageList(20, WordCount);

            var wordinfo = SetWordInfo(words);
            ViewBag.WordCount = WordCount;
            ViewBag.LibraryId = LibraryId;
            ViewBag.LibraryList = LibraryList;
            ViewBag.PageList = PageList;
            ViewBag.CurrentPage = Page;

            return View(wordinfo);
        }

        [UserAuthorize(1)]
        public ActionResult TransTest(string falseid="",int enhanced=0)
        {
            int finished;
            int rate;
            var words = _testedManage.PrepareTest(falseid, _user, _LibraryId, 1, out finished, out rate);
            var wordinfo = words.Select(t => new WordInfo()
            {
                Id = t.WordId,
                spell = t.spell+" "+t.type,
                translate =t.translate,
                type=t.type
            }).ToList();

            ViewBag.enhanced = enhanced;
            ViewBag.finished = finished;
            ViewBag.rate = rate;

            return View(wordinfo);
        }

        [UserAuthorize(1)]
        public ActionResult SpellTest(string falseid = "", int enhanced = 0)
        {
            int finished;
            int rate;
            var words = _testedManage.PrepareTest(falseid, _user, _LibraryId, 0, out finished, out rate);
            var wordinfo = words.Select(t => new WordInfo()
            {
                Id = t.WordId,
                translate=t.translate+"("+t.type+")",
                spell=t.spell
            }).ToList();

            ViewBag.enhanced = enhanced;
            ViewBag.finished = finished;
            ViewBag.rate = rate;
            
            return View(wordinfo);
        }

        //
        // GET: /Words/Edit/5
        [UserAuthorize(0)]
        public ActionResult Edit(int id,string status=null)
        {
            ViewBag.status = status;
            var word = _wordsManage.GetWordById(id);
            var result = SetWordInfo(word);
            var LibraryInfo = SetLibraryInfo(_libraryManage.GetLibrary());
            result.LibraryStr = _libraryManage.GetLibraryStrByWordId(word.WordId);
            result.LibraryList = LibraryInfo;
            return View(result);
        }

        // POST: /Words/Edit/5
        [HttpPost]
        public ActionResult Edit(WordInfo wordinfo)
        {           
            List<int> libraryIdList = new List<int>();
            var word = SetWord(wordinfo);
            
            if (!string.IsNullOrEmpty(wordinfo.LibraryStr))
            {
                var LibraryArray = wordinfo.LibraryStr.Split('_');
                for (int i = 1; i < LibraryArray.Length; i++)
                {
                    libraryIdList.Add(int.Parse(LibraryArray[i]));
                }
            }
            else
                libraryIdList.Add(-1);

            var result=_wordsManage.UpdateWord(word);
            _libraryManage.UpdateLibrary(word.WordId, libraryIdList);
            //TODO:return Json(new { IsSuccess = result });
            if (result)
                return RedirectToAction("Edit", new { id = wordinfo.Id, status = "t" });
            else
                return RedirectToAction("Edit", new { id = wordinfo.Id, status = "f" });
        }

        public ActionResult WordDetail(string spell)
        {
            int LibraryId;
            if (_user.UserId == 0)
                LibraryId = this.HttpContext.Session["LibraryId"] == null ? 1 : (int)this.HttpContext.Session["LibraryId"];
            else
                LibraryId = _LibraryId;
            var result = SetWordInfo(_wordsManage.GetWordsBySpell(spell, LibraryId));
            return View(result);
        }

        [UserAuthorize(1)]
        public ActionResult Enhance(string fid)
        {
            var tag = fid.Split('$');
            if (tag[1] == "1")
                return RedirectToAction("TransTest", new { falseid = tag[0],enhanced=1 });
            else
                return RedirectToAction("SpellTest", new { falseid = tag[0],enhanced=1 });
        }

        public ActionResult Translate()
        {
            return View(new TransInfo() { From="English",To="Chinese"});
        }

        [HttpPost]
        public ActionResult Translate(string query,string from,string to) 
        {
            string trans = string.Empty;
            var result = new TransInfo();      

            result = TranslateFromDB(query, from);
            result.From = from;
            result.To = to;

            if (!string.IsNullOrEmpty(result.Dst))
                return View(result);

            from = (from == "English") ? "en" : "zh";
            to = (to == "Chinese") ? "zh" : "en";
            result.Src = query;

            try
            {
                string url = "http://apis.baidu.com/apistore/tranlateservice/translate";
                string param = "query=" + query + "&from=" + from + "&to=" + to;
                string jsonString = _wordsManage.request(url, param);
                var Trans = BaseManage.JsonDeserializer<TransObj>(jsonString);
                foreach (var item in Trans.retData.trans_result)
                {
                    trans += item.dst + "\r\n";
                }
                result.Dst = trans;
                
            }
            catch(Exception e){}
            return View(result);
        }

        public ActionResult ImportExcel(string status = null)
        {
            ViewBag.list = SetLibraryInfo(_libraryManage.GetLibrary());
            ViewBag.status = status;
            return View();
        }

        [HttpPost]
        public ActionResult Upload(string url, int Library)
        {
            HttpPostedFileBase file = Request.Files["url"];
            url = string.Empty;
            string errorMsg = string.Empty;

            ////存入文件
            if (file.ContentLength > 0)
            {
                url = Server.MapPath("~/Upload/") + System.IO.Path.GetFileName(file.FileName);
                file.SaveAs(url);
            }

            var result = _wordsManage.UpLoad(url, Library, out errorMsg) && _wordsManage.RemoveFile(url, out errorMsg);
            if (result)
                return RedirectToAction("ImportExcel", new { status = "t" });
            else
                return RedirectToAction("ImportExcel", new { status = "f" });
        }

        public JsonResult Fliterlibrary(int LibraryId)
        {
            RemoveSession("words");
            this.HttpContext.Session["LibraryId"] = LibraryId;
            return Json(new { IsSuccess = true });
        }

        public JsonResult LastMark()
        {
            RemoveSession("words");
            var words = _markManage.GetMarkedWords(_user.UserId, _LibraryId);
            int lastId=0;
            int page=1;
            if (words.Count()>0)
            {
               lastId = words.OrderBy(t => t.spell).LastOrDefault().WordId;
               page = _markManage.GetLastMarkPage(lastId, _LibraryId);
            }           
            this.HttpContext.Session["Page"] = page;
            return Json(new { IsSuccess = true});
        }

        public JsonResult CheckAnswer(string Ask, string Answer, string Ids, int Test,int enhanced)
        {
           
            int count = 0;
            int falsecount = 0;
            var WordId = new List<int>();
            var UserId = _user.UserId;
            var IdList = Ids.Split('/');
            var asklist = Ask.Split('/');
            var Answerlist = Answer.Split('/');
            var falselist="";
            var falseid = "";

            for (int i = 0; i < Answerlist.Length - 1; i++)
            {                                
                if (IdList[i] == "undefined")
                    break;
                if (asklist[i] != Answerlist[i])
                {
                    falsecount++;
                    falselist += i + "/";
                    falseid += IdList[i] + "/";
                }
                WordId.Add(int.Parse(IdList[i]));
                count++; 
            }
            //Test:0 for spell;1 for translate;enhanced:1 for enhanced
            if (enhanced==0)
               _scoreManage.SetScore(count, falsecount, UserId, WordId, Test);                                   
            return Json(new { fanswer = falselist,fid=falseid });
        }

        public JsonResult Create(WordInfo wordinfo)
        {
            bool result = true;
            List<int> libraryIdList = new List<int>();
            var word = SetWord(wordinfo);

            if (!string.IsNullOrEmpty(wordinfo.LibraryStr))
            {
                var LibraryArray = wordinfo.LibraryStr.Split('-');
                for (int i = 1; i < LibraryArray.Length; i++)
                {
                    libraryIdList.Add(int.Parse(LibraryArray[i]));
                }
            }
            else
                libraryIdList.Add(-1);

            result=_wordsManage.AddWord(word);
            if (result)
            {
                int wordId = _wordsManage.GetLastWord().WordId;
                result=_libraryManage.AddWordLibrary(wordId, libraryIdList);
            }

            return Json(new { IsSuccess = result });
        }

        public JsonResult Delete(int Id)
        {
            RemoveSession("words");
            string errorMsg = string.Empty;
            bool result = _markManage.DeleteMarkById(null, Id, out errorMsg);          
            if (result)
                result = _libraryManage.DeleteLibrary(Id, out errorMsg);
            if (result)
                result = _testedManage.DeleteTestedById(null, Id, out errorMsg);
            if(result)
                result = _wordsManage.DeleteWord(Id, out errorMsg);
            return Json(new { IsSuccess = result, ErrorMessage = errorMsg });
        }

        public JsonResult CleanReport(int Id)
        {          
            var result = _scoreManage.CleanScoreReport(Id);
            return Json(new { IsSuccess = result });
        }

        public JsonResult Search(string search)
        {
            //RemoveSession("words");
            try
            {
                var word = _wordsManage.Search(search, this.HttpContext.Session["LibraryId"] == null ? 0 : (int)this.HttpContext.Session["LibraryId"]);
                this.HttpContext.Session["words"] = word;
                return Json(new { IsSuccess = true });
            }
            catch
            {               
                return Json(new { IsSuccess = false});
            }
        }

        public JsonResult SetMark(string Marked, string WordId)
        {
            var result = _markManage.SetMark(int.Parse(Marked), int.Parse(WordId), _user.UserId);
            return Json(new { IsSuccess = result});
        }

        public JsonResult GetMarked()
        {
            try
            {
                var words = _markManage.GetMarkedWords(_user.UserId, GetConfiguationByCookie().LibraryId);
                this.HttpContext.Session["words"] = words;
                return Json(new { IsSuccess = true });
            }
            catch (Exception e) 
            {
                return Json(new { IsSuccess = false });
            }
        }

        public FileResult ExportExcel()
        {
            int LibraryId = this.HttpContext.Session["LibraryId"] == null ? 1 : (int)this.HttpContext.Session["LibraryId"];
            var wordbase = _wordsManage.GetWords(LibraryId).Select(t => new WordBase() 
            { 
                spell=t.spell,
                sentence=t.sentence,
                speak=t.speak,
                type=t.type,
                translate=t.translate
            }).ToList();
            return ReflectExportExcel<WordBase>(wordbase, "Wordlist");
        }

        private TransInfo TranslateFromDB(string query, string from)
        {
            var words = new List<Word>();
            var result = new TransInfo();
            if (from == "English")
            {
                words = _wordsManage.GetWordsBySpell(query);
                foreach (var item in words)
                {
                    result.Dst += item.translate + "\r\n";
                    result.Sentence += item.sentence + "\r\n";
                }
            }
            if (from == "Chinese")
            {
                words = _wordsManage.GetWordsByTranslate(query);
                foreach (var item in words)
                {
                    result.Dst += item.spell + "\r\n";                  
                    result.Sentence += item.sentence + "\r\n";
                }
            }
            result.Src = query;
            return result;
        }

        private List<Word> GetWords(List<Word> words, int Page, int PageSize, int LibraryId, out int WordCount)
        {
            if (words == null)
            {
                WordCount = _wordsManage.GetCount(LibraryId);
                words = _wordsManage.GetWords(LibraryId);
            }
            else
                WordCount = words.Count();
            return SetPage(Page, PageSize, words);
        }
    }
}