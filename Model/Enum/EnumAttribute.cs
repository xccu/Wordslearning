using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model.Enum
{
    [AttributeUsage(AttributeTargets.Field, AllowMultiple = false)]
    public class EnumAttribute : Attribute
    {
        public string DisplayName { get; set; }

        public EnumAttribute(string dispalyName)
        {
            DisplayName = dispalyName;
        }
    }
}
