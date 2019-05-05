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
    
    public partial class Object
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Object()
        {
            this.InputInfoes = new HashSet<InputInfo>();
            this.MyPlaylists = new HashSet<MyPlaylist>();
            this.PayHistories = new HashSet<PayHistory>();
        }
    
        public int Id { get; set; }
        public string DisplayName { get; set; }
        public int IdUnit { get; set; }
        public int IdKind { get; set; }
        public int IdSuplier { get; set; }
        public System.TimeSpan Length { get; set; }
        public string View { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<InputInfo> InputInfoes { get; set; }
        public virtual KindVideo KindVideo { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<MyPlaylist> MyPlaylists { get; set; }
        public virtual Suplier Suplier { get; set; }
        public virtual Unit Unit { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PayHistory> PayHistories { get; set; }
    }
}
