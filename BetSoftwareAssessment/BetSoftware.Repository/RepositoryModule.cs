using BetSoftware.Repository.DataAccess;
using BetSoftware.Repository.Implementation;
using BetSoftware.Repository.Interface;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using System;

namespace BetSoftware.Repository
{
    public class RepositoryModule
    {
        public static void Register(IServiceCollection services, string connection)
        {
            services.AddDbContext<OnlineShopDBContext>(options => options.UseSqlServer(connection));
            services.AddTransient<IUserRepository, UserRepository>();
            services.AddTransient<IProductRepository, ProductRepository>();
            services.AddTransient<IOrderRepository, OrderRepository>();
            services.AddTransient<IOrderItemRepository, OrderItemRepository>();
        }
    }
}
