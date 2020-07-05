using meally_api.Domain;

namespace meally_api.Data.Interfaces
{
    public interface IUserDAO
    {
        User GetByEmail(string email);
        void Save(User user);
        User Insert(User user);
    }
}