namespace meally_api.Domain
{
    public class OrderItems
    {
        public int OrderId { get; set; }
        public Meal Meal { get; set; }
        public int Quantity { get; set; }
        public double Amount { get; set; }
    }
}