using System;
using System.Collections.Generic;

namespace meally_api.Domain
{
    public class Order
    {
        public int OrderId { get; set; }
        public string TransactionId { get; set; }
        public Customer Customer { get; set; }
        public Restaurant Restaurant { get; set; }
        public int? Quantity { get; set; }
        public double? Amount { get; set; }
        public int? Status { get; set; }
        public string StatusCode { get; set; }
        public DateTime DateCreated { get; set; }
        public DateTime? DateUpdated { get; set; }
        public DateTime? DateDelivered { get; set; }
        public IEnumerable<OrderItems> Items { get; set; }
    }
}