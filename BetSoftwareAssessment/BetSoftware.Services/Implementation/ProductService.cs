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
    public class ProductService : GenericService<Product>, IProductService
    {
        private readonly IProductRepository ProductRepository;

        private AutoMapper.Mapper mapper;

        public ProductService(IProductRepository _ProductRepository) : base(_ProductRepository)
        {
            ProductRepository = _ProductRepository;
            mapper = ObjectMapperHelper.CreateMap();
        }

        public async Task<List<ProductResponse>> GetProducts()
        {
            var Products = await ProductRepository.GetProductList();

            return mapper.Map<List<ProductResponse>>(Products);
        }
    }
}
