﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Collections.Generic;

public partial class Author
{
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
    public Author()
    {
        this.Books = new HashSet<Book>();
    }

    public int AuthorID { get; set; }
    public string AuthorName { get; set; }

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
    public virtual ICollection<Book> Books { get; set; }
}

public partial class Book
{
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
    public Book()
    {
        this.OrderDetails = new HashSet<OrderDetail>();
    }

    public string ISBN { get; set; }
    public int AuthorID { get; set; }
    public int CategoryID { get; set; }
    public int PublisherID { get; set; }
    public int LanguageID { get; set; }
    public int FormatID { get; set; }
    public Nullable<System.DateTime> AddedDate { get; set; }
    public Nullable<System.DateTime> PublishedDate { get; set; }
    public Nullable<int> Quantity { get; set; }
    public string Title { get; set; }
    public decimal Price { get; set; }
    public string Description { get; set; }
    public string AgeGroup { get; set; }
    public Nullable<int> Pages { get; set; }
    public string Dimensions { get; set; }
    public string DeletedFlag { get; set; }

    public virtual Author Author { get; set; }
    public virtual BookCategory BookCategory { get; set; }
    public virtual BookFormat BookFormat { get; set; }
    public virtual Language Language { get; set; }
    public virtual Publisher Publisher { get; set; }
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
    public virtual ICollection<OrderDetail> OrderDetails { get; set; }
}

public partial class BookCategory
{
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
    public BookCategory()
    {
        this.Books = new HashSet<Book>();
    }

    public int CategoryID { get; set; }
    public string CategoryName { get; set; }

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
    public virtual ICollection<Book> Books { get; set; }
}

public partial class BookFormat
{
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
    public BookFormat()
    {
        this.Books = new HashSet<Book>();
    }

    public int FormatID { get; set; }
    public string FormatName { get; set; }

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
    public virtual ICollection<Book> Books { get; set; }
}

public partial class Customer
{
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
    public Customer()
    {
        this.Orders = new HashSet<Order>();
    }

    public string CustomerUserName { get; set; }
    public string FirstName { get; set; }
    public string LastName { get; set; }
    public Nullable<System.DateTime> DateOfBirth { get; set; }
    public string Address { get; set; }
    public string ContactNumber { get; set; }
    public Nullable<decimal> CreditAmount { get; set; }
    public string DeletedFlag { get; set; }

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
    public virtual ICollection<Order> Orders { get; set; }
}

public partial class Employee
{
    public string EmployeeUserName { get; set; }
    public int RoleID { get; set; }
    public string FirstName { get; set; }
    public string LastName { get; set; }
    public string ContactNumber { get; set; }
    public string DeletedFlag { get; set; }

    public virtual EmployeeRole EmployeeRole { get; set; }
}

public partial class EmployeeRole
{
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
    public EmployeeRole()
    {
        this.Employees = new HashSet<Employee>();
    }

    public int RoleID { get; set; }
    public string RoleName { get; set; }

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
    public virtual ICollection<Employee> Employees { get; set; }
}

public partial class Language
{
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
    public Language()
    {
        this.Books = new HashSet<Book>();
    }

    public int LanguageID { get; set; }
    public string LanguageName { get; set; }

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
    public virtual ICollection<Book> Books { get; set; }
}

public partial class Order
{
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
    public Order()
    {
        this.OrderDetails = new HashSet<OrderDetail>();
    }

    public int OrderID { get; set; }
    public string CustomerUserName { get; set; }
    public System.DateTime OrderDate { get; set; }
    public string OrderStatus { get; set; }

    public virtual Customer Customer { get; set; }
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
    public virtual ICollection<OrderDetail> OrderDetails { get; set; }
}

public partial class OrderDetail
{
    public int OrderDetailsID { get; set; }
    public int OrderID { get; set; }
    public string ISBN { get; set; }
    public int Quantity { get; set; }

    public virtual Book Book { get; set; }
    public virtual Order Order { get; set; }
}

public partial class Publisher
{
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
    public Publisher()
    {
        this.Books = new HashSet<Book>();
    }

    public int PublisherID { get; set; }
    public string PublisherName { get; set; }

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
    public virtual ICollection<Book> Books { get; set; }
}
