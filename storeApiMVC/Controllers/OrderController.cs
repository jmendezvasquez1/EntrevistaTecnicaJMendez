using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using storeApiMVC.ModelDTO;
using storeApiMVC.Models;

namespace storeApiMVC.Controllers
{
    public class OrderController : ApiController
    {
        [HttpGet]
        [ActionName ("GetOrders")]
        public List<OrdersDTO> GetOrders()
        {
            using (var context = new storeEntities())
            {
                var orders = (from m in context.orders
                              select new OrdersDTO()
                              {
                                  Costumer = (int)m.costumer,
                                  //CostumerName = context.costumers.Where(x => x.idCostumer == (int)(m.costumer)).First().costumerName,
                                  dateRegister = m.dateRegister,
                                  OrderId = m.idOrder,
                                  total = (decimal) m.orderDetails.Sum(x=>x.quantity * x.price)
                              }).ToList();
                return orders;
            }
        }

        [HttpGet]
        [ActionName ("GetOrderDetails")]
        public List<OrderDetailsDTO> GetOrderDetails(int id)
        {
            using (var context = new storeEntities())
            {
                var orders = (from m in context.orderDetails.Where(x => x.idOrder ==id).ToList()
                              select new OrderDetailsDTO()
                              { OrderId = id,
                                  Product = (int)m.product,
                                  ProductName = context.products.Where(x => x.idProduct == (int)m.product).First().productName,
                                  Quantity =(int) m.quantity
                              }).ToList();
                return orders;
            }
        }

    }
}
