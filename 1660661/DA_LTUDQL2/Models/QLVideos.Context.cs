﻿//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DA_LTUDQL2.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class QLVideoEntities : DbContext
    {
        public QLVideoEntities(): base("name=QLVideoEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public DbSet<Customer> Customers { get; set; }
        public DbSet<FavoriteList> FavoriteLists { get; set; }
        public DbSet<InputInfo> InputInfoes { get; set; }
        public DbSet<KindVideo> KindVideos { get; set; }
        public DbSet<MyPlaylist> MyPlaylists { get; set; }
        public DbSet<Object> Objects { get; set; }
        public DbSet<PayHistory> PayHistories { get; set; }
        public DbSet<Suplier> Supliers { get; set; }
        public DbSet<Unit> Units { get; set; }
        public DbSet<UserRole> UserRoles { get; set; }
        public DbSet<User> Users { get; set; }
        public DbSet<ViewList> ViewLists { get; set; }
    }
}