using BetSoftware.DataClasses.Request;
using BetSoftware.DataClasses.Response;
using BetSoftware.Helpers;
using BetSoftware.Repository.Entities;
using BetSoftware.Repository.Interface;
using BetSoftware.Services.Interface;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace BetSoftware.Services.Implementation
{
    public class OrderService : GenericService<Order>, IOrderService
    {
        private readonly IOrderRepository OrderRepository;
        private readonly IOrderItemRepository OrderItemRepository;

        private AutoMapper.Mapper mapper;

        public OrderService(IOrderRepository _OrderRepository, IOrderItemRepository _OrderItemRepository) : base(_OrderRepository)
        {
            OrderRepository = _OrderRepository;
            OrderItemRepository = _OrderItemRepository;

            mapper = ObjectMapperHelper.CreateMap();
        }

        public async Task<long> AddOrder(OrderModel model)
        {
            var entity = mapper.Map<Order>(model);
            entity.DateAdded = DateTime.Now;
            var OrderId = await OrderRepository.AddOrder(entity);

            foreach(var orderItem in model.OrderItems)
            {
                orderItem.OrderId = OrderId;
                await AddOrderItem(orderItem);
            }

            //Bulk Insert
            //AddOrderItems(model.OrderItems);

            return OrderId;
        }

        public async Task AddOrderItem(OrderItemModel model)
        {
            var entity = mapper.Map<OrderItem>(model);
            await OrderItemRepository.AddOrderItem(entity);
        }

        public async Task AddOrderItems(List<OrderItemModel> model)
        {
            var entities = mapper.Map<List<OrderItem>>(model);
            await OrderItemRepository.AddOrderItems(entities);
        }

        public async Task<OrderResponse> GetOrder(long OrderId)
        {
            var _Order = await OrderRepository.GetById(OrderId);

            var _OrderItems = await OrderItemRepository.GetOrderItems(OrderId);

            var _OrderResponse = mapper.Map<OrderResponse>(_Order);
            _OrderResponse.OrderItems = mapper.Map<List<OrderItemResponse>>(_OrderItems);

            return _OrderResponse;
        }

        public async Task<List<OrderItemResponse>> GetOrderitems(long OrderId)
        {
            var _OrderItems = await OrderItemRepository.GetOrderItems(OrderId);

            return mapper.Map<List<OrderItemResponse>>(_OrderItems);
        }

        public async Task<List<OrderResponse>> GetOrders(long UserId)
        {
            var _Orders = await OrderRepository.GetOrders(UserId);

            return mapper.Map<List<OrderResponse>>(_Orders);
        }
    }
}
