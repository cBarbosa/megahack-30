using System;

namespace meally_api.Domain
{
    public class Customer
    {
        public int CustomerId { get; set; }
        public string Name { get; set; }
        public string NickName { get; set; }
        public string Email { get; set; }
        public string Photo { get; set; }
    }
}