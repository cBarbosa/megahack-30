namespace meally_api.Command
{
    public class RestaurantCommand
    {
        public int RestaurantId { get; set; }
        public string Name { get; set; }
        public string Address { get; set; }
        public string Photo { get; set; }
        public double Latitude { get; set; }
        public double Longitude { get; set; }
    }
}