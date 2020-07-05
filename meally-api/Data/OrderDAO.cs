using Dapper;
using meally_api.Data.Interfaces;
using meally_api.Domain;
using Microsoft.Extensions.Configuration;
using MySql.Data.MySqlClient;
using System.Collections.Generic;
using System.Linq;

namespace meally_api.Data
{
    public class OrderDAO : IOrderDAO
    {
        public static string connectionString { get; set; }

        public OrderDAO(IConfiguration _configuration)
        {
            connectionString = _configuration["ConnectionStrings:MysqlConnectionString"];
        }

        public Order GetById(int id)
        {
            var query = @"
                        Select
                            `Order`.OrderId,
                            `Order`.TransactionId,
                            `Order`.Quantity,
                            `Order`.Amount,
                            `Order`.Status,
                            `Order`.StatusCode,
                            `Order`.DateCreated,
                            `Order`.DateUpdated,
                            `Order`.DateDelivered,
                            Customer.CustomerId,
                            Customer.Name,
                            Customer.NickName,
                            Customer.Email,
                            Restaurant.RestaurantId,
                            Restaurant.Name,
                            Restaurant.Photo,
                            Restaurant.Address,
                            Restaurant.Coordinate_Latitude Latitude,
                            Restaurant.Coordinate_Longitude Longitude
                        From `Order`
                            Inner Join Customer On Customer.CustomerId = `Order`.CustomerId
                            Inner Join Restaurant On Restaurant.RestaurantId = `Order`.RestaurantId
                        Where Order.OrderId = @id
                    ;";

            using (MySqlConnection conexaoBD = new MySqlConnection(connectionString))
            {
                return conexaoBD.Query<Order, Customer, Restaurant, Coordinate, Order>(query,
                    (order, customer, restaurant, coordinate) =>
                    {
                        if (coordinate != null)
                        {
                            restaurant.Coordinate = coordinate;
                        }

                        if (customer != null)
                        {
                            order.Customer = customer;
                        }
                        
                        order.Restaurant = restaurant;

                        var items = GetItemsByOrderId(order.OrderId);
                        if (items.Count() > 0)
                        {
                            order.Items = items;
                        }
                        return order;
                    }, new { id }, splitOn: "OrderId, CustomerId, RestaurantId, Latitude")
                    .SingleOrDefault();
            };
        }

        public IEnumerable<Order> GetByRestaurantId(int id)
        {
            var query = @"
                        Select
                            `Order`.OrderId,
                            `Order`.TransactionId,
                            `Order`.Quantity,
                            `Order`.Amount,
                            `Order`.Status,
                            `Order`.StatusCode,
                            `Order`.DateCreated,
                            `Order`.DateUpdated,
                            `Order`.DateDelivered,
                            Customer.CustomerId,
                            Customer.Name,
                            Customer.NickName,
                            Customer.Email
                        From `Order`
                            Inner Join Customer On Customer.CustomerId = `Order`.CustomerId
                        Where Order.RestaurantId = @id
                    ;";

            using (MySqlConnection conexaoBD = new MySqlConnection(connectionString))
            {
                return conexaoBD.Query<Order, Customer, Order>(query,
                    (order, customer) =>
                    {
                        if (customer != null)
                        {
                            order.Customer = customer;
                        }

                        return order;
                    }, new { id }, splitOn: "OrderId, CustomerId")
                    .ToList();
            };
        }

        public IEnumerable<OrderItems> GetItemsByOrderId(int id)
        {
            var query = @"Select
                            OrderItems.Quantity,
                            OrderItems.Amount,
                            Meal.MealId,
                            Meal.Code,
                            Meal.Description,
                            Meal.Ingredients,
                            Meal.Name,
                            Meal.Photo,
                            Meal.Price
                        From OrderItems
                        Inner Join Meal On OrderItems.MealId = Meal.MealId
                        Where OrderItems.OrderId = @id
                    ;";

            using MySqlConnection conexaoBD = new MySqlConnection(connectionString);
            return conexaoBD.Query<OrderItems>(query, new { id }).ToList();
        }

        public Order Insert(Order order)
        {
            var query = @"
                    Insert Into `Order`(RestaurantId, CustomerId, Amount, Quantity, Status, StatusCode, DateCreated, DateUpdated)
                    Values(@RestaurantId, @CustomerId, @Amount, @Quantity, @Status, @StatusCode, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
                    SELECT LAST_INSERT_ID();
                    ;";

            using MySqlConnection conexaoBD = new MySqlConnection(connectionString);
            order.OrderId = conexaoBD.Query<int>(query, new
            {
                order.Restaurant.RestaurantId,
                order.Customer.CustomerId,
                order.Amount,
                order.Quantity,
                order.Status,
                order.StatusCode
            }).SingleOrDefault();

            return order;
        }

        public void Update(Order order)
        {
            var query = @"
                    Update `Order`
                        Set Status = @Status,
                        StatusCode = @StatusCode,
                        DateUpdated = @DateUpdated,
                        DateDelivered = @DateDelivered
                    Where `Order`.OrderId = @OrderId
                    ;";

            using MySqlConnection conexaoBD = new MySqlConnection(connectionString);
            conexaoBD.Execute(query, order);
        }

        public void InsertItem(OrderItems orderItem)
        {
            var query = @"
                    Insert Into OrderItems(OrderId, MealId, Amount, Quantity)
                    Values(@OrderId, @MealId, @Amount, @Quantity);
                    ;";

            using MySqlConnection conexaoBD = new MySqlConnection(connectionString);
            conexaoBD.Execute(query, new
            {
                orderItem.OrderId,
                orderItem.Meal.MealId,
                orderItem.Amount,
                orderItem.Quantity
            });
        }
    }
}