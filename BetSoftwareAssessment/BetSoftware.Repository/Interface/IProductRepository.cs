using BetSoftware.Repository.Entities;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace BetSoftware.Repository.Interface
{
    public interface IProductRepository : IGenericRepository<Product>
    {
        public Task<List<Product>> GetProductList();
    }
}
