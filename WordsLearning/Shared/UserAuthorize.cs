using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using System.Web.Security;
using Model;
using Business;

namespace WordsLearning.Shared
{
    public class UserAuthorize : AuthorizeAttribute
    {
        public UserAuthorize(int Power)
        {
            this._Power = Power;
        }

        //0 for admin;1 for user
        public int _Power { get; set; }

        public override void OnAuthorization(AuthorizationContext filterContext)
        {
            //获取Cookies中的Login
            var memberValidation = System.Web.HttpContext.Current.Request.Cookies.Get("usercookie");
            //如果memberValidation为null  或者 memberValidation不等于Success

            if (memberValidation == null)
            {
                //页面跳转到 登录页面
                filterContext.Result = new RedirectToRouteResult(new RouteValueDictionary(new { controller = "User", action = "Login", ReturnUrl = filterContext.HttpContext.Request.Url.AbsoluteUri }));
                return;
            }
            else
            {
                if (_Power == 0)
                {
                    var userManage=new UserManage();
                    var usercookie = memberValidation.Value;
                    var user = userManage.GetUserByCookie(usercookie);
                    if (user.Power == 1)
                        filterContext.Result = new RedirectToRouteResult(new RouteValueDictionary(new { controller = "User", action = "Login" }));
                }
                return;
            }
            //string url = HttpContext.Current.Request.Url.Query;
            //url = url.Replace("?returnurl=", "");
            //if (!string.IsNullOrEmpty(url));
            //{
            //    Response.Redirect(url);  
            //}
        }
    }
}
