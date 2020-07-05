using meally_api.Command;
using meally_api.Services.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace meally_api.Controllers
{
    [ApiController]
    public class RestaurantController : ControllerBase
    {
        private readonly IRestaurantService restaurantService;

        public RestaurantController(
            IRestaurantService _restaurantService)
        {
            restaurantService = _restaurantService;
        }

        [HttpGet]
        [Produces("application/json")]
        [Route("[controller]")]
        public IActionResult Get()
        {
            return Ok(restaurantService.GetAll());
        }

        [HttpGet]
        [Produces("application/json")]
        [Route("[controller]/{id}")]
        public IActionResult GetById(int id)
        {
            return Ok(restaurantService.GetById(id));
        }

        [HttpPost]
        [Produces("application/json")]
        [Route("[controller]")]
        public IActionResult Post([FromBody] RestaurantCommand restaurant)
        {
            try
            {
                restaurantService.Update(restaurant);
            }
            catch
            {
                return BadRequest($"Restaurant was not updated");
            }

            return Ok("Restaurant was updated succeessfuly");
        }
    }
}