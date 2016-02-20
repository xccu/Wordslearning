using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Repositories;
using Model;

namespace Entites.Repositories
{
    public class PageRepository : EFRepositoryBase<Page>,IPageRepository
    {
        private readonly EFcontext EF;

        public PageRepository(EFcontext context) : base(context)
        {
            EF = context;
        }

        public void Dispose()
        {
            EF.Dispose();
        }
    }
}
