using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WordsLearning.Models
{
    public class WordLibraryListInfo
    {
        public WordLibraryListInfo()
        {
            WordInfo = new List<WordInfo>();
            LibraryInfo = new List<LibraryInfo>();
        }

        public List<WordInfo> WordInfo { get; set; }
        public List<LibraryInfo> LibraryInfo { get; set; }
    }
}