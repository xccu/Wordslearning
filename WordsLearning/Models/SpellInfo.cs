using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WordsLearning.Models
{
    public class SpellInfo
    {
        public SpellInfo()
        {
            this.wordinfo = new List<WordInfo>();
        }

        public int Id { get; set; }
        public string wordspell { get; set; }
        public List<WordInfo> wordinfo { get; set; }
    }
}