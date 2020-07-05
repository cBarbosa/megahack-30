using meally_api.Command;
using meally_api.Domain;

namespace meally_api.Services.Interfaces
{
    public interface IRankService
    {
        Rank Insert(RankCommand rank);
        Rank GetByRestaurantId(int id);
    }
}