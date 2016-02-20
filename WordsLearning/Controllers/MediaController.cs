using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Business;
using WordsLearning.Models;
using Model;
using System.Reflection;
using Newtonsoft.Json;
using WordsLearning.Shared;

namespace WordsLearning.Controllers
{
    public class MediaController : BaseController
    {

        public MediaManage _mediaManage { get { return new MediaManage(); } }

        //
        // GET: /Media/
        public ActionResult Music(int id=0)
        {           
            var music = _mediaManage.GetMusicById(id);
            var musiclist = _mediaManage.GetMusics();
            var result = new MusicInfo();
            if (music != null)
                result = SetMusicInfo(music);

            foreach (var item in musiclist)
                result.mlist.Add(item.MusicId, item.Name);

            return View(result);
        }

        [UserAuthorize(0)]
        public ActionResult MusicManage()
        {
            List<Music> music = (List<Music>)this.HttpContext.Session["musics"];
            int Page = GetPageNumber();
            int MusicCount = 0;           

            if (music == null)
            {
                MusicCount = _mediaManage.GetMusicCount();
                music = _mediaManage.GetMusics();
            }
            else
                MusicCount = music.Count();
            music = SetPage(Page, 10, music);

            List<int> PageList = GetPageList(10, MusicCount);
            var musicinfo = SetMusicInfo(music);
            ViewBag.MusicCount = MusicCount;
            ViewBag.PageList = PageList;
            ViewBag.CurrentPage = Page;

            return View(musicinfo);
        }

        public ActionResult Reading()
        {
            List<Reading> reading = (List<Reading>)this.HttpContext.Session["readings"];
            int Page = GetPageNumber();
            int ReadingCount = 0;

            reading = GetReadings(reading, Page, 30, out ReadingCount);
            List<int> PageList = GetPageList(30, ReadingCount);            
            var readinglist = SetReadingInfo(reading);
            ViewBag.ReadingCount = ReadingCount;
            ViewBag.PageList = PageList;
            ViewBag.CurrentPage = Page;

            return View(readinglist);
        }

        [UserAuthorize(0)]
        public ActionResult ReadingManage()
        {
            List<Reading> reading = (List<Reading>)this.HttpContext.Session["readings"];
            int Page = GetPageNumber();
            int ReadingCount = 0;

            reading = GetReadings(reading, Page, 10, out ReadingCount);
            List<int> PageList = GetPageList(10, ReadingCount);
            var readinglist = SetReadingInfo(reading);
            ViewBag.ReadingCount = ReadingCount;
            ViewBag.PageList = PageList;
            ViewBag.CurrentPage = Page;

            return View(readinglist);
        }

        public ActionResult ReadingDetail(int Id)
        {
            var info = SetReadingInfo(_mediaManage.GetReadingById(Id));
            info.Content=info.Content.Replace("\r\n", "~");
            return View(info);
        }

        [UserAuthorize(0)]
        public ActionResult Edit(int Id, string status = null)
        {
            ViewBag.status = status;
            var musicinfo = SetMusicInfo(_mediaManage.GetMusics().FirstOrDefault(t => t.MusicId == Id));
            return View(musicinfo);
        }

        [UserAuthorize(0)]
        public ActionResult ReadingEdit(int id, string status=null)
        {
            ViewBag.status = status;
            var readinginfo = SetReadingInfo(_mediaManage.GetReadings().FirstOrDefault(t => t.ReadingId == id));
            return View(readinginfo);
        }

        [HttpPost]
        public ActionResult CreateMusic(MusicInfo info)
        {
            HttpPostedFileBase file = Request.Files["Url"];
            //存入文件
            if (file.ContentLength > 0)            
                file.SaveAs(Server.MapPath("~/music/") + System.IO.Path.GetFileName(file.FileName));
            info.Url = "/music/" + System.IO.Path.GetFileName(file.FileName);
            info.Date = DateTime.Now;
            var music = SetMusic(info);
            var result = _mediaManage.AddMusic(music);          
            if (result)
                return RedirectToAction("MusicManage", "Media");                             
            else
            {
                var rootPath = Url.Content("~");
                return Content("<script >alert('Create failed!');window.location.href='" + rootPath + "/Media/MusicManage'</script >;", "text/html");
            }
        }

        [HttpPost]
        public ActionResult CreateReading(ReadingInfo info)
        {
            HttpPostedFileBase file = Request.Files["Imgurl"];
            //存入文件
            if (file.ContentLength > 0)
                file.SaveAs(Server.MapPath("~/audio/") + System.IO.Path.GetFileName(file.FileName));
            info.Url = "/audio/" + System.IO.Path.GetFileName(file.FileName);
            info.Date = DateTime.Now;
            var reading = SetReading(info);
            var result = _mediaManage.AddReading(reading);
            if (result)
                return RedirectToAction("ReadingManage", "Media");
            else
            {
                var rootPath = Url.Content("~");
                return Content("<script >alert('Create failed!');window.location.href='" + rootPath + "/Media/ReadingManage'</script >;", "text/html");
            }
        }

        [HttpPost]
        public ActionResult Update(MusicInfo info)
        {
            HttpPostedFileBase file = Request.Files["Url"];
            //存入文件
            if (file.ContentLength > 0)
                file.SaveAs(Server.MapPath("~/music/") + System.IO.Path.GetFileName(file.FileName));           
            info.Url = string.IsNullOrEmpty(System.IO.Path.GetFileName(file.FileName)) ? "" : "/music/" + System.IO.Path.GetFileName(file.FileName);
            var music = SetMusic(info);
            var result = _mediaManage.UpdateMusic(music);
            if (result)
                return RedirectToAction("Edit", new { id = info.Id, status = "t" });       
            else
                return RedirectToAction("Edit", new { id = info.Id, status = "f" });   
        }

        [HttpPost]
        public ActionResult UpdateReading(ReadingInfo info)
        {
            HttpPostedFileBase file = Request.Files["Url"];
            //存入文件
            if (file.ContentLength > 0)
                file.SaveAs(Server.MapPath("~/audio/") + System.IO.Path.GetFileName(file.FileName));
            info.Url = string.IsNullOrEmpty(System.IO.Path.GetFileName(file.FileName)) ? "" : "/audio/" + System.IO.Path.GetFileName(file.FileName);
            var reading = SetReading(info);
            var result = _mediaManage.UpdateReadig(reading);
            if (result)
                return RedirectToAction("ReadingEdit", new { id = info.Id, status = "t" });
            else
                return RedirectToAction("ReadingEdit", new { id = info.Id, status = "f" });               
        }

        public JsonResult MusicSearch(string search)
        {
            try
            {
                var music = _mediaManage.SearchMusic(search);
                this.HttpContext.Session["musics"] = music;
                return Json(new { IsSuccess = true });
            }
            catch
            {
                return Json(new { IsSuccess = false });
            }
        }

        public JsonResult ReadingSearch(string search)
        {
            try
            {
                var result = _mediaManage.SearchReading(search);
                this.HttpContext.Session["readings"] = result;
                return Json(new { IsSuccess = true });
            }
            catch
            {
                return Json(new { IsSuccess = false });
            }
        }

        public JsonResult DeleteMusic(int Id)
        {
            RemoveSession("musics");
            var result=_mediaManage.DeleteMusic(Id);
            return Json(new { IsSuccess = result });
        }

        public JsonResult DeleteReading(int Id)
        {
            RemoveSession("readings");
            var result = _mediaManage.DeleteReading(Id);
            return Json(new { IsSuccess = result });
        }

        private List<Reading> GetReadings(List<Reading> reading, int Page, int PageSize, out int ReadingCount)
        {
            if (reading == null)
            {
                ReadingCount = _mediaManage.GetReadingCount();
                reading = _mediaManage.GetReadings();
            }
            else
                ReadingCount = reading.Count();
            return SetPage(Page, PageSize, reading);
        }
    }
}
