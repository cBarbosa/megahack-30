using meally_api.Command;
using meally_api.Services.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace meally_api.Controllers
{
    [ApiController]
    public class RankController : ControllerBase
    {
        private readonly IRankService rankService;

        public RankController(
            IRankService _rankService)
        {
            rankService = _rankService;
        }

        [HttpPost]
        [Produces("application/json")]
        [Route("[controller]")]
        public IActionResult Post([FromBody] RankCommand rank)
        {
            try
            {
                return Ok(rankService.Insert(rank));
            }
            catch { }

            return BadRequest("Rank was not registered");
        }

        [HttpGet]
        [Produces("application/json")]
        [Route("[controller]/restaurant/{id}")]
        public IActionResult Get(int id)
        {
            return Ok(rankService.GetByRestaurantId(id));
        }
    }
}