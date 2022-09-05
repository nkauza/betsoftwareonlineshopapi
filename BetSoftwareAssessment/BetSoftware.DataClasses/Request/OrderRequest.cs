using System;
using System.Collections.Generic;
using System.Text;

namespace BetSoftware.DataClasses.Request
{
    public class OrderModel
    {
        public long OrderId { get; set; }
        public long UserId { get; set; }
        public List<OrderItemModel> OrderItems { get; set; }
    }

    public class OrderItemModel
    {
        public long OrderItemId { get; set; }
        public long OrderId { get; set; }
        public long ProductId { get; set; }
        public int Quantity { get; set; }
    }
}
