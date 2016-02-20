using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WordsLearning.Models
{
    public class WordInfo:WordBase
    {
        public WordInfo()
        {
            LibraryList = new List<LibraryInfo>();
        }

        public int Id { get; set; }       
        public int Marked { get; set; }
        public string LibraryStr { get; set; }
        public string Answer { get; set; }

        public List<LibraryInfo> LibraryList { get; set; }
    }
}