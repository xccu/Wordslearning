using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Repositories;
using Model;

namespace Entites.Repositories
{
    public class ReadingRepository : EFRepositoryBase<Reading>,IReadingRepository
    {
        private readonly EFcontext EF;

        public ReadingRepository(EFcontext context) : base(context)
        {
            EF = context;
        }

        public int updateReadingWithoutUrl(Reading read)
        {
            var re = EF.Readings.Where(t => t.ReadingId == read.ReadingId).FirstOrDefault();
            re.Title = read.Title;
            //re.Date = read.Date;
            re.From = read.From;
            re.Content = read.Content;
            return EF.SaveChanges();
        }

        public void Dispose()
        {
            EF.Dispose();
        }
    }
}
