﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;

public partial class GreatBooksDBEntities : DbContext
{
    public GreatBooksDBEntities()
        : base("name=GreatBooksDBEntities")
    {
    }

    protected override void OnModelCreating(DbModelBuilder modelBuilder)
    {
        throw new UnintentionalCodeFirstException();
    }

    public virtual DbSet<Author> Authors { get; set; }
    public virtual DbSet<BookCategory> BookCategories { get; set; }
    public virtual DbSet<BookFormat> BookFormats { get; set; }
    public virtual DbSet<Book> Books { get; set; }
    public virtual DbSet<Customer> Customers { get; set; }
    public virtual DbSet<EmployeeRole> EmployeeRoles { get; set; }
    public virtual DbSet<Employee> Employees { get; set; }
    public virtual DbSet<Language> Languages { get; set; }
    public virtual DbSet<OrderDetail> OrderDetails { get; set; }
    public virtual DbSet<Order> Orders { get; set; }
    public virtual DbSet<Publisher> Publishers { get; set; }
}