using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;

namespace Model
{
    public class Reading
    {
        [Key]
        [Required]
        public int ReadingId { get; set; }
        public string Title { get; set; }
        public string From { get; set; }
        public string Url { get; set; }
        public string Content { get; set; }
        public DateTime Date { get; set; }
    }
}
