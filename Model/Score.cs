using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;

namespace Model
{
    public class Score
    {
        //public Score()
        //{
        //    user = new User();
        //}

        [Key]
        [Required]
        public int ScoreId { get; set; }
        public int UserId { get; set; }
        public int SpellCount { get; set; }
        public int FalseSpell { get; set; }
        public int TransCount { get; set; }
        public int FalseTrans { get; set; }
        public float SCorrectRate { get; set; }
        public float TCorrectRate { get; set; }
        public float CorrectRate { get; set; }

        [ForeignKey("UserId")]
        public virtual User user { get; set; }
    }
}
