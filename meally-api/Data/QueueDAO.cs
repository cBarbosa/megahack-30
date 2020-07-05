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
    public class QueueDAO : IQueueDAO
    {
        public static string connectionString { get; set; }

        public QueueDAO(IConfiguration _configuration)
        {
            connectionString = _configuration["ConnectionStrings:MysqlConnectionString"];
        }

        public Queue GetByPhone(string phone)
        {
            var query = @"
                        Select
                            Queue.*,
                            Restaurant.RestaurantId,
                            Restaurant.Name,
                            Restaurant.Photo,
                            Restaurant.Address,
                            Restaurant.Coordinate_Latitude Latitude,
                            Restaurant.Coordinate_Longitude Longitude
                        From Queue
                            Inner Join Restaurant On Restaurant.RestaurantId = Queue.RestaurantId
                        Where Queue.Phone = @phone
                    ;";

            using (MySqlConnection conexaoBD = new MySqlConnection(connectionString))
            {
                return conexaoBD.Query<Queue, Restaurant, Coordinate, Queue>(query,
                    (queue, restaurant, coordinate) =>
                    {
                        if (coordinate != null)
                        {
                            restaurant.Coordinate = coordinate;
                        }

                        queue.Restaurant = restaurant;
                        return queue;
                    }, new { phone }, splitOn: "QueueId, RestaurantId, Latitude")
                    .SingleOrDefault();
            };
        }

        public IEnumerable<Queue> GetByRestaurantId(int id)
        {
            var query = @"
                        Select
                            Queue.*,
                            Restaurant.RestaurantId,
                            Restaurant.Name,
                            Restaurant.Photo,
                            Restaurant.Address,
                            Restaurant.Coordinate_Latitude Latitude,
                            Restaurant.Coordinate_Longitude Longitude
                        From Queue
                            Inner Join Restaurant On Restaurant.RestaurantId = Queue.RestaurantId
                        Where Queue.RestaurantId = @id
                    ;";

            using (MySqlConnection conexaoBD = new MySqlConnection(connectionString))
            {
                return conexaoBD.Query<Queue, Restaurant, Coordinate, Queue>(query,
                    (queue, restaurant, coordinate) =>
                    {
                        if (coordinate != null)
                        {
                            restaurant.Coordinate = coordinate;
                        }

                        queue.Restaurant = restaurant;
                        return queue;
                    }, new { id }, splitOn: "QueueId, RestaurantId, Latitude")
                    .ToList();
            };
        }

        public Queue Insert(Queue queue)
        {
            var query = @"
                    Insert Into Queue(RestaurantId, Phone, Status, ETA, DateUpdated)
                    Values(@RestaurantId, @Phone, @Status, @ETA, @DateUpdated);
                    SELECT LAST_INSERT_ID();
                    ;";
            queue.DateUpdated = DateTime.Now;

            using MySqlConnection conexaoBD = new MySqlConnection(connectionString);
            queue.QueueId = conexaoBD.Query<int>(query, queue).SingleOrDefault();

            return queue;
        }

        public void Save(Queue queue)
        {
            var query = @"
                    Update Queue
                        Set Phone = @Phone,
                        Status = @Status,
                        ETA = @ETA,
                        DateCanceled = @DateCanceled,
                        DateFinished = @DateFinished,
                        DateUpdated = @DateUpdated
                    Where RestaurantId = @RestaurantId
                    ;";
            queue.DateUpdated = DateTime.Now;

            using MySqlConnection conexaoBD = new MySqlConnection(connectionString);
            conexaoBD.Execute(query, queue);
        }
    }
}