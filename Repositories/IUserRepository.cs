using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Repositories
{
    public interface IUserRepository:IRepository<User>
    {
        int GetIdByName(string name);
        void updateWithoutUrl(User url);
    }
}
