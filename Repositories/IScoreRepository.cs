using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Repositories
{
    public interface IScoreRepository:IRepository<Score>
    {
        int DeleteReportByUserId(int UserId);
    }
}
