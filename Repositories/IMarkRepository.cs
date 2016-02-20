using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Repositories
{
    public interface IMarkRepository : IRepository<Mark>
    {
        List<Mark> GetMarked(int UserId);
    }
}
