using BetSoftware.DataClasses.Request;
using BetSoftware.DataClasses.Response;
using BetSoftware.Repository.Entities;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace BetSoftware.Services.Interface
{
    public interface IOrderService: IGenericService<Order>
    {
        public Task<long> AddOrder(OrderModel model);
        public Task AddOrderItem(OrderItemModel model);
        public Task AddOrderItems(List<OrderItemModel> model);
        public Task<List<OrderResponse>> GetOrders(long UserId);
        public Task<OrderResponse> GetOrder(long OrderId);

        public Task<List<OrderItemResponse>> GetOrderitems(long OrderId);
    }
}
