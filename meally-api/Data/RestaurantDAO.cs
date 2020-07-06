using Dapper;
using meally_api.Data.Interfaces;
using meally_api.Domain;
using Microsoft.Extensions.Configuration;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;

namespace meally_api.Data
{
    public class RestaurantDAO : IRestaurantDAO
    {
        public static string connectionString { get; set; }

        public RestaurantDAO(IConfiguration _configuration)
        {
            connectionString = _configuration["ConnectionStrings:MysqlConnectionString"];
        }

        public IEnumerable<Restaurant> GetAll()
        {
            var query = @"Select
                            RestaurantId,
                            Name,
                            Photo,
                            Address,
                            Coordinate_Latitude Latitude,
                            Coordinate_Longitude Longitude
                        From Restaurant;";

            using (MySqlConnection conexaoBD = new MySqlConnection(connectionString))
            {
                return conexaoBD.Query<Restaurant, Coordinate, Restaurant>(query,
                    (restaurant, coordinate) =>
                    {
                        if (coordinate != null)
                        {
                            restaurant.Coordinate = coordinate;
                        }
                        return restaurant;
                    }, null, splitOn: "RestaurantId, Latitude").ToList();
            };
        }

        public Restaurant GetById(int id)
        {
            var query = @"Select
                            Restaurant.RestaurantId,
                            Restaurant.Name,
                            Restaurant.Photo,
                            Restaurant.Address,
                            Restaurant.Coordinate_Latitude Latitude,
                            Restaurant.Coordinate_Longitude Longitude
                        From Restaurant
                        Where Restaurant.RestaurantId = @id
                    ;";

            using (MySqlConnection conexaoBD = new MySqlConnection(connectionString))
            {
                return conexaoBD.Query<Restaurant, Coordinate, Restaurant>(query,
                    (restaurant, coordinate) =>
                    {
                        if (coordinate != null)
                        {
                            restaurant.Coordinate = coordinate;
                        }

                        Console.Write($"RestaurantId = {restaurant.RestaurantId}");

                        var items = GetMenuByRestaurantId(restaurant.RestaurantId);

                        if (items.Count() > 0)
                        {
                            restaurant.Menu = new Menu
                            {
                                Meals = items
                            };
                        }
                        return restaurant;
                    }, new { id }, splitOn: "RestaurantId, Latitude")
                    .SingleOrDefault();
            };
        }

        public IEnumerable<Meal> GetMenuByRestaurantId(int id)
        {
            var query = @"Select
                            Meal.MealId,
                            Meal.Code,
                            Meal.Description,
                            Meal.Ingredients,
                            Meal.Name,
                            Meal.Photo,
                            Meal.Price
                        From Menu
                        Inner Join Meal On Menu.MealId = Meal.MealId
                        Where Menu.RestaurantId = @id
                    ;";

            using MySqlConnection conexaoBD = new MySqlConnection(connectionString);
            return conexaoBD.Query<Meal>(query, new { id }).ToList();
        }

        public void Update(Restaurant restaurant)
        {
            var query = @"
                    Update Restaurant
                        Set Name = @Name,
                        Address = @Address,
                        Photo = @Photo,
                        Coordinate_Latitude = @Latitude,
                        Coordinate_Longitude = @Longitude
                    Where RestaurantId = @RestaurantId
                    ;";

            using MySqlConnection conexaoBD = new MySqlConnection(connectionString);
            conexaoBD.Execute(query, new
            {
                restaurant.RestaurantId,
                restaurant.Name,
                restaurant.Address,
                restaurant.Photo,
                restaurant.Coordinate.Latitude,
                restaurant.Coordinate.Longitude
            });
        }
    }
}