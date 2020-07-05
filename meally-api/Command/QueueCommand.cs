using System;

namespace meally_api.Command
{
    public class QueueCommand
    {
        public int RestaurantId { get; set; }
        public string Phone { get; set; }
        public int Status { get; set; }
        public DateTime? DateUpdated { get; set; }
        public DateTime? DateCanceled { get; set; }
        public DateTime? DateFinished { get; set; }
        public DateTime DateCreated { get; set; }
    }
}