using meally_api.Command;
using meally_api.Domain;

namespace meally_api.Services.Interfaces
{
    public interface IUserService
    {
        User GetUserByEmail(string email);
        void Save(UserCommand user);
    }
}