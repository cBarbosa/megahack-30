using Dapper;
using meally_api.Data.Interfaces;
using meally_api.Domain;
using Microsoft.Extensions.Configuration;
using MySql.Data.MySqlClient;
using System.Linq;

namespace meally_api.Data
{
    public class RankDAO : IRankDAO
    {
        public static string connectionString { get; set; }

        public RankDAO(IConfiguration _configuration)
        {
            connectionString = _configuration["ConnectionStrings:MysqlConnectionString"];
        }

        public Rank GetByRestaurantId(int id)
        {
            var query = @"
                        Select
                            Rank.RankId,
                            (SUM(Rank.Rating) / COUNT(Rank.Rating)) Rating,
                            Restaurant.RestaurantId,
                            Restaurant.Name,
                            Restaurant.Photo,
                            Restaurant.Address,
                            Restaurant.Coordinate_Latitude Latitude,
                            Restaurant.Coordinate_Longitude Longitude
                        From Rank
                            Inner Join Restaurant On Restaurant.RestaurantId = Rank.RestaurantId
                        Where Rank.RestaurantId = @id
                    ;";

            using (MySqlConnection conexaoBD = new MySqlConnection(connectionString))
            {
                return conexaoBD.Query<Rank, Restaurant, Coordinate, Rank>(query,
                    (rank, restaurant, coordinate) =>
                    {
                        if (coordinate != null)
                        {
                            restaurant.Coordinate = coordinate;
                        }

                        rank.Restaurant = restaurant;
                        return rank;
                    }, new { id }, splitOn: "RankId, RestaurantId, Latitude")
                    .FirstOrDefault();
            };
        }

        public Rank Insert(Rank rank)
        {
            var query = @"
                    Insert Into Rank(RestaurantId, Rating, Code)
                    Values(@RestaurantId, @Rating, @Code);
                    SELECT LAST_INSERT_ID();
                    ;";

            using MySqlConnection conexaoBD = new MySqlConnection(connectionString);
            rank.RankId = conexaoBD.Query<int>(query, rank).SingleOrDefault();

            return rank;
        }
    }
}