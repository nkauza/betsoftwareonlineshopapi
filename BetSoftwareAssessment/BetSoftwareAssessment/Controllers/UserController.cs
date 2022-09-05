using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using BetSoftware.DataClasses.Request;
using BetSoftware.DataClasses.Response;
using BetSoftware.Repository.Entities;
using BetSoftware.Services.Interface;
using LuciaTech.Helper.Provider;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using NLog.Web;

namespace BetSoftwareAssessment.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly IUserService UserService;
        private readonly ITokenService TokenService;
        private readonly IConfiguration _config;

        private readonly ILogger<UserController> _logger;

        public UserController(IUserService _UserService, 
            ITokenService _TokenService, IConfiguration config,
            ILogger<UserController> logger)
        {
            UserService = _UserService;
            TokenService = _TokenService;
            _config = config;
            _logger = logger;
        }

        [HttpPost("~/api/SignIn")]
        
        public async Task<IActionResult> SignIn([FromBody]UserRequest model)
        {
            try
            {
                var _Response = await UserService.SignIn(model.UserEmail, model.UserPassword);

                if (_Response != null)
                {
                    _Response.UserToken = TokenService.BuildToken(_config["Jwt:Key"].ToString(), _config["Jwt:Issuer"].ToString(), _Response);
                    return Ok(new ApiResponse<UserResponse>().Success(_Response));
                }
                else
                {
                    _logger.LogError($"API/SignIn:: Invalid login attempt. Username:{model.UserEmail}, Password: {model.UserPassword}");

                    return BadRequest("Invalid login details.");
                }

            }
            catch (Exception Ex)
            {
                _logger.LogError($"API/SignIn:: {Ex.Message}. Username:{model.UserEmail}, Password: {model.UserPassword}");
                throw Ex;
            }
        }

        
        [HttpPost("~/api/SignUp")]
        public async Task<IActionResult> SignUp([FromBody] UserRequest model)
        {
            var _Response = await UserService.AddUser(model);

            try {
                if (_Response != null)
                {
                    _Response.UserToken = TokenService.BuildToken(_config["Jwt:Key"].ToString(), _config["Jwt:Issuer"].ToString(), _Response);

                    return Ok(new ApiResponse<UserResponse>().Success(_Response));
                }
                else
                {
                    _logger.LogError($"API/SignUp:: User registration failed. Username:{model.UserEmail}, Password: {model.UserPassword}");

                    return BadRequest("Registration failed. Please try again!");
                }
            }
            catch(Exception Ex)
            {
                _logger.LogError($"API/SignUp:: {Ex.Message}. Username:{model.UserEmail}, Password: {model.UserPassword}");
                throw Ex;
            }
        }
    }
}
