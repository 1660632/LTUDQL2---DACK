//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DA_LTUDQL2.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class FavorList
    {
        public int Id { get; set; }
        public int IdUser { get; set; }
        public string DisplayNameObject { get; set; }
    
        public virtual User User { get; set; }
    }
}