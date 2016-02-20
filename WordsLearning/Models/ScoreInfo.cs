using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WordsLearning.Models
{
    public class ScoreInfo
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public int SpellCount { get; set; }
        public int FalseSpell { get; set; }
        public int TransCount { get; set; }
        public int FalseTrans { get; set; }
        public float SCorrectRate { get; set; }
        public float TCorrectRate { get; set; }
        public float CorrectRate { get; set; }
    }
}