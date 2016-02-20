using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;

namespace Model
{
    public class Configuation
    {
        [Key]
        [Required]
        public int ConfiguationId { get; set; }
        public int UserId { get; set; }
        public int LibraryId { get; set; }
        public int StyleNum { get; set; }

        [ForeignKey("UserId")]
        public virtual User user { get; set; }
    }
}
