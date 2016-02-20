using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Repositories;
using Model;

namespace Entites.Repositories
{
    public class UserRepository:EFRepositoryBase<User>,IUserRepository
    {
        private readonly EFcontext EF;

        public UserRepository(EFcontext context) : base(context)
        {
            EF = context;
        }

        public int GetIdByName(string name)
        {
            var result = EF.Users.FirstOrDefault(t => t.Name == name);
            if (result != null)
                return result.UserId;
            else
                return 0;
        }

        public void updateWithoutUrl(User user)
        {
            var us = EF.Users.Where(t => t.UserId == user.UserId).FirstOrDefault();
            us.Name = user.Name;
            us.Password = user.Password;
            us.Sex = user.Sex;
            us.Status = user.Status;
            us.Age = user.Age;
            us.Country = user.Country;
            us.Power = user.Power;
            EF.SaveChanges();
        }

        public void Dispose()
        {
            EF.Dispose();
        }
    }
}
