using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Model;
using Repositories;

namespace Entites.Repositories
{
    public class ConfiguationRepository : EFRepositoryBase<Configuation>, IConfiguationRepository
    {
        private readonly EFcontext EF;

        public ConfiguationRepository(EFcontext context) : base(context)
        {
            EF = context;
        }
    }
}
