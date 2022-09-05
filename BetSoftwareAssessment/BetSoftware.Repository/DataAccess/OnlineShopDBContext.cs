using BetSoftware.Repository.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;

namespace BetSoftware.Repository.DataAccess
{
    public class OnlineShopDBContext : DbContext
    {
        public OnlineShopDBContext(DbContextOptions<OnlineShopDBContext> options) : base(options)
        {
        }
        public DbSet<AppUsers> AppUsers { get; set; }
        public DbSet<Order> Order { get; set; }
        public DbSet<OrderItem> OrderItem { get; set; }
        public DbSet<Product> Product { get; set; }
    }
}
