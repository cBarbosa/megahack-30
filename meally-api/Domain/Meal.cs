using System;

namespace meally_api.Domain
{
    public class Meal
    {
        public int MealId { get; set; }
        public string Name { get; set; }
        public string Code { get; set; }
        public string Ingredients { get; set; }
        public string Description { get; set; }
        public double Price { get; set; }
        public string Photo { get; set; }
    }
}