using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WordsLearning.Models
{
    public class TransObj
    {
        public int errNum { get; set; }
        public string errMsg { get; set; }
        public RetData retData { get; set; }
    }

    public class RetData
    {
        public string from { get; set; }
        public string to { get; set; }
        public List<TransResult> trans_result { get; set; }
    }

    public class TransResult
    {
        public string src { get; set; }
        public string dst { get; set; }
    }
}
