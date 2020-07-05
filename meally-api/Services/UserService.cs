using meally_api.Command;
using meally_api.Data.Interfaces;
using meally_api.Domain;
using meally_api.Services.Interfaces;

namespace meally_api.Services
{
    public class UserService : IUserService
    {
        public readonly IUserDAO repository;

        public UserService(IUserDAO _repository)
        {
            repository = _repository;
        }

        public User GetUserByEmail(string email)
        {
            return repository.GetByEmail(email);
        }

        public void Save(UserCommand user)
        {
            var _user = BindUser(user);
            repository.Save(_user);
        }

        private User BindUser(UserCommand user)
        {
            return new User
            {
                Name = user.Name,
                Email = user.Email,
                Password = user.Password,
                Photo = user.Photo,
                Role = user.Role
            };
        }
    }
}