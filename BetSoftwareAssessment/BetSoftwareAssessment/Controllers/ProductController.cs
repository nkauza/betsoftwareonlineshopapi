using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using BetSoftware.DataClasses.Response;
using BetSoftware.Services.Interface;
using LuciaTech.Helper.Provider;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;


namespace BetSoftwareAssessment.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductController : ControllerBase
    {
        private readonly IProductService ProductService;
        private readonly ILogger<ProductController> _logger;

        public ProductController(IProductService _ProductService,
            ILogger<ProductController> logger)
        {
            ProductService = _ProductService;
            _logger = logger;
        }

        [HttpGet]
        public async Task<IActionResult> Get()
        {
            var _Response = await ProductService.GetProducts();

            return Ok(new ApiResponse<List<ProductResponse>>().Success(_Response));
        }
    }
}
