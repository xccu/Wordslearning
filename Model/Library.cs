using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;

namespace Model
{
    public class Library
    {
        //public Library()
        //{
        //    wordlibraries = new List<WordLibrary>();
        //}

        [Key]
        [Required]
        public int LibraryId { get; set; }
        public string LibraryName { get; set; }

        //public virtual ICollection<WordLibrary> wordlibraries { get; set; }
    }
}
