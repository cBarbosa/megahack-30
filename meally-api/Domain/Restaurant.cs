using System;

namespace meally_api.Domain
{
    public class Restaurant
    {
        public int RestaurantId { get; set; }
        public string Name { get; set; }
        public string Address { get; set; }
        public string Photo { get; set; }
        public Coordinate Coordinate { get; set; }
        
        public virtual Menu Menu { get; set; }
    }
}