using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;

namespace Model
{
    public class Tested
    {
        [Key]
        [Required]
        public int TestedId { get; set; }
        public int? UserId { get; set; }
        public int? WordId { get; set; }
        public int? tag { get; set; }
    }
}
