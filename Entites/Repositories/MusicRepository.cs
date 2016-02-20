using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Repositories;
using Model;

namespace Entites.Repositories
{
    public class MusicRepository : EFRepositoryBase<Music>,IMusicRepository
    {
        private readonly EFcontext EF;

        public MusicRepository(EFcontext context) : base(context)
        {
            EF = context;
        }

        public int updateWithoutUrl(Music music)
        {
            var mu = EF.Musics.Where(t => t.MusicId == music.MusicId).FirstOrDefault();
            mu.Name = music.Name;
            mu.Singer = music.Singer;
            mu.Lrc = music.Lrc;
            mu.Date = music.Date;
            return EF.SaveChanges();
        }

        public void Dispose()
        {
            EF.Dispose();
        }
    }
}
