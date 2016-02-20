using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Repositories;
using Model;

namespace Entites.Repositories
{
    public class WordLibraryRepository : EFRepositoryBase<WordLibrary>,IWordLibraryRepository
    {
        private readonly EFcontext EF;

        public WordLibraryRepository(EFcontext context) : base(context)
        {
            EF = context;
        }

        public void Dispose()
        {
            EF.Dispose();
        }
    }
}
