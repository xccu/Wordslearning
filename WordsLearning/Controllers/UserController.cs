using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Business;
using WordsLearning.Models;
using Model;
using WordsLearning.Shared;

namespace WordsLearning.Controllers
{
    public class UserController : BaseController
    {
        public UserManage _userManage { get { return new UserManage(); } }
        public WordsManage _wordsManage { get { return new WordsManage(); } }
        public ScoreManage _scoreManage { get { return new ScoreManage(); } }
        public LibraryManage _libraryManage { get { return new LibraryManage(); } }

        public User _user { get { return GetUserByCookie(); } }       
        public int _LibraryId { get { return GetConfiguationByCookie().LibraryId; } }

        public ActionResult Login(string ReturnUrl)
        {
            if (!string.IsNullOrEmpty(ReturnUrl))
                ViewBag.ReturnUrl = ReturnUrl;            
            return View();
        }

        public ActionResult Register()
        {
            ViewBag.list = SetLibraryInfo(_libraryManage.GetLibrary());
            return View();
        }

        [UserAuthorize(1)]
        public ActionResult MyInfo()
        {
            try
            {
                int wordscount = _wordsManage.GetCount(_LibraryId);
                var scoreinfo = SetScoreInfo(_scoreManage.GetScore(_user.UserId));
                var userinfo = SetUserInfo(_user);

                userinfo.Scoreinfo = scoreinfo;

                ViewBag.LibraryId = _LibraryId;
                ViewBag.list = SetLibraryInfo(_libraryManage.GetLibrary());
                ViewBag.wordcount = wordscount;
                ViewBag.TotalFinished = scoreinfo.SpellCount + scoreinfo.TransCount;
                ViewBag.TotalCorrectRate = (int)(scoreinfo.CorrectRate * 100);
                ViewBag.SpellCorrect = scoreinfo.SpellCount - scoreinfo.FalseSpell;
                ViewBag.SCorrectRate = (int)(scoreinfo.SCorrectRate * 100);
                ViewBag.TranslateCorrect = scoreinfo.TransCount - scoreinfo.FalseTrans;
                ViewBag.TCorrectRate = (int)(scoreinfo.TCorrectRate * 100);
                ViewBag.sfinishrate = (int)(((float)scoreinfo.SpellCount / (float)wordscount) * 100);
                ViewBag.tfinishrate = (int)(((float)scoreinfo.TransCount / (float)wordscount) * 100);

                return View(userinfo);
            }
            catch (Exception e) { return View(new UserInfo()); };         
        }

        [UserAuthorize(0)]
        public ActionResult UserManage()
        {
            int Page = GetPageNumber();        
            int UserCount = 0;
            List<User> user = (List<User>)this.HttpContext.Session["users"];

            if (user == null)
            {
                UserCount = _userManage.GetCount();
                user = _userManage.GetUsers();
            }
            else
                UserCount = user.Count();

            user = SetPage(Page, 5, user);
            List<int> PageList = GetPageList(5, UserCount);
            var result = SetUserInfo(user);
            ViewBag.UserCount = UserCount;
            ViewBag.PageList = PageList;
            ViewBag.CurrentPage = Page;
            return View(result);
        }

        [UserAuthorize(0)]
        public ActionResult Edit(int id,string status=null)
        {
            ViewBag.status = status;
            var user = _userManage.GetUserById(id);
            var result = SetUserInfo(user);
            return View(result);
        }

        public ActionResult Exit()
        {
            RemoveCookie();
            RemoveSession();
            return View("Login");
        }

        [ChildActionOnly]
        public ActionResult LeftPartial()
        {           
            var page=_userManage.GetPage(_user.Power);
            var result = page.Select(t => new PageInfo() 
            {
                ActionName=t.ActionName,
                PageId=t.PageId,
                ControllerName=t.ControllerName,
                PageName=t.PageName,
                Power=t.Power
            }).ToList();
            return PartialView("_LeftPartial", result);
        }

        [HttpPost]
        public ActionResult CreateUser(UserInfo userinfo)
        {
            ConfiguationManage configuationManage = new ConfiguationManage();
            HttpPostedFileBase file = Request.Files["Imgurl"];
            //存入文件
            if (file.ContentLength > 0)
                file.SaveAs(Server.MapPath("~/Photo/") + System.IO.Path.GetFileName(file.FileName));

            userinfo.Imgurl = string.IsNullOrEmpty(file.FileName) ? "" : "/Photo/" + System.IO.Path.GetFileName(file.FileName);
            var user = SetUser(userinfo);
            try
            {
                _userManage.CreateUser(user);
                int UserId = _userManage.GetIdByName(user.Name);
                
                configuationManage.CreateConfiguation(UserId, userinfo.LibraryId==0?1:userinfo.LibraryId);
                _scoreManage.CreatScoreReport(UserId);
                
                //1 for register;0 for create
                if (userinfo.Tag == 1)
                    return RedirectToAction("Login", "User", "");
                else
                    return RedirectToAction("WordsList", "Words", "");
            }
            catch (Exception e)
            {
                // return Json(new { IsSuccess = false});
                if (userinfo.Tag == 1)
                    return Content("<script >alert('Create failed:" + e.Message + "');window.location.href='Words/WordsList'</script >;", "text/html");
                else
                    return Content("<script >alert('Create failed:" + e.Message + "');window.location.href='User/Login'</script >;", "text/html");
            }
        }

        [HttpPost]
        public ActionResult Update(UserInfo userinfo)
        {
            HttpPostedFileBase file = Request.Files["Imgurl"];
            //存入文件
            if (file.ContentLength > 0)
            {
                string err="";
                _userManage.RemovePhotoById(userinfo.Id, Server.MapPath("~/Photo/"), out err);
                file.SaveAs(Server.MapPath("~/Photo/") + System.IO.Path.GetFileName(file.FileName));
            }
            userinfo.Imgurl = string.IsNullOrEmpty(System.IO.Path.GetFileName(file.FileName)) ? "" : "/Photo/" + System.IO.Path.GetFileName(file.FileName);
            var user = SetUser(userinfo);

            try
            {
                _userManage.UpdateUser(user);
                if (userinfo.Tag == 1)//1 for user option
                {
                    return Content("<script >alert('Update Succeed,please Re login');window.location.href='login'</script >;", "text/html");
                }
                else
                    return RedirectToAction("Edit", new { id = userinfo.Id, status = "t" });
            }
            catch (Exception e)
            {
                if (userinfo.Tag == 1)
                    return Content("<script >alert('Update failed:" + e.Message + "');window.location.href='WordsList'</script >;", "text/html");
                else
                    return RedirectToAction("Edit", new {id=userinfo.Id, status = "f" });
            }
        }

        public string GetInfo()
        {
            return _user.Name;
        }

        public JsonResult GetAdmin()
        {
            try
            {
                this.HttpContext.Session["users"] = _userManage.GetAdmin();
                return Json(new { IsSuccess = true });
            }
            catch (Exception e)
            {
                return Json(new { IsSuccess = false });
            }
        }

        public JsonResult LoginVaild(string name, string password)
        {
            Configuation configuation = new Configuation();
            User user = new User();
            try
            {
                bool valid = _userManage.ValidUser(name, password, out user, out configuation);
                if (valid)
                    SetCookie(user, configuation);
                RemoveSession();
                return Json(new { IsSuccess = valid, ErrorMessage = "Incorrect Login Message" });
            }
            catch (Exception e) { return Json(new { IsSuccess = false, ErrorMessage = e.Message }); }
        }

        public JsonResult UpdateLibrary(int LibraryId, int UserId)
        {
            Configuation configuation = new Configuation();
            ConfiguationManage configuationManage = new ConfiguationManage();
            var result = configuationManage.UpdateConfiguation(UserId,LibraryId,out configuation);
            if (result)
            { 
                result = _scoreManage.CleanScoreReport(UserId);
                SetCookie(_user, configuation);
            }
            return Json(new { IsSuccess = result });
        }

        public JsonResult Search(string search)
        {
            try
            {
                var user = _userManage.Search(search);
                this.HttpContext.Session["users"] = user;
                return Json(new { IsSuccess = true, ErrorMessage="" });
            }
            catch(Exception e)
            {
                return Json(new { IsSuccess = false, ErrorMessage=e.Message });
            }
        }

        public JsonResult Delete(int Id)
        {
            RemoveSession("users");
            MarkManage markManage = new MarkManage();
            TestedManage testedManage = new TestedManage();
            string errorMsg = string.Empty;
            bool result = true;

            result = _scoreManage.DeleteScoreReportByUserId(Id, out errorMsg);
            if (result)
                result = markManage.DeleteMarkById(Id, null, out errorMsg);
            if (result)
                result = testedManage.DeleteTestedById(Id, null, out errorMsg);
            if (result)
                result = _userManage.RemovePhotoById(Id, Server.MapPath("~/Photo/"), out errorMsg);
            if (result)
                result = _userManage.DeleteUser(Id, out errorMsg);
            
            return Json(new { IsSuccess = true, ErrorMessage = errorMsg });
        }

        public JsonResult ValidNewUser(string username)
        {
            try
            {
                var result = _userManage.ValidNameExist(username);
                return Json(new { IsSuccess = result, ErrorMessage="Username Exist" });
            }
            catch (Exception e)
            { 
                return Json(new { IsSuccess = false,ErrorMessage=e.Message }); 
            }
        }

        public FileResult ExportExcel()
        {
            var user = this.HttpContext.Session["users"] == null ? _userManage.GetUsers() : (List<User>)this.HttpContext.Session["users"];
            var userbase = user.Select(t => new UserBase()
            {
                Name = t.Name,
                Password = t.Password,
                Age = t.Age,
                Sex = t.Sex,
                Country = t.Country,
                Imgurl = t.Imgurl,
                Power = t.Power,
                Status = t.Status,
            }).ToList();
            return ReflectExportExcel<UserBase>(userbase, "Userlist");
        }
    }
}