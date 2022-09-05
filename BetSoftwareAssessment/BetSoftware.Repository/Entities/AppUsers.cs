using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace BetSoftware.Repository.Entities
{
    public class AppUsers
    {
        [Key]
        public long UserId { get; set; }
        public string UserEmail { get; set; }
        public string UserPassword { get; set; }
        public DateTime DateAdded { get; set; }
        public DateTime? DateUpdated { get; set; }
        public bool IsActive { get; set; }
    }
}
