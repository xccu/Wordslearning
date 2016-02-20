using Entites.Repositories;
using Model;
using Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace Business
{
    public class ConfiguationManage
    {
        private IConfiguationRepository _ConfiguationRepository { get; set; }

        public ConfiguationManage()
        {
            _ConfiguationRepository = new ConfiguationRepository(new EFcontext());
        }

        public Configuation GetConfiguationByUserId(int UserId)
        {
            if (UserId == 0)
                return new Configuation();
            return _ConfiguationRepository.Filter(t => t.UserId == UserId).FirstOrDefault();
        }

        public Configuation GetConfiguationByCookie(string configuationcookie)
        {
            if (string.IsNullOrEmpty(configuationcookie))
                return new Configuation();
            var userarray = (HttpUtility.UrlDecode(configuationcookie, System.Text.Encoding.UTF8)).Split('|');
            var configuation = new Configuation()
            {
                ConfiguationId = int.Parse(userarray[0]),
                LibraryId = int.Parse(userarray[1]),
                StyleNum = int.Parse(userarray[2]),
                UserId = int.Parse(userarray[3])
            };
            return configuation;
        }

        public string SetConfiguationCookie(Configuation configuation)
        {
            string usercookie = string.Empty;
            usercookie =configuation.ConfiguationId + "|" + configuation.LibraryId + "|" + configuation.StyleNum+"|"+configuation.UserId;
            string result = HttpUtility.UrlEncode(usercookie, System.Text.Encoding.UTF8);
            return result;
        }

        public bool UpdateConfiguation(int UserId,int LibraryId, out Configuation configuation)
        {
            configuation = new Configuation();
            try
            {
                configuation = GetConfiguationByUserId(UserId);
                configuation.LibraryId = LibraryId;
                _ConfiguationRepository.Update(configuation);
                return true;
            }
            catch (Exception e) { return false; }
        }

        public void CreateConfiguation(int UserId,int LibraryId)
        {
            var Configuation=new Configuation(){UserId=UserId,LibraryId=LibraryId,StyleNum=0};
            _ConfiguationRepository.Add(Configuation);
        }
    }
}
