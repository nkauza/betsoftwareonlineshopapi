using BetSoftware.DataClasses.Response;
using BetSoftware.Repository.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace BetSoftware.Services.Interface
{
    public interface ITokenService
    {
        string BuildToken(string key, string issuer, UserResponse user);
        bool IsTokenValid(string key, string issuer, string token);
    }
}
