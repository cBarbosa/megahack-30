using meally_api.Command;
using meally_api.Domain;
using System.Collections.Generic;

namespace meally_api.Services.Interfaces
{
    public interface IQueueService
    {
        IEnumerable<Queue> GetByRestaurantId(int id);
        void Save(QueueCommand queue);
        Queue GetByPhone(string phone);
        Queue Insert(QueueCommand queue);
    }
}