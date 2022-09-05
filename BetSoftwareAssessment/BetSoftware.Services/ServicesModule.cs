using BetSoftware.Helpers;
using BetSoftware.Services.Implementation;
using BetSoftware.Services.Interface;
using Microsoft.Extensions.DependencyInjection;
using System;

namespace BetSoftware.Services
{
    public class ServicesModule
    {
        public static void Register(IServiceCollection services)
        {
            new ObjectMapperHelper();

            services.AddTransient<IUserService, UserService>();
            services.AddTransient<IProductService, ProductService>();
            services.AddTransient<IOrderService, OrderService>();
            services.AddTransient<ITokenService, TokenService>();
        }
    }
}
