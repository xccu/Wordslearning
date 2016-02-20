using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;

namespace Model
{
    public class Music
    {
        [Key]
        [Required]
        public int MusicId { get; set; }
        public string Name { get; set; }
        public string Singer { get; set; }
        public string Url { get; set; }
        public string Lrc { get; set; }
        public DateTime Date { get;set;}
    }
}
