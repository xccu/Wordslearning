using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
//using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
//using System.ComponentModel.DataAnnotations.Schema;

namespace Model
{
    public class Spell
    {
        [Key]
        [Required]
        public int Id { get; set; }
        
        [MaxLength(50)]  
        public string wordspell { get; set; }
    }
}
