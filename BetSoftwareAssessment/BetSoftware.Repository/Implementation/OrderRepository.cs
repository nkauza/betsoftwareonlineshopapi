using BetSoftware.Repository.DataAccess;
using BetSoftware.Repository.Entities;
using BetSoftware.Repository.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BetSoftware.Repository.Implementation
{
    public class OrderRepository: GenericRepository<Order>, IOrderRepository
    {
        public OrderRepository(OnlineShopDBContext context) : base(context)
        {

        }

        public async Task<long> AddOrder(Order entity)
        {
            _context.Order.Add(entity);

            await _context.SaveChangesAsync();

            return entity.OrderId;
        }

        public async Task<Order> GetOrder(long OrderId)
        {
            return await _context.Order.FindAsync(OrderId);
        }

        public async Task<List<Order>> GetOrders(long UserId)
        {
            return _context.Order.Where(s => s.UserId == UserId).ToList();
        }
    }
}
