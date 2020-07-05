using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace meally_api.Command
{
    public class OrderCommand
    {
        public string TransactionId { get; set; }
        public int CustomerId { get; set; }
        public int RestaurantId { get; set; }
        public int Quantity { get; set; }
        public double Amount { get; set; }
        public int? Status { get; set; }
        public string StatusCode { get; set; }
        public IEnumerable<OrderItemCommand> Items { get; set; }
    }

    public class OrderItemCommand
    {
        public int? OrderId { get; set; }
        public int MealId { get; set; }
        public int Quantity { get; set; }
        public double Amount { get; set; }
    }
}