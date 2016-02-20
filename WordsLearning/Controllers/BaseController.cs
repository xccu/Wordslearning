using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Business;
using WordsLearning.Models;
using Model;
using System.Text;
using System.Reflection;
using System.IO;
using System.Data.OleDb;
using System.Data;

namespace WordsLearning.Controllers
{
    public class BaseController : ModelController
    {
        //
        // GET: /Base/

        #region Cookie
        public void SetCookie(User user, Configuation configuation)
        {
            UserManage userManage = new UserManage();
            ConfiguationManage configuationManage = new ConfiguationManage();
            string UserCookie = userManage.SetUserCookie(user);
            string ConfiguationCookie = configuationManage.SetConfiguationCookie(configuation);
            Response.Cookies.Add(new HttpCookie("usercookie", UserCookie));
            Response.Cookies.Add(new HttpCookie("configuationcookie", ConfiguationCookie));
        }

        public User GetUserByCookie()
        {
            UserManage userManage = new UserManage();
            string UserCookie = Request.Cookies["usercookie"] == null ? "" : Request.Cookies["usercookie"].Value;
            return userManage.GetUserByCookie(UserCookie);
        }

        public Configuation GetConfiguationByCookie()
        {
            ConfiguationManage configuationManage = new ConfiguationManage();
            string ConfiguationCookie = Request.Cookies["configuationcookie"] == null ? "" : Request.Cookies["configuationcookie"].Value;
            return configuationManage.GetConfiguationByCookie(ConfiguationCookie);
        }

        public void RemoveCookie()
        {
            if (Request.Cookies["usercookie"] != null)
            {
                Response.Cookies["usercookie"].Expires = DateTime.Now.AddDays(-1);
            }
        }
        #endregion

        public void RemoveSession(string SessionName=null)
        {
            if (SessionName != null)
                this.HttpContext.Session.Remove(SessionName);
            else
                this.HttpContext.Session.RemoveAll();
        }

        public FileResult ReflectExportExcel<T>(IList<T> list, string FileName)
        {
            var sbHtml = new StringBuilder();
            var lstTitle = new List<string>();
            object obj;
            sbHtml.Append("<table border='1' cellspacing='0' cellpadding='0' class='tinytable'>");
            sbHtml.Append("<thead><tr>");
            if (list.Count > 0)
            {
                PropertyInfo[] propertys = list[0].GetType().GetProperties();
                foreach (PropertyInfo pi in propertys)
                {
                    lstTitle.Add(pi.Name);
                }

                foreach (var item in lstTitle)
                {
                    sbHtml.AppendFormat("<th>{0}</th>", item);
                }
                sbHtml.Append("</tr></thead>");
                foreach (var item in list)
                {
                    sbHtml.Append("<tr>");
                    foreach (PropertyInfo pi in propertys)
                    {
                        obj = pi.GetValue(item, null) ?? DBNull.Value;
                        sbHtml.AppendFormat("<td style='font-size: 12px;height:20px;'>{0}</td>", HttpUtility.UrlDecode(obj.ToString(), System.Text.Encoding.UTF8));
                    }
                    sbHtml.Append("</tr>");
                }
                sbHtml.Append("</table>");
            }

            ////第一种:使用FileContentResult
            byte[] fileContents = Encoding.UTF8.GetBytes(sbHtml.ToString());
            //return File(fileContents, "application/ms-excel", "fileContents.xls");

            //第二种:使用FileStreamResult
            var fileStream = new MemoryStream(fileContents);
            return File(fileStream, "application/ms-excel", FileName + DateTime.Now.ToString() + ".xls");

            //第三种:使用FilePathResult
            //服务器上首先必须要有这个Excel文件,然会通过Server.MapPath获取路径返回.
            //var fileName = Server.MapPath("~/Files/fileName.xls");
            //return File(fileName, "application/ms-excel", "fileName.xls");
        }

        #region Page
        public int GetPageNumber()
        {
            int Page = this.HttpContext.Session["Page"] == null ? 1 : (int)this.HttpContext.Session["Page"];
            RemoveSession("Page");
            return Page;
        }

        public List<int> GetPageList(int PageSize, int Count)
        {
            var result = new List<int>();
            int pagecount = Count % PageSize == 0 ? Count / PageSize : (Count / PageSize) + 1;
            for (int i = 1; i <= pagecount; i++)
            {
                result.Add(i);
            }
            return result;
        }

        public JsonResult PageSkip(int Index, int PageSize)
        {
            this.HttpContext.Session["Page"] = Index;
            return Json(new { IsSuccess = true, Index = Index });
        }

        public List<T> SetPage<T>(int index, int PageSize, List<T> list)
        {
            if (PageSize == 0)
                return list;
            return list.Skip(PageSize * (index - 1)).Take(PageSize).ToList();
        }
        #endregion
    }
}
