using meally_api.Command;
using meally_api.Domain;

namespace meally_api.Services.Interfaces
{
    public interface IQueueService
    {
        Queue GetByRestaurantId(int id);
        void Save(QueueCommand queue);
        Queue GetByPhone(string phone);
        Queue Insert(QueueCommand queue);
    }
}