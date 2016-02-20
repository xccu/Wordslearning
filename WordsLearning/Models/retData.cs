using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WordsLearning.Models
{
    public class retData
    {
        public retData()
        {
            trans_result = new transResult();
        }

        public string from { get; set; }
        public string to { get; set; }
        public transResult trans_result { get; set; }

    }
}


