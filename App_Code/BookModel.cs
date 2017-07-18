using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


    /// <summary>
    /// Summary description for BookModel
    /// </summary>
    public class BookModel
    {
        public Book GetBook(string id)
        {
            try
            {
                using (GreatBooksDBEntities db = new global::GreatBooksDBEntities())
                {
                    Book book = db.Books.Find(id);
                    return book;
                }
            }
            catch (Exception ex)
            {
                return null;
            }
        }

    }

