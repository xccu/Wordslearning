using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations;

namespace Model
{
    public class Word
    {
        public Word()
        {
            tested = new List<Tested>();
            wordlibraries = new List<WordLibrary>();
        }

        [Key]
        [Required]
        public int WordId { get; set; } 
        public string spell { get; set; } 
        public string type { get; set; }
        public string speak { get; set; }       
        public string translate { get; set; }
        public string sentence { get; set; }

        public virtual ICollection<Tested> tested { get; set; }
        public virtual ICollection<WordLibrary> wordlibraries { get; set; }
    }
}
