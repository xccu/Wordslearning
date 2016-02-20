using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WordsLearning.Models
{
    public class UserBase
    {
        public string Name { get; set; }
        public string Password { get; set; }
        public int Age { get; set; }
        public string Sex { get; set; }
        public string Country { get; set; }
        public string Imgurl { get; set; }
        public int Power { get; set; }
        public int Status { get; set; }
    }
}