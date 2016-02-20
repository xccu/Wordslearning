using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace WordsLearning.Models
{
    public class UserConfiguation
    {
        public UserConfiguation()
        {
            user = new UserInfo();
        }

        public int ConfiguationId { get; set; }
        public int LibraryId { get; set; }
        public int StyleNum { get; set; }
        public UserInfo user { get; set; }
    }
}
