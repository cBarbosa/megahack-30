using meally_api.Domain;
using System.Collections.Generic;

namespace meally_api.Data.Interfaces
{
    public interface IRestaurantDAO
    {
        IEnumerable<Restaurant> GetAll();
        Restaurant GetById(int id);
        void Update(Restaurant restaurant);
    }
}