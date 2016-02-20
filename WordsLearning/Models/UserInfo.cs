using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WordsLearning.Models
{
    public class UserInfo:UserBase
    {
        public UserInfo()
        {
            Scoreinfo = new ScoreInfo();
        }
        public int Id { get; set; }       
        public int Tag { get; set; }
        public int LibraryId { get; set; }

        public ScoreInfo Scoreinfo { get; set; }
    }
}