﻿namespace meally_api.Domain
{
    public class User
    {
        public int UserId { get; set; }
        public string Email { get; set; }
        public string Name { get; set; }
        public string Password { get; set; }
        public string Photo { get; set; }
        public string Role { get; set; }

        public Restaurant Restaurant { get; set; }
    }
}