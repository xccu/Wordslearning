using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Repositories
{
    public interface IReadingRepository:IRepository<Reading>
    {
        int updateReadingWithoutUrl(Reading read);
    }
}
