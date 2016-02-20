using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Repositories;
using Model;

namespace Entites.Repositories
{
    public class LibraryRepository : EFRepositoryBase<Library>,ILibraryRepository
    {
        private readonly EFcontext EF;

        public LibraryRepository(EFcontext context) : base(context)
        {
            EF = context;
        }

        public void Dispose()
        {
            EF.Dispose();
        }
    }
}
