using System;
using System.Collections.Generic;
using System.Text;

namespace BetSoftware.DataClasses.Response
{
    public class ProductResponse
    {
        public long ProductId { get; set; }
        public string ProductName { get; set; }
        public string ProductImage { get; set; }
        public decimal ProductPrice { get; set; }
        public int Quantity { get; set; }
    }
}
