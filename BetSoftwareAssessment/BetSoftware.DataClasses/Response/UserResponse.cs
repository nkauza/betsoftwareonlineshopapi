using System;
using System.Collections.Generic;
using System.Text;

namespace BetSoftware.DataClasses.Response
{
    public class UserResponse
    {
        public long UserId { get; set; }
        public string UserEmail { get; set; }
        public string UserToken { get; set; }
    }
}
