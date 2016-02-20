using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Entites.Repositories;
using Model;
using System.IO;
using System.Web;
using System.Net;
using System.Linq.Expressions;
using System.Data.OleDb;
using System.Data;
using Repositories;

namespace Business
{
    public class WordsManage:BaseManage
    {
        private IWordsRepository _WordRepository { get; set; }
        private ITestedRepository _TestedRepository { get; set; }
        private ILibraryRepository _LibraryRepository { get; set; }
        private IWordLibraryRepository _WordLibraryRepository { get; set; }

        public WordsManage()
        {
            _WordRepository = new WordRepository(new EFcontext());
            _TestedRepository = new TestedRepository(new EFcontext());
            _LibraryRepository = new LibraryRepository(new EFcontext());
            _WordLibraryRepository = new WordLibraryRepository(new EFcontext());
        }

        #region word
        public List<Word> Search(string search,int LibraryId)
        {
            var result = new List<Word>();
            if(LibraryId!=0)
                result = (from t1 in _WordRepository.Filter(t => t.spell.Contains(search) || t.translate.Contains(search)).OrderBy(t => t.spell).ToList()
                          join t2 in _WordLibraryRepository.Filter(t => t.LibraryId == LibraryId).ToList()
                              on t1.WordId equals t2.WordId
                          select t1).OrderBy(t => t.spell).ToList();
            else
                result = _WordRepository.Filter(t => t.spell.Contains(search) || t.translate.Contains(search)).OrderBy(t => t.spell).ToList();
            return result;
        }

        public List<Word> GetWords(int LibraryId = 0)
        {
            var result = new List<Word>();

            if (LibraryId == 0)
            {
                result = GetCache("GetWords") as List<Word>;
                if (result == null)
                {
                    result = _WordRepository.GetAll().OrderBy(t => t.spell).ToList();
                    SetCache("GetWords", result); // add in Cache
                }
            }
            else
            {
                result = GetCache("GetWords(" + LibraryId + ")") as List<Word>;
                if (result == null)
                {
                    //if (LibraryId == -1)
                    //    result = (from s in _WordRepository.GetAll().ToList()
                    //              where !(
                    //                      from t1 in _WordRepository.GetAll().ToList()
                    //                      join t2 in _WordLibraryRepository.GetAll()
                    //                      on t1.WordId equals t2.WordId
                    //                      select t1.WordId
                    //                    ).Contains(s.WordId)
                    //              select s).ToList();
                    result = (from t1 in _WordRepository.GetAll().ToList()
                              join t2 in _WordLibraryRepository.Filter(t => t.LibraryId == LibraryId)
                              on t1.WordId equals t2.WordId
                              select t1).OrderBy(t => t.spell).ToList();
                    SetCache("GetWords(" + LibraryId + ")", result); // add in Cache
                }
            }
                return result;
        }

        public List<Word> GetWordsBySpell(string spell,int LibraryId=0)
        {
            if (LibraryId == 0)
                return _WordRepository.Filter(t => t.spell == spell).OrderBy(t => t.WordId).ToList();                
            var result = (from t1 in _WordRepository.Filter(t => t.spell == spell).ToList()
                          join t2 in _WordLibraryRepository.Filter(t => t.LibraryId == LibraryId) 
                              on t1.WordId equals t2.WordId
                          select t1).OrderBy(t => t.spell).OrderBy(t => t.WordId).ToList();
            return result;
        }

        public List<Word> GetWordsByTranslate(string translate)
        {
            return _WordRepository.Filter(t => t.translate.Contains(translate)).OrderBy(t => t.WordId).ToList();
        }

        public List<Word> GetTenWords(int tag, int UserId, int LibraryId)
        {
            try
            {
                List<int> TestedIdList = (from t1 in _WordRepository.GetAll().ToList()
                              join t2 in _WordLibraryRepository.Filter(t => t.LibraryId == LibraryId)                             
                                  on t1.WordId equals t2.WordId
                              join t3 in _TestedRepository.Filter(t => t.tag == tag && t.UserId == UserId)
                                  on t2.WordId equals t3.WordId
                              select t1.WordId).ToList();

                var result = (from t1 in _WordRepository.Filter(t => !TestedIdList.Contains(t.WordId)).ToList()
                              join t2 in _WordLibraryRepository.Filter(t => t.LibraryId == LibraryId)
                                  on t1.WordId equals t2.WordId
                              select t1).OrderBy(t => Guid.NewGuid()).Take(10).ToList();
                return result;
            }
            catch (Exception e)
            {
                return null;
            }
        }

        public Word GetLastWord()
        {
            try
            {
                return _WordRepository.GetAll().ToList().LastOrDefault() ;
            }
            catch (Exception e)
            {
                return null;
            }
        }

        public Word GetWordById(int Id)
        {

            try
            {
                return _WordRepository.GetById(Id); 
            }
            catch (Exception e)
            {
                return null;
            }
        }

        public int GetCount(int LibraryId)
        {
            if(LibraryId==0)
                return(_WordRepository.GetCount());
            var result = (from t1 in _WordRepository.GetAll().ToList()
                          join t2 in _WordLibraryRepository.Filter(t => t.LibraryId == LibraryId)
                              on t1.WordId equals t2.WordId
                          select t1.WordId).Count();
            return result;
        }

        public List<int?> GetTestedWordsId(int tag, int UserId)
        {
            return _TestedRepository.Filter(t => t.tag == tag && t.UserId == UserId).Select(t => t.WordId).ToList();
        }

        public bool AddWord(Word word)
        {
            try
            {
                _WordRepository.Add(word);
                RemoveCache("GetWords");  //remove Cache
                return true;
            }
            catch {return false;}
        }

        private bool BulkAddWord(List<Word> word)
        {
            try
            {
                _WordRepository.BulkInsert(word);
                RemoveCache("GetWords");  //remove Cache
                return true;
            }
            catch { return false; }
        }

        public bool UpdateWord(Word word)
        {
            try
            {
                _WordRepository.Update(word);
                RemoveCache("GetWords");  //remove Cache
                return true;
            }
            catch { return false; }
        }

        public bool DeleteWord(int Id,out string errorMsg)
        {
            errorMsg = string.Empty;
            try
            {
                _WordRepository.Delete(Id);
                RemoveCache("GetWords");  //remove Cache  
                return true;
            }
            catch(Exception e) 
            {
                errorMsg = e.Message;
                return false; 
            }
        }
        #endregion

        public bool UpLoad(string file,int libraryId, out string errorMsg)
        {
            //E:\Wordlist2015-12-26 21-18-03.xls
            errorMsg="Upload failed";    

            string result = string.Empty;
            string strConn = "Provider=Microsoft.Jet.OLEDB.4.0;" + "Data Source=" + file + "; " + "Extended Properties=Excel 8.0;";
            try
            {
                OleDbDataAdapter myCommand = new OleDbDataAdapter("SELECT * FROM [Sheet1$]", strConn);
                DataSet myDataSet = new DataSet();
                myCommand.Fill(myDataSet, "Words");
                System.Data.DataTable dt = myDataSet.Tables["Words"].DefaultView.ToTable();
                return CreateListByDt(dt, libraryId);
            }
            catch (Exception e) { return false; }
        }

        private bool CreateListByDt(DataTable dt, int LibraryId)
        {
            RemoveCache("GetWords(" + LibraryId + ")");
            int row = dt.Rows.Count;
            int a = 0;
            try
            {
                for (int i = 0; i < row; i++)
                {
                    a++;
                    var words = new Word();
                    words.spell = dt.Rows[i][0].ToString().Trim();
                    words.speak = dt.Rows[i][1].ToString().Trim();

                    var info = dt.Rows[i][2].ToString().Split('.');
                    words.type = info[0].Trim() + ".";
                    words.translate = info[1].Trim();

                    // words.sentence = dt.Rows[i][4].ToString();
                    if (_WordRepository.Filter(t => t.spell == words.spell && t.type == words.type).Count() == 0)
                        _WordRepository.Add(words);                     
                    int wordId = _WordRepository.Filter(t => t.spell == words.spell && t.type == words.type).FirstOrDefault().WordId;
                    _WordLibraryRepository.Add(new WordLibrary() { WordId = wordId, LibraryId = LibraryId });
                }
                return true;
            }
            catch (Exception e) { return false; }
        }


        //private bool CreateListByDt(DataTable dt, int LibraryId)
        //{
        //    int row = dt.Rows.Count;
        //    //var result = new List<Word>();
        //    try
        //    {
        //        for (int i = 0; i < row; i++)
        //        {
        //            var words = new Word();
        //            words.spell = dt.Rows[i][0].ToString();
        //            words.type = dt.Rows[i][1].ToString();
        //            words.speak = dt.Rows[i][2].ToString();
        //            words.translate = dt.Rows[i][3].ToString();
        //            words.sentence = dt.Rows[i][4].ToString();
        //            _WordRepository.Add(words);

        //            int wordId = _WordRepository.Filter(t => t.spell == words.spell && t.type == words.type).FirstOrDefault().WordId;
        //            var Library = new WordLibrary() { WordId = wordId, LibraryId = LibraryId };
        //            _WordLibraryRepository.Add(Library);
        //        }
        //        return true;
        //    }
        //    catch (Exception e) { return false; }
        //}

        //private bool CreateListByDt(DataTable dt)
        //{
        //    int row = dt.Rows.Count;
        //    var result = new List<Word>();
        //    for (int i = 0; i < row; i++)
        //    {
        //        var words = new Word();
        //        words.spell = dt.Rows[i][0].ToString();
        //        words.type = dt.Rows[i][1].ToString();
        //        words.speak = dt.Rows[i][2].ToString();
        //        words.translate = dt.Rows[i][3].ToString();
        //        words.sentence = dt.Rows[i][4].ToString();
        //        result.Add(words);
        //    }
        //    return BulkAddWord(result);
        //}
    }
}
