using BetSoftware.Repository.DataAccess;
using BetSoftware.Repository.Entities;
using BetSoftware.Repository.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace BetSoftware.Repository.Implementation
{
    public class UserRepository : GenericRepository<AppUsers>, IUserRepository
    {
        public UserRepository(OnlineShopDBContext context):base(context)
        {

        }

        public async Task<AppUsers> AddAppUser(AppUsers entity)
        {
           _context.Add(entity);
            var UserId = await _context.SaveChangesAsync();
            entity.UserId = UserId;

            return entity;
        }

        public async Task<AppUsers> GetUserByEmail(string UserEmail)
        {
            return _context.AppUsers.Where(s => s.UserEmail.ToLower() == UserEmail.ToLower()).FirstOrDefault();
        }

        public async Task<AppUsers> SignIn(string UserEmail, string UserPassword)
        {
            return _context.AppUsers.Where(s=>s.UserEmail == UserEmail && s.UserPassword == UserPassword).FirstOrDefault();
        }
    }
}
