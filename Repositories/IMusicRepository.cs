using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Repositories
{
    public interface IMusicRepository:IRepository<Music>
    {
        int updateWithoutUrl(Music music);
    }
}
