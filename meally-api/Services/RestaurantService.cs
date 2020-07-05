using meally_api.Command;
using meally_api.Data.Interfaces;
using meally_api.Domain;
using meally_api.Services.Interfaces;
using System.Collections.Generic;

namespace meally_api.Services
{
    public class RestaurantService : IRestaurantService
    {
        public readonly IRestaurantDAO repository;

        public RestaurantService(IRestaurantDAO _repository)
        {
            repository = _repository;
        }

        public IEnumerable<Restaurant> GetAll()
        {
            return repository.GetAll();
        }

        public Restaurant GetById(int id)
        {
            return repository.GetById(id);
        }

        public void Update(RestaurantCommand restaurant)
        {
            var _restaurant = BindRestaurant(restaurant);
            repository.Update(_restaurant);
        }

        private Restaurant BindRestaurant(RestaurantCommand restaurant)
        {
            return new Restaurant
            {
                RestaurantId = restaurant.RestaurantId,
                Address = restaurant.Address,
                Name = restaurant.Name,
                Photo = restaurant.Photo,
                Coordinate = new Coordinate
                {
                    Latitude = restaurant.Latitude,
                    Longitude = restaurant.Longitude
                }
            };
        }
    }
}