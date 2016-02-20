using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
//using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
//using System.ComponentModel.DataAnnotations.Schema;

namespace Model
{
    public class User
    {
        public User()
        {
            mark = new List<Mark>();
            tested = new List<Tested>();
            //score=new Score();
        }

        [Key]
        [Required]
        public int UserId { get; set; }
        public string Name { get; set; }
        public string Password { get; set; }
        public int Age { get; set; }
        public string Sex { get; set; }
        public string Country { get; set; }
        public string Imgurl { get; set; }
        public int Power { get; set; }
        public int Status { get; set; }

        public virtual ICollection<Mark> mark { get; set; }
        public virtual ICollection<Tested> tested { get; set; }
    }
}
