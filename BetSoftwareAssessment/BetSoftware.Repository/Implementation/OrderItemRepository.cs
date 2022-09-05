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
    public class OrderItemRepository : GenericRepository<OrderItem>, IOrderItemRepository
    {
        public OrderItemRepository(OnlineShopDBContext context) : base(context)
        {

        }

        public async Task AddOrderItem(OrderItem entity)
        {
            _context.OrderItem.Add(entity);
            await _context.SaveChangesAsync();
        }

        public async Task AddOrderItems(List<OrderItem> orderItems)
        {
            _context.OrderItem.AddRange(orderItems);

            await _context.SaveChangesAsync();
        }

        public async Task<List<OrderItem>> GetOrderItems(long OrderId)
        {
            return _context.OrderItem.Where(s => s.OrderId == OrderId).ToList();
        }
    }
}
