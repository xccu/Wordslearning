using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Repositories;
using Model;

namespace Entites.Repositories
{
    public class WordRepository : EFRepositoryBase<Word>, IWordsRepository
    {

        public WordRepository(EFcontext context) : base(context)
        {

        }

        public void Dispose()
        {
            EF.Dispose();
        }
    }
}
