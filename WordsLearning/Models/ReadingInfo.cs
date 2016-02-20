using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WordsLearning.Models
{
    public class ReadingInfo
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string From { get; set; }
        public string Url { get; set; }
        public string Content { get; set; }
        public DateTime Date { get; set; }
    }
}