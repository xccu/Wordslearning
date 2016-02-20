using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Repositories;
using Model;

namespace Entites.Repositories
{
    public class MarkRepository : EFRepositoryBase<Mark>,IMarkRepository
    {
        private readonly EFcontext EF;

        public MarkRepository(EFcontext context) : base(context)
        {
            EF = context;
        }

        public List<Mark> GetMarked(int UserId)
        {
           return EF.Marks.Where(t => t.Marked == 1&&t.UserId==UserId).ToList();
        }

        public void Dispose()
        {
            EF.Dispose();
        }
    }
}
