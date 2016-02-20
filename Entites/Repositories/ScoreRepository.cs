using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Repositories;
using Model;

namespace Entites.Repositories
{
    public class ScoreRepository : EFRepositoryBase<Score>, IScoreRepository
    {
        private readonly EFcontext EF;

        public ScoreRepository(EFcontext context) : base(context)
        {
            EF = context;
        }

        public int DeleteReportByUserId(int UserId)
        {
            var entity = EF.Scores.FirstOrDefault(t=>t.UserId==UserId);
            if (entity != null)
            {
                EF.Scores.Remove(entity);
                return EF.SaveChanges();
            }
            return 0;
        }

        public void Dispose()
        {
            EF.Dispose();
        }
    }
}
