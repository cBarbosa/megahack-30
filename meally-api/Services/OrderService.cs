using meally_api.Command;
using meally_api.Data.Interfaces;
using meally_api.Domain;
using meally_api.Services.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;

namespace meally_api.Services
{
    public class OrderService : IOrderService
    {
        public readonly IOrderDAO repository;

        public OrderService(IOrderDAO _repository)
        {
            repository = _repository;
        }

        public Order GetById(int id)
        {
            return repository.GetById(id);
        }

        public IEnumerable<Order> GetByRestaurantId(int id)
        {
            return repository.GetByRestaurantId(id);
        }

        public bool AddItem(OrderItemCommand orderItem)
        {
            var _orderItem = BindOrderItem(orderItem);

            try
            {
                repository.InsertItem(_orderItem);
                return true;
            } catch(Exception ex) { Console.WriteLine(ex.Message); }
            return false;
        }

        public Order Insert(OrderCommand order)
        {
            var _order = BindItem(order);

            _order = repository.Insert(_order);

            foreach (var item in order.Items)
            {
                item.OrderId = _order.OrderId;
                repository.InsertItem(BindOrderItem(item));
            }

            return GetById(_order.OrderId);
        }

        private Order BindItem(OrderCommand order)
        {
            return new Order
            {
                Customer = new Customer
                {
                    CustomerId = order.CustomerId
                },
                Restaurant = new Restaurant
                {
                    RestaurantId = order.RestaurantId
                },
                Items = order.Items.Select(x => new OrderItems
                {
                    Amount = x.Amount,
                    Quantity = x.Quantity,
                    Meal = new Meal
                    {
                        MealId = x.MealId
                    }
                })
            };
        }

        private OrderItems BindOrderItem(OrderItemCommand orderItem)
        {
            return new OrderItems
            {
                OrderId = orderItem.OrderId.Value,
                Amount = orderItem.Amount,
                Quantity = orderItem.Quantity,
                Meal = new Meal
                {
                    MealId = orderItem.MealId
                }
            };
        }
    }
}