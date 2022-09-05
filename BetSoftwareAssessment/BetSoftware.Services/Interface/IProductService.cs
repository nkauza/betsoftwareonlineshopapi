using BetSoftware.DataClasses.Response;
using BetSoftware.Repository.Entities;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace BetSoftware.Services.Interface
{
    public interface IProductService: IGenericService<Product>
    {
        public Task<List<ProductResponse>> GetProducts();
    }
}
