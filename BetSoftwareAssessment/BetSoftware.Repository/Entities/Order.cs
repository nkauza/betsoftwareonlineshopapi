using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace BetSoftware.Repository.Entities
{
    public class Order
    {
        [Key]
        public long OrderId { get; set; }

        public long UserId { get; set; }

        public DateTime DateAdded { get; set; }

        public DateTime? DateUpdated { get; set; }

    }
}
