namespace meally_api.Domain
{
    public class Rank
    {
        public int RankId { get; set; }
        public int? RestaurantId { get; set; }
        public double Rating { get; set; }
        public string Code { get; set; }

        public Restaurant Restaurant { get; set; }
    }
}