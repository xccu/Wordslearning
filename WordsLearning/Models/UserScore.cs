using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WordsLearning.Models
{
    public class UserScore
    {
        public UserScore()
        {
            this.userinfo = new UserInfo();
            this.scoreinfo = new ScoreInfo();
        }

        public UserInfo userinfo { get; set; }
        public ScoreInfo scoreinfo { get; set; }
    }
}