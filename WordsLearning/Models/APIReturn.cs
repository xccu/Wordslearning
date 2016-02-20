using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WordsLearning.Models
{
    public class APIReturn
    {
        public APIReturn()
        {
            retData = new retData();
        }

        public int errNum { get; set; }
        public string errMsg { get; set; }
        public retData retData { get; set; }
    }
}

