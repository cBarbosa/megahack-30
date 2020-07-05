using meally_api.Command;
using meally_api.Domain;
using System.Collections.Generic;

namespace meally_api.Services.Interfaces
{
    public interface IOrderService
    {
        Order GetById(int id);
        IEnumerable<Order> GetByRestaurantId(int id);
        Order Insert(OrderCommand order);
        bool AddItem(OrderItemCommand orderItem);
    }
}