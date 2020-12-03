using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace storeApiMVC.ModelDTO
{
    public class OrdersDTO
    {
        public int OrderId { get; set; }
        public int Costumer { get; set; }
        public string CostumerName { get; set; }
        public DateTime dateRegister { get; set; }
        public decimal total { get; set; }
    }
}