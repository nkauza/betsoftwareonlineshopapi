using BetSoftware.DataClasses.Request;
using BetSoftware.DataClasses.Response;
using BetSoftware.Repository.Entities;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace BetSoftware.Services.Interface
{
    public interface IUserService:IGenericService<AppUsers>
    {
        public Task<UserResponse> AddUser(UserRequest model);
        public Task<UserResponse> SignIn(string UserEmail, string UserPassword);
    }
}
