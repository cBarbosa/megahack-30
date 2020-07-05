using meally_api.Command;
using meally_api.Services.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace meally_api.Controllers
{
    [ApiController]
    public class OrderController : ControllerBase
    {
        private readonly IOrderService orderService;

        public OrderController(
            IOrderService _orderService)
        {
            orderService = _orderService;
        }

        [HttpGet]
        [Produces("application/json")]
        [Route("[controller]/restaurant/{id}")]
        public IActionResult GetByRestaurantId(int id)
        {
            return Ok(orderService.GetByRestaurantId(id));
        }

        [HttpGet]
        [Produces("application/json")]
        [Route("[controller]/{id}")]
        public IActionResult GetById(int id)
        {
            return Ok(orderService.GetById(id));
        }

        [HttpPost]
        [Produces("application/json")]
        [Route("[controller]")]
        public IActionResult Post([FromBody] OrderCommand order)
        {
            try
            {
                return Ok(orderService.Insert(order));
            } catch { }

            return BadRequest("Order was not registered");
        }

        [HttpPost]
        [Produces("application/json")]
        [Route("[controller]/item")]
        public IActionResult PostItem([FromBody] OrderItemCommand orderItem)
        {
            if(orderService.AddItem(orderItem))
                return Ok(orderService.AddItem(orderItem));

            return BadRequest("Item was not registered");
        }
    }
}