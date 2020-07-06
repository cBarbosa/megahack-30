using meally_api.Domain;
using System;
using System.Collections.Generic;

namespace meally_api.Data.Interfaces
{
    public interface IOrderDAO
    {
        Order Insert(Order order);
        void Update(Order order);
        void InsertItem(OrderItems orderItem);
        Order GetById(int id);
        IEnumerable<Order> GetByRestaurantId(int id);
    }
}