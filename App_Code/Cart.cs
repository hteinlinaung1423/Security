using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Cart
/// </summary>
public class Cart
{
    private List<Book> books;
    //private List<string> bookISBNs;
    private double discount;

    public Cart(List<Book> books, double discount)
    {
        this.books = books;
        //bookISBNs = new List<string>();
        //foreach(Book book in books)
        //{
        //    if (!bookISBNs.Contains(book.ISBN))
        //    {
        //        bookISBNs.Add(book.ISBN);
        //    }
        //}
        this.discount = discount;
    }

    public Cart(List<Book> books) : this(books, 0.0)
    {
    }

    public Cart() : this(new List<Book>(), 0.0)
    {
    }

    public void AddBook(Book book)
    {
        books.Add(book);
    }

    public void AddBook(string isbn)
    {
        books.Add(getBookWithISBN(isbn));
    }
    public void AddBook(string isbn, int quantity)
    {
        Book book = getBookWithISBN(isbn);
        for (int i = 0; i < quantity; i++)
        {
            books.Add(book);
        }
    }

    public void SetQuantityOfBook(string isbn, int quantity)
    {
        List<Book> booksToRemove = books.Where(x => x.ISBN == isbn).ToList();
        //foreach (Book book in booksToRemove)
        //{
        //    booksToRemove.Remove(book);
        //}
        books.RemoveAll(x => booksToRemove.Contains(x));

        AddBook(isbn, quantity);
    }

    public void RemoveBook(Book book)
    {
        books.Remove(book);
    }

    public int GetNumberOfBooksWithISBN(string isbn)
    {
        //int quantity = 0;
        //foreach (Book book in books)
        //{
        //    if (book.ISBN == isbn)
        //    {
        //        quantity++;
        //    }
        //}
        return books.Where(x => x.ISBN == isbn).Count();
    }

    public List<Book> GetAllBooks()
    {
        return books;
    }

    public List<Book> GetAllUniqueBooks()
    {
        List<Book> books = new List<Book>();
        foreach (Book book in GetAllBooks())
        {
            if (!books.Exists(x => x.ISBN == book.ISBN))
            {
                // no book
                books.Add(book);
            }
        }
        return books;
    }

    public int TotalNumberOfBooks
    {
        get { return books.Count; }
    }

    public double TotalPrice
    {
        get
        {
            return getCostOfBooks();
        }
    }

    public double TotalPriceAfterDiscount
    {
        get
        {
            return getCostOfBooks() * (1 - discount);
        }
    }

    public double Discount
    {
        get { return discount; }
        set { discount = value; }
    }

    private double getCostOfBooks()
    {
        double total = 0;
        foreach (Book book in books)
        {
            total += Convert.ToDouble(book.Price);
        }
        return total;
    }

    private List<Book> removeDuplicates(List<Book> books)
    {
        return books.Distinct().ToList();
    }
    private Book getBookWithISBN(string isbn)
    {
        using (GreatBooksDBEntities context = new GreatBooksDBEntities())
        {
            return context.Books.Find(isbn);
        }
    }
}