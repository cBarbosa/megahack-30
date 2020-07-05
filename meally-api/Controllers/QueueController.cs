using meally_api.Command;
using meally_api.Services.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace meally_api.Controllers
{
    [ApiController]
    public class QueueController : ControllerBase
    {
        private readonly IQueueService queueService;

        public QueueController(
            IQueueService _queueService)
        {
            queueService = _queueService;
        }

        [HttpGet]
        [Produces("application/json")]
        [Route("[controller]/restaurant/{id}")]
        public IActionResult GetByRestaurantId(int id)
        {
            return Ok(queueService.GetByRestaurantId(id));
        }

        [HttpGet]
        [Produces("application/json")]
        [Route("[controller]/phone/{phone}")]
        public IActionResult GetByPhoneId(string phone)
        {
            return Ok(queueService.GetByPhone(phone));
        }

        [HttpPost]
        [Produces("application/json")]
        [Route("[controller]")]
        public IActionResult Post([FromBody] QueueCommand user)
        {
            try
            {
                queueService.Save(user);
            }
            catch
            {
                return BadRequest("Queue was not updated");
            }

            return Ok("Queue was successfuly saved");
        }
    }
}