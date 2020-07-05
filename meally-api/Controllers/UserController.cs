using meally_api.Command;
using meally_api.Services.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace meally_api.Controllers
{
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly IUserService userService;

        public UserController(
            IUserService _userService)
        {
            userService = _userService;
        }

        [HttpGet]
        [Produces("application/json")]
        [Route("[controller]/email/{email}")]
        public IActionResult GetByRestaurantId(string email)
        {
            return Ok(userService.GetUserByEmail(email));
        }

        [HttpPost]
        [Produces("application/json")]
        [Route("[controller]")]
        public IActionResult Post([FromBody]UserCommand user)
        {
            try
            {
                userService.Save(user);
            }
            catch
            {
                return BadRequest("User was not updated");
            }
            return Ok("User was successfuly saved");
        }
    }
}