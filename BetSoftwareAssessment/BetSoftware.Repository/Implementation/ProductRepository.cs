using BetSoftware.Repository.DataAccess;
using BetSoftware.Repository.Entities;
using BetSoftware.Repository.Interface;
using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BetSoftware.Repository.Implementation
{
    public class ProductRepository : GenericRepository<Product>, IProductRepository
    {

        public ProductRepository(OnlineShopDBContext context) : base(context)
        {

        }

        public async Task<List<Product>> GetProductList()
        {
            return _context.Product.ToList();
        }
    }
}
