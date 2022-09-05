using BetSoftware.Repository.Entities;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace BetSoftware.Repository.Interface
{
    public interface IOrderRepository : IGenericRepository<Order>
    {
        public Task<List<Order>> GetOrders(long UserId);
        public Task<Order> GetOrder(long OrderId);
        public Task<long> AddOrder(Order entity);
    }
}
