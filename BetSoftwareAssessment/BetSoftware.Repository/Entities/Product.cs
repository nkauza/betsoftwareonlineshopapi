using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace BetSoftware.Repository.Entities
{
    public class Product
    {
        [Key]
        public long ProductId { get; set; }

        public string ProductName { get; set; }

        public string ProductImage { get; set; }

        public decimal ProductPrice { get; set; }

        public int Quantity { get; set; }

        public DateTime DateAdded { get; set; }

        public DateTime? DateUpdated { get; set; }

    }
}
