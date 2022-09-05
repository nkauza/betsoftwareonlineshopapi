using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace BetSoftware.Repository.Entities
{
    public class OrderItem
    {
        [Key]
        public long OrderItemId { get; set; }

        public long OrderId { get; set; }
        public long ProductId { get; set; }
        public int Quantity { get; set; }

    }
}
