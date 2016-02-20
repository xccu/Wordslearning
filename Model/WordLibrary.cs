using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;

namespace Model
{
    public class WordLibrary
    {
        [Key]
        [Required]
        public int WordLibraryId { get; set; }
        public int LibraryId { get; set; }
        public int WordId { get; set; }
    }
}
