using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using System.Web.Security;
using Business;
using Model;

namespace WordsLearning.Shared
{
    public class PowerValid : AuthorizeAttribute
    {
        public override void OnAuthorization(AuthorizationContext filterContext)
        {
            //获取Cookies中的Login
            var memberValidation = System.Web.HttpContext.Current.Request.Cookies.Get("userstring");
           
            //如果memberValidation为null  或者 memberValidation不等于Success
            if (memberValidation != null)
            {
                var userstring = memberValidation.Value;
                var user = GetUserByCookie(userstring);
                if(user.Power==1)
                    filterContext.Result = new RedirectToRouteResult(new RouteValueDictionary(new { controller = "User", action = "Login" }));
                    //filterContext.Result = new RedirectToRouteResult(new RouteValueDictionary(new { controller = "User", action = "Login", ReturnUrl = filterContext.HttpContext.Request.Url.AbsoluteUri }));//页面跳转到 登录页面
                return;
            }
            //string url = HttpContext.Current.Request.Url.Query;
            //url = url.Replace("?returnurl=", "");
            //if (!string.IsNullOrEmpty(url));
            //{
            //    Response.Redirect(url);  
            //}
            //通过验证
            return;
        }

        //public override void OnAuthorization(AuthorizationContext filterContext)
        //{
        //    base.OnAuthorization(filterContext);
        //    if (filterContext.Result is HttpUnauthorizedResult)
        //    {
        //        filterContext.Result = new RedirectResult(
        //            string.Concat(FormsAuthentication.LoginUrl,
        //                         "?ReturnUrl=",
        //                         filterContext.HttpContext.Server.UrlEncode(filterContext.HttpContext.Request.Url.AbsoluteUri)));
        //    }

        //}

        public User GetUserByCookie(string xmluser)
        {
            if (string.IsNullOrEmpty(xmluser))
                return new User() { Id = -1, Name = "", Power = 1, Status = 0 };
            var userarray = (HttpUtility.UrlDecode(xmluser, System.Text.Encoding.UTF8)).Split('&');
            var user = new User()
            {
                Id = int.Parse(userarray[0]),
                Name = userarray[1],
                Password = userarray[2],
                Power = int.Parse(userarray[3]),
                Status = int.Parse(userarray[4]),
                Age = int.Parse(userarray[5]),
                Sex = userarray[6],
                Country = userarray[7],
                Imgurl = userarray[8],
            };
            return user;
        }
    }
}