using meally_api.Command;
using meally_api.Domain;
using System.Collections.Generic;

namespace meally_api.Services.Interfaces
{
    public interface IRestaurantService
    {
        IEnumerable<Restaurant> GetAll();
        Restaurant GetById(int id);
        void Update(RestaurantCommand restaurant);
    }
}