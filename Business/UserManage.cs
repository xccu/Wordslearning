using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Entites.Repositories;
using Model;
using System.Linq.Expressions;
using System.IO;
using System.Xml.Serialization;
using System.Web;
using Model.Enum;
using Repositories;

namespace Business
{
    public class UserManage:BaseManage
    {
        private IUserRepository _UserRepository { get; set; }
        private IPageRepository _PageRepository { get; set; }
        private IConfiguationRepository _ConfiguationRepository { get; set; }

        public UserManage()
        {
            _UserRepository = new UserRepository(new EFcontext());
            _PageRepository = new PageRepository(new EFcontext());
            _ConfiguationRepository = new ConfiguationRepository(new EFcontext());
        }

        public bool ValidUser(string name, string password, out User user, out Configuation configuation)
        {
            user = new User();
            configuation = new Configuation();

            var User = _UserRepository.Filter(t => t.Name == name && t.Password == password).FirstOrDefault();
            var Configuation = _ConfiguationRepository.Filter(t => t.UserId == User.UserId).FirstOrDefault();
            if (User != null)
            {
                if (User.Status == 0)
                {
                    user = User;
                    configuation = Configuation;
                    return true;
                }
            } 
            return false;
        }

        public bool ValidNameExist(string name)
        {
            int id = GetIdByName(name);
            if (id != 0)
                return false;
            return true;
        }

        public List<User> GetUsers()
        {
            var result = GetCache("GetUsers") as List<User>;
            if (result != null)
                return result;
            result = _UserRepository.GetAll().ToList();
            SetCache("GetUsers", result);
            return result;
        }

        public List<User> GetAdmin()
        {
            return _UserRepository.Filter(t => t.Power == 0).ToList();
        }

        public int GetIdByName(string name)
        {
            var id = _UserRepository.GetIdByName(name);
            return id;
        }

        public User GetUserById(int id)
        {
            User user = new User();
            var result = _UserRepository.GetById(id);
            user = result;
            return result;
        }

        public int GetCount()
        {
            return _UserRepository.GetCount();
        }

        public bool CreateUser(User user)
        {
            _UserRepository.Add(user);
            RemoveCache("GetUsers");
            return true;
        }

        public void UpdateUser(User user)
        {
            if (string.IsNullOrEmpty(user.Imgurl))
                _UserRepository.updateWithoutUrl(user);
            else
                _UserRepository.Update(user);
            RemoveCache("GetUsers");          
        }

        public bool DeleteUser(int Id, out string errorMsg)
        {
            errorMsg = string.Empty;
            try
            {
                _UserRepository.Delete(Id);
                RemoveCache("GetUsers");
                return true;               
            }
            catch (Exception e)
            {
                errorMsg = e.Message;
                return false;
            }
        }

        public bool RemovePhotoById(int Id,string root,out string errorMsg)
        {
            errorMsg=string.Empty;
            var filenames=GetUserById(Id).Imgurl.Split('/');
            root = root + filenames[2];
            return RemoveFile(root, out errorMsg);
        }

        public string SetUserCookie(User user)
        {
            string usercookie = string.Empty;
            usercookie = user.UserId + "|" + user.Name + "|" + user.Password + "|" + user.Power + "|" + user.Status + "|" + user.Age + "|" + user.Sex + "|" + user.Country + "|" + user.Imgurl;// +"|" + configuation.ConfiguationId + "|" + configuation.LibraryId + "|" + configuation.StyleNum;
            string result = HttpUtility.UrlEncode(usercookie, System.Text.Encoding.UTF8);
            return result;
        }

        public User GetUserByCookie(string usercookie)
        {
            if (string.IsNullOrEmpty(usercookie))
                return new User() { Name = "", Power = 1, Status = 0 };
            var userarray = (HttpUtility.UrlDecode(usercookie, System.Text.Encoding.UTF8)).Split('|');
            var user = new User()
            {
                UserId = int.Parse(userarray[0]),
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

        public List<User> Search(string search)
        {
            var result = _UserRepository.Filter(t => t.Name.Contains(search)).OrderBy(t => t.Name).ToList();
            return result;
        }

        public List<Page> GetPage(int power)
        {
            var result = new List<Page>();
            if (power == 0)
                result = _PageRepository.GetAll().ToList();
            else
                result = _PageRepository.Filter(t => t.Power == 1).ToList();
            return result;
        }
    }
}
