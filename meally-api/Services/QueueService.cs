using meally_api.Command;
using meally_api.Data.Interfaces;
using meally_api.Domain;
using meally_api.Services.Interfaces;
using System;
using System.Collections.Generic;

namespace meally_api.Services
{
    public class QueueService : IQueueService
    {
        public readonly IQueueDAO repository;

        public QueueService(IQueueDAO _repository)
        {
            repository = _repository;
        }

        public Queue GetByPhone(string phone)
        {
            return repository.GetByPhone(phone);
        }

        public IEnumerable<Queue> GetByRestaurantId(int id)
        {
            return repository.GetByRestaurantId(id);
        }

        public Queue Insert(QueueCommand queue)
        {
            var _queue = BindQueue(queue);
            return repository.Insert(_queue);
        }

        public void Save(QueueCommand queue)
        {
            var _queue = BindQueue(queue);
            if (_queue.QueueId.Equals(0))
                _queue = repository.Insert(_queue);
            else
                repository.Save(_queue);
        }

        private Queue BindQueue(QueueCommand queue)
        {
            return new Queue
            {
                QueueId = queue.QueueId.HasValue
                        ? queue.QueueId.Value
                        : 0,
                RestaurantId = queue.RestaurantId,
                Status = queue.Status,
                Phone = queue.Phone,
                ETA = queue.ETA.HasValue
                        ? queue.ETA
                        : DateTime.Now.AddMinutes(30),
                DateCanceled = queue.DateCanceled,
                DateFinished = queue.DateFinished
            };
        }
    }
}