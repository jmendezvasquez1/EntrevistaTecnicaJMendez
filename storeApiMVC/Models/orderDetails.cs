//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace storeApiMVC.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class orderDetails
    {
        public int idDetail { get; set; }
        public Nullable<int> idOrder { get; set; }
        public Nullable<int> product { get; set; }
        public Nullable<int> quantity { get; set; }
        public Nullable<decimal> price { get; set; }
    
        public virtual orders orders { get; set; }
        public virtual products products { get; set; }
    }
}
