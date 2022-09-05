using System;
using System.Collections.Generic;
using System.Text;

namespace BetSoftware.Repository.Entities
{
    public class AppUserToken
    {
        public long AppUserTokenId { get; set; }

        public long UserId { get; set; }

        public string UserToken { get; set; }

        public DateTime DateAdded { get; set; }
    }
}
