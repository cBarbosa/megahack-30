using System.Collections.Generic;

namespace meally_api.Data.Interfaces
{
    public interface IQueueDAO
    {
        IEnumerable<Domain.Queue> GetByRestaurantId(int id);
        void Save(Domain.Queue queue);
        Domain.Queue GetByPhone(string phone);
        Domain.Queue Insert(Domain.Queue queue);
    }
}