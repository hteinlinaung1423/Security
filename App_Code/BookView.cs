using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BookView
/// </summary>
public class BookView
{
    int QUANTITY_MAX = 10;
    string imagePath, title, author, format, language, isbn;
    int quantity;
    List<int> quantityOptions;
    double price;
    public BookView(Book book, int quantity)
    {
        fillFields(book);
        this.quantity = quantity;

        quantityOptions = new List<int>();
        for (int i = 0; i < QUANTITY_MAX; i++)
        {
            quantityOptions.Add(i + 1);
        }
    }

    public string ImagePath { get { return imagePath; } }
    public string Title { get { return title; } }
    public string Author { get { return author; } }
    public string Format { get { return format; } }
    public string Language { get { return language; } }
    public double Price { get { return price; } }
    public int Quantity { get { return quantity; } set { quantity = value; } }
    public double Subtotal { get { return price * quantity; } }
    public int[] QuantityOptions { get { return quantityOptions.ToArray(); } }
    public string ISBN { get { return isbn; } }

    private void fillFields(Book book)
    {
        imagePath = book.ISBN + ".jpg";
        title = book.Title;
        price = Convert.ToDouble(book.Price);
        isbn = book.ISBN;
        using (GreatBooksDBEntities context = new GreatBooksDBEntities())
        {
            author = context.Authors.Find(book.AuthorID).AuthorName;
            format = context.BookFormats.Find(book.FormatID).FormatName;
            language = context.Languages.Find(book.LanguageID).LanguageName;
        }
    }
}