using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WordsLearning.Models
{
    public class WordBase
    {
        public string spell { get; set; }
        public string type { get; set; }
        public string speak { get; set; }
        public string translate { get; set; }
        public string sentence { get; set; }
    }
}