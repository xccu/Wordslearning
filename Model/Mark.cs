using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;

namespace Model
{
    public class Mark
    {
        //public Mark()
        //{
        //    word = new Word();
        //}

        [Key]
        [Required]
        public int MarkId { get; set; }
        public int UserId { get; set; }
        public int WordId { get; set; }
        public int Marked { get; set; }

        [ForeignKey("WordId")]
        public virtual Word word { get; set; }
    }
}
