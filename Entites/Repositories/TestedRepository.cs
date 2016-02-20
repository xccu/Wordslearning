using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Repositories;
using Model;

namespace Entites.Repositories
{
    public class TestedRepository : EFRepositoryBase<Tested>, ITestedRepository
    {
        private readonly EFcontext EF;

        public TestedRepository(EFcontext context) : base(context)
        {
            EF = context;
        }

        public void Dispose()
        {
            EF.Dispose();
        }
    }
}
