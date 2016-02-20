using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model.Enum
{
    public enum UserEnum
    {
        [EnumAttribute("Success")]
        Success = 1,

        [EnumAttribute("Create user failed")]
        CreateFailed = 2,

        [EnumAttribute("Create user failed")]
        DeleteFailed = 3,

        [EnumAttribute("Update user failed")]
        UpdateFailed = 4,

        [EnumAttribute("Get user failed")]
        GetFailed = 5,

        [EnumAttribute("Valid user failed")]
        ValidFailed=6,

        [EnumAttribute("Username exist")]
        NameExist=7,

        [EnumAttribute("Unknown error")]
        UnknownError=0,
    }
}
