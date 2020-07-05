using System;
using System.Collections.Generic;

namespace meally_api.Domain
{
    public class Menu
    {
        public int MenuId { get; set; }

        public Restaurant Restaurant { get; set; }

        public IEnumerable<Meal> Meals { get; set; }
    }
}