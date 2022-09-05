using BetSoftware.DataClasses.Request;
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
    public class UserService : GenericService<AppUsers>, IUserService
    {
        private readonly IUserRepository UserRepository;
        private AutoMapper.Mapper mapper;

        public UserService(IUserRepository _UserRepository):base(_UserRepository)
        {
            UserRepository = _UserRepository;
            mapper = ObjectMapperHelper.CreateMap();
        }

        public async Task<UserResponse> AddUser(UserRequest model)
        {
            var UserPassword = GlobalHelper.EncryptPwd(model.UserEmail.ToLower(), model.UserPassword);

            var _AppUser = await UserRepository.GetUserByEmail(model.UserEmail);

            if (_AppUser != null)
                throw new Exception("Email address already exists.");

            _AppUser = await UserRepository.AddAppUser(new AppUsers { UserEmail = model.UserEmail, UserPassword = UserPassword, DateAdded = DateTime.Now});

            return mapper.Map<UserResponse>(_AppUser);
        }

        public async Task<UserResponse> SignIn(string UserEmail, string UserPassword)
        {
            var pWord = GlobalHelper.EncryptPwd(UserEmail.ToLower(), UserPassword);

            var _AppUser = await UserRepository.SignIn(UserEmail, pWord);

            return mapper.Map<UserResponse>(_AppUser);
        }
    }
}
