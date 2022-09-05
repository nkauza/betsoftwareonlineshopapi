using AutoMapper;
using BetSoftware.DataClasses.Request;
using BetSoftware.DataClasses.Response;
using BetSoftware.Repository.Entities;
using System;

namespace BetSoftware.Helpers
{
    public class ObjectMapperHelper
    {
        public static Mapper CreateMap()
        {
            var config = new MapperConfiguration(cfg =>
            {
                cfg.CreateMap<Product, ProductResponse>().ReverseMap();
                cfg.CreateMap<AppUsers, UserResponse>().ReverseMap();
                cfg.CreateMap<Order, OrderModel>().ReverseMap();
                cfg.CreateMap<OrderItem, OrderItemModel>().ReverseMap();
            });

            var mapper = new Mapper(config);

            return mapper;
        }
    }
}
