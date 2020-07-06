using Dapper;
using meally_api.Data.Interfaces;
using meally_api.Domain;
using Microsoft.Extensions.Configuration;
using MySql.Data.MySqlClient;
using System.Linq;

namespace meally_api.Data
{
    public class UserDAO : IUserDAO
    {
        public static string connectionString { get; set; }

        public UserDAO(IConfiguration _configuration)
        {
            connectionString = _configuration["ConnectionStrings:MysqlConnectionString"];
        }

        public User GetByEmail(string email)
        {
            var query = @"
                        Select
                            User.*,
                            Restaurant.RestaurantId,
                            Restaurant.Name,
                            Restaurant.Photo,
                            Restaurant.Address,
                            Restaurant.Coordinate_Latitude Latitude,
                            Restaurant.Coordinate_Longitude Longitude
                        From User
                            Inner Join Restaurant On Restaurant.RestaurantId = User.RestaurantId
                        Where User.Email = @email
                    ;";

            using (MySqlConnection conexaoBD = new MySqlConnection(connectionString))
            {
                return conexaoBD.Query<User, Restaurant, Coordinate, User>(query,
                    (queue, restaurant, coordinate) =>
                    {
                        if (coordinate != null)
                        {
                            restaurant.Coordinate = coordinate;
                        }

                        queue.Restaurant = restaurant;
                        return queue;
                    }, new { email }, splitOn: "UserId, RestaurantId, Latitude")
                    .SingleOrDefault();
            };
        }

        public void Save(User user)
        {
            var query = @"
                    Update User
                        Set Name = @Name,
                        Email = @Email,
                        Password = @Password,
                        Role = @Role,
                        Photo = @Photo
                    Where UserId = @UserId
                    ;";

            using MySqlConnection conexaoBD = new MySqlConnection(connectionString);
            conexaoBD.Execute(query, user);
        }

        public User Insert(User user)
        {
            var query = @"
                    Insert Into User(RestaurantId, Name, Email, Password, Role, Photo)
                    Values(@RestaurantId, @Name, @Email, @Password, @Role, @Photo);
                    SELECT LAST_INSERT_ID();
                    ;";

            using MySqlConnection conexaoBD = new MySqlConnection(connectionString);
            user.UserId = conexaoBD.Query<int>(query, user).SingleOrDefault();

            return user;
        }
    }
}