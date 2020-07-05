using meally_api.Domain;

namespace meally_api.Data.Interfaces
{
    public interface IRankDAO
    {
        Rank GetByRestaurantId(int id);
        Rank Insert(Rank rank);
    }
}