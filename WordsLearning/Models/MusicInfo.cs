using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WordsLearning.Models
{
    public class MusicInfo
    {
        public MusicInfo()
        {
            mlist = new Dictionary<int, string>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public string Singer { get; set; }
        public string Url { get; set; }
        public string Lrc { get; set; }
        public DateTime Date { get; set; }

        public Dictionary<int, string> mlist { get; set;}

    }
}