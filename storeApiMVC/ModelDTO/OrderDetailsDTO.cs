using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace storeApiMVC.ModelDTO
{
    public class OrderDetailsDTO:OrdersDTO
    {
        public int Product { get; set; }
        public string ProductName { get; set; }
        public int Quantity { get; set; }
    }
}