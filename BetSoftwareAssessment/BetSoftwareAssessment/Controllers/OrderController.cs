using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using BetSoftware.DataClasses.Request;
using BetSoftware.DataClasses.Response;
using BetSoftware.Services.Interface;
using LuciaTech.Helper.Provider;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

namespace BetSoftwareAssessment.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class OrderController : ControllerBase
    {
        private readonly IOrderService OrderService;
        private readonly ILogger<OrderController> _logger;

        public OrderController(IOrderService _OrderService,
            ILogger<OrderController> logger)
        {
            OrderService = _OrderService;
            _logger = logger;
        }

        [HttpGet("~/api/GetOrders")]
        [BasicAuthorization]
        public async Task<IActionResult> GetOrders(long UserId)
        {
            try
            {
                var _Response = await OrderService.GetOrders(UserId);

                return Ok(new ApiResponse<List<OrderResponse>>().Success(_Response));
            }
            catch (Exception Ex)
            {
                _logger.LogError($"API/GetOrders:: {Ex.Message} :: UserID({UserId})");
                throw Ex;
            }
        }

        [HttpGet("~/api/GetOrder")]
        [BasicAuthorization]
        public async Task<IActionResult> GetOrder(long OrderId)
        {
            try
            {
                var _Response = await OrderService.GetOrder(OrderId);

                return Ok(new ApiResponse<OrderResponse>().Success(_Response));
            }
            catch(Exception Ex)
            {
                _logger.LogError($"API/GetOrder:: {Ex.Message} :: OrderID({OrderId})");
                throw Ex;
            } 
        }

        [HttpPost("~/api/AddOrder")]
        [BasicAuthorization]
        public async Task<IActionResult> AddOrder([FromBody] OrderModel model)
        {
            try
            {
                var _Response = await OrderService.AddOrder(model);

                return Ok(new ApiResponse<long>().Success(_Response));
            }
            catch(Exception Ex)
            {
                _logger.LogError($"API/AddOrder:: {Ex.Message}");
                throw Ex;
            }
        }
    }
}
