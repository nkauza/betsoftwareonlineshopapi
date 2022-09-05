using System;
using System.Collections.Generic;
using System.Text;

namespace BetSoftware.DataClasses.Response
{
    public class OrderResponse
    {
        public long OrderId { get; set; }
        public long UserId { get; set; }
        public List<OrderItemResponse> OrderItems { get; set; }
    }

    public class OrderItemResponse
    {
        public long OrderItemId { get; set; }
        public long ProductId { get; set; }
        public int Quantity { get; set; }
    }
}
