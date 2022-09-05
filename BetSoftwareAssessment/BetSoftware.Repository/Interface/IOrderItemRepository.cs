using BetSoftware.Repository.Entities;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace BetSoftware.Repository.Interface
{
    public interface IOrderItemRepository: IGenericRepository<OrderItem>
    {
        public Task<List<OrderItem>> GetOrderItems(long OrderId);
        public Task AddOrderItem(OrderItem entity);
        public Task AddOrderItems(List<OrderItem> orderItems);
    }
}
