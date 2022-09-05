using BetSoftware.Repository.Entities;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace BetSoftware.Repository.Interface
{
    public interface IUserRepository: IGenericRepository<AppUsers>
    {
        Task<AppUsers> AddAppUser(AppUsers entity);
        Task<AppUsers> SignIn(string UserEmail, string UserPassword);
        Task<AppUsers> GetUserByEmail(string UserEmail);
    }
}
