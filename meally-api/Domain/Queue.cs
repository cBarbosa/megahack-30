using System;

namespace meally_api.Domain
{
    public class Queue
    {
        public int QueueId { get; set; }
        public int RestaurantId { get; set; }
        public string Phone { get; set; }
        public int Status { get; set; }
        public DateTime? ETA { get; set; }
        public DateTime? DateUpdated { get; set; }
        public DateTime? DateCanceled { get; set; }
        public DateTime? DateFinished { get; set; }
        public DateTime DateCreated { get; set; }

        public virtual Restaurant Restaurant { get; set; }
    }
}