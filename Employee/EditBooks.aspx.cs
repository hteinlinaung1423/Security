using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EditBooks : System.Web.UI.Page
{
    int DESCRIPTION_SHORT_LENGTH = 150;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            List<EditBookView> books = new List<EditBookView>();
            using (GreatBooksDBEntities context = new GreatBooksDBEntities())
            {
                books = context.Books.Where(x => x.DeletedFlag != "Y").OrderBy(x => x.Title).ToList().Select(book => new EditBookView(book)).ToList();
            }

            Session["editBooks_bookViews"] = books;

            BindGrid(GridView_EditBooks, books);
        }
    }

    private void EndGridEditing(GridView gv)
    {
        GridViewRow gvr = gv.Rows[gv.EditIndex];
        LinkButton linkEdit = (LinkButton)gvr.FindControl("LinkEdit");
        LinkButton linkDelete = (LinkButton)gvr.FindControl("LinkDelete");

        linkEdit.Text = "Edit";
        linkEdit.CommandName = "Edit";
        linkDelete.Text = "Delete";
        linkDelete.CommandName = "Delete";

        gv.EditIndex = -1;
        BindGrid(gv);
    }

    private void BindGrid(GridView gv)
    {
        List<EditBookView> books = (List<EditBookView>)Session["editBooks_bookViews"];

        BindGrid(gv, books);
    }

    private void BindGrid(GridView gv, List<EditBookView> editBookViews)
    {
        GridView_EditBooks.DataSource = editBookViews;
        GridView_EditBooks.DataBind();
    }

    public string getTextBoxControlID(string name)
    {
        if (GridView_EditBooks.EditIndex > 0)
        {
            GridViewRow row = GridView_EditBooks.Rows[GridView_EditBooks.EditIndex];
            return row.FindControl(name).ClientID;
        } else
        {
            return "Notfound";
        }
    }

    protected void GridView_EditBooks_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            // For edit state
            if ((e.Row.RowState & DataControlRowState.Edit) > 0)
            {
                GridViewRow row = e.Row;
                // Get dataItem
                EditBookView dataItem = (EditBookView)row.DataItem;
                // Get 5 ddls
                DropDownList category = (DropDownList)row.FindControl("DropDownList_Category");
                DropDownList author = (DropDownList)row.FindControl("DropDownList_Author");
                DropDownList language = (DropDownList)row.FindControl("DropDownList_Language");
                DropDownList publisher = (DropDownList)row.FindControl("DropDownList_Publisher");
                DropDownList format = (DropDownList)row.FindControl("DropDownList_Format");

                List<DropDownList> dropDowns = new List<DropDownList>();
                dropDowns.Add(category);
                dropDowns.Add(author);
                dropDowns.Add(language);
                dropDowns.Add(publisher);
                dropDowns.Add(format);
                // Get dataSources
                List<DropDownListItem> categories = new List<DropDownListItem>();
                List<DropDownListItem> authors;
                List<DropDownListItem> languages = new List<DropDownListItem>();
                List<DropDownListItem> publishers = new List<DropDownListItem>();
                List<DropDownListItem> formats = new List<DropDownListItem>();

                TextBox calendarDateAdded = (TextBox)row.FindControl("TextBox_DateAdded");
                TextBox calendarPublishedDate = (TextBox)row.FindControl("TextBox_PublishedDate");
                
                ClientScript.RegisterClientScriptBlock(this.GetType(), "AttachDatepickers",
    string.Format(@"
                $(function () {{
                    $('#{0}').datepicker({{ dateFormat: 'dd/mm/yy' }});
                    $('#{1}').datepicker({{ dateFormat: 'dd/mm/yy' }});
                }});
                ", calendarDateAdded.ClientID, calendarPublishedDate.ClientID), true);

                using (GreatBooksDBEntities context= new GreatBooksDBEntities())
                {
                    foreach (BookCategory cat in context.BookCategories.ToList())
                    {
                        DropDownListItem categoryItem = new DropDownListItem(cat.CategoryName, cat.CategoryID);
                        categories.Add(categoryItem);
                    }
                    authors = context.Authors.ToList().Select(a => new DropDownListItem(a.AuthorName, a.AuthorID)).ToList();
                    languages = context.Languages.ToList().Select(l => new DropDownListItem(l.LanguageName, l.LanguageID)).ToList();
                    publishers = context.Publishers.ToList().Select(p => new DropDownListItem(p.PublisherName, p.PublisherID)).ToList();
                    formats = context.BookFormats.ToList().Select(f => new DropDownListItem(f.FormatName, f.FormatID)).ToList();
                }
                // DataBind 5 ddls
                category.DataSource = categories;
                author.DataSource = authors;
                language.DataSource = languages;
                publisher.DataSource = publishers;
                format.DataSource = formats;
                // Set Fields and DataBind
                foreach (DropDownList dropDown in dropDowns)
                {
                    dropDown.DataTextField = "Text";
                    dropDown.DataValueField = "Value";
                    dropDown.DataBind();
                }
                // Using the dataItem, set the default values
                category.SelectedValue = dataItem.Book.CategoryID.ToString();
                author.SelectedValue = dataItem.Book.AuthorID.ToString();
                language.SelectedValue = dataItem.Book.LanguageID.ToString();
                publisher.SelectedValue = dataItem.Book.PublisherID.ToString();
                format.SelectedValue = dataItem.Book.FormatID.ToString();
            }
        }
    }

    public string displayAsCurrency(double amount)
    {
        return string.Format("${0:0.00}", amount);
    }

    protected void GridView_EditBooks_RowEditing(object sender, GridViewEditEventArgs e)
    {
        // End current edit, if any
        if (GridView_EditBooks.EditIndex >= 0)
        {
            EndGridEditing(GridView_EditBooks);
        }
        // Start new edit
        GridView_EditBooks.EditIndex = e.NewEditIndex;

        BindGrid(GridView_EditBooks);
        GridViewRow gvr = GridView_EditBooks.Rows[e.NewEditIndex];
        LinkButton linkEdit = (LinkButton)gvr.FindControl("LinkEdit");
        LinkButton linkDelete = (LinkButton)gvr.FindControl("LinkDelete");
        TextBox calendarDateAdded = (TextBox)gvr.FindControl("TextBox_DateAdded");
        TextBox calendarPublishedDate = (TextBox)gvr.FindControl("TextBox_PublishedDate");

        linkEdit.Text = "Update";
        linkEdit.CommandName = "Update";
        linkDelete.Text = "Cancel";
        linkDelete.CommandName = "Cancel";
        System.Diagnostics.Debug.WriteLine("DEBUG Row editing");

        //ClientScript.RegisterClientScriptBlock(this.GetType(), "AttachDatepickers",
        //    string.Format(@"
        //        $(function () {{
        //            $('#{0}').datepicker({{ dateFormat: 'dd/mm/yy' }});
        //            $('#{1}').datepicker({{ dateFormat: 'dd/mm/yy' }});
        //        }});
        //        ", calendarDateAdded.ClientID, calendarPublishedDate.ClientID), true);
    }

    protected void GridView_EditBooks_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        EndGridEditing(GridView_EditBooks);
    }

    protected void Button_ViewDescription_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        GridViewRow gvr = (GridViewRow)btn.NamingContainer;

        Label descriptionLabel = (Label)gvr.FindControl("Label_Description");
        string isbn = ((Label)gvr.FindControl("Label_ISBN")).Text;

        string newDescription = descriptionLabel.Text;
        using (GreatBooksDBEntities context = new GreatBooksDBEntities())
        {
            newDescription = context.Books.Find(isbn).Description;
        }

        if (btn.Text == "Read more")
        {
            // Show more info
            btn.Text = "Read less";
        }
        else
        {
            // Show less info
            if (newDescription.Length > DESCRIPTION_SHORT_LENGTH)
            {
                newDescription = newDescription.Substring(0, DESCRIPTION_SHORT_LENGTH) + "...";
            }
            btn.Text = "Read more";
        }

        descriptionLabel.Text = newDescription.Trim();
    }

    protected void Button_ResetDescription_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        GridViewRow gvr = (GridViewRow)btn.NamingContainer;

        Literal descriptionLiteral = (Literal)gvr.FindControl("Literal_Description");
        string isbn = ((Label)gvr.FindControl("Label_ISBNEdit")).Text;

        string newDescription = descriptionLiteral.Text;
        using (GreatBooksDBEntities context = new GreatBooksDBEntities())
        {
            newDescription = context.Books.Find(isbn).Description;
        }

        descriptionLiteral.Text = newDescription.Trim();
    }

    protected void GridView_EditBooks_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int rowIndex = e.RowIndex;
        GridViewRow row = GridView_EditBooks.Rows[rowIndex];

        // Find all controls
        string[] textBoxNames = { "TextBox_Title", "TextBox_Pages", "TextBox_AgeGroup", "TextBox_DateAdded",
                                "TextBox_PublishedDate", "TextBox_Dimensions", "TextBox_Price", "TextBox_Quantity" };
        List<TextBox> textBoxes = new List<TextBox>();

        textBoxNames.ToList().ForEach(name =>
        {
            textBoxes.Add((TextBox)row.FindControl(name));
        });

        string[] dropDownNames = { "DropDownList_Category", "DropDownList_Author",
                                "DropDownList_Language", "DropDownList_Publisher",
                                "DropDownList_Format" };
        List<DropDownList> dropDowns = new List<DropDownList>();

        dropDownNames.ToList().ForEach(name =>
        {
            dropDowns.Add((DropDownList)row.FindControl(name));
        });

        Literal descriptionTextArea = (Literal)row.FindControl("Literal_Description");
        // Get values from controls
        string title = textBoxes[0].Text;
        string pages = textBoxes[1].Text;
        string ageGroup = textBoxes[2].Text;
        string dateAdded = textBoxes[3].Text;
        string publishedDate = textBoxes[4].Text;
        string dimensions = textBoxes[5].Text;
        string price = textBoxes[6].Text;
        string quantity = textBoxes[7].Text;
        int categoryID = dropDowns[0].SelectedValue.ToInt32Ext();
        int authorID = dropDowns[1].SelectedValue.ToInt32Ext();
        int languageID = dropDowns[2].SelectedValue.ToInt32Ext();
        int publisherID = dropDowns[3].SelectedValue.ToInt32Ext();
        int formatID = dropDowns[4].SelectedValue.ToInt32Ext();
        string description = Request.Form["textArea_Description"];//descriptionTextArea.Text;
        // Find isbn (dataitem?)
        string isbn = ((Label)row.FindControl("Label_ISBNEdit")).Text;
        // Parse dates
        List<int> dateAddedArray = dateAdded.Split('/').Select(x => x.ToInt32Ext()).ToList();
        List<int> publishedDateArray = publishedDate.Split('/').Select(x => x.ToInt32Ext()).ToList();
        DateTime dateAddedDT = new DateTime(dateAddedArray[2], dateAddedArray[1], dateAddedArray[0]);
        DateTime publishedDateDT = new DateTime(publishedDateArray[2], publishedDateArray[1], publishedDateArray[0]);
        // save changes
        Book bookToEdit = new Book();
        using (GreatBooksDBEntities context = new GreatBooksDBEntities())
        {
            bookToEdit = context.Books.Find(isbn);

            bookToEdit.Title = title;
            bookToEdit.Pages = pages.ToInt32Ext();
            bookToEdit.AgeGroup = ageGroup;
            bookToEdit.AddedDate = dateAddedDT;
            bookToEdit.PublishedDate = publishedDateDT;
            bookToEdit.Dimensions = dimensions;
            bookToEdit.Price = price.ToDecimal();
            bookToEdit.Quantity = quantity.ToInt32Ext();
            bookToEdit.CategoryID = categoryID;
            bookToEdit.AuthorID = authorID;
            bookToEdit.LanguageID = languageID;
            bookToEdit.PublisherID = publisherID;
            bookToEdit.FormatID = formatID;
            bookToEdit.Description = description;

            context.SaveChanges();
        }

        List<EditBookView> bookList = (List<EditBookView>)Session["editBooks_bookViews"];

        EditBookView oldBook = bookList.Where(x => x.ISBN == bookToEdit.ISBN).First();

        int index = bookList.IndexOf(oldBook);

        bookList[index] = new EditBookView(bookToEdit);

        Session["editBooks_bookViews"] = bookList;

        EndGridEditing(GridView_EditBooks);
    }

    protected void GridView_EditBooks_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int rowIndex = e.RowIndex;
        GridViewRow row = GridView_EditBooks.Rows[rowIndex];

        string isbn = ((Label)row.FindControl("Label_ISBN")).Text;

        using (GreatBooksDBEntities context = new GreatBooksDBEntities())
        {
            Book bookToDelete = context.Books.Find(isbn);
            bookToDelete.DeletedFlag = "Y";
            context.SaveChanges();
        }

        BindGrid(GridView_EditBooks);
    }

    protected void GridView_EditBooks_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView_EditBooks.PageIndex = e.NewPageIndex;
        BindGrid(GridView_EditBooks);
    }

    protected void GridView_EditBooks_DataBound(object sender, EventArgs e)
    {
        GridViewRow topPagerRow = GridView_EditBooks.TopPagerRow;
        GridViewRow bottomPagerRow = GridView_EditBooks.BottomPagerRow;

        DropDownList topJumpToPage = (DropDownList)topPagerRow.FindControl("DropDownList_JumpToPage");
        DropDownList bottomJumpToPage = (DropDownList)bottomPagerRow.FindControl("DropDownList_JumpToPage");

        if (topJumpToPage != null)
        {
            for (int i = 0; i < GridView_EditBooks.PageCount; i++)
            {
                ListItem item = new ListItem("Page " + (i + 1));
                topJumpToPage.Items.Add(item);
                bottomJumpToPage.Items.Add(item);
            }
        }

        topJumpToPage.SelectedIndex = GridView_EditBooks.PageIndex;
        bottomJumpToPage.SelectedIndex = GridView_EditBooks.PageIndex;
    }

    protected void DropDownList_JumpToPage_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow topPagerRow = GridView_EditBooks.TopPagerRow;
        GridViewRow bottomPagerRow = GridView_EditBooks.BottomPagerRow;

        DropDownList topJumpToPage = (DropDownList)topPagerRow.FindControl("DropDownList_JumpToPage");
        DropDownList bottomJumpToPage = (DropDownList)bottomPagerRow.FindControl("DropDownList_JumpToPage");

        if ((DropDownList)sender == bottomJumpToPage)
        {
            GridView_EditBooks.PageIndex = bottomJumpToPage.SelectedIndex;
        } else
        {
        GridView_EditBooks.PageIndex = topJumpToPage.SelectedIndex;

        }
        BindGrid(GridView_EditBooks);
    }

    protected void Button_Search_Click(object sender, EventArgs e)
    {
        string searchTerm = TextBox_Search.Text;

        List<EditBookView> books = new List<EditBookView>();
        using (GreatBooksDBEntities context = new GreatBooksDBEntities())
        {
            books = context.Books
                .Where(x => x.DeletedFlag != "Y"
                        && (x.Title.Contains(searchTerm) || x.Author.AuthorName.Contains(searchTerm)))
                .ToList()
                .Select(book => new EditBookView(book))
                .ToList();
        }

        Session["editBooks_bookViews"] = books;

        Label_Results.Text = books.Count.ToString() + " results";

        DropDownList_SortBy_SelectedIndexChanged(sender, e);

        //BindGrid(GridView_EditBooks);
    }

    protected void DropDownList_SortBy_SelectedIndexChanged(object sender, EventArgs e)
    {
        string sortBy = DropDownList_SortBy.SelectedValue;

        List<EditBookView> books = (List<EditBookView>)Session["editBooks_bookViews"];

        switch (sortBy)
        {
            case "titleAscending":
                books = books.OrderBy(x => x.Title).ToList();
                break;
            case "titleDescending":
                books = books.OrderByDescending(x => x.Title).ToList();
                break;
            case "authorAscending":
                books = books.OrderBy(x => x.Author).ToList();
                break;
            case "authorDescending":
                books = books.OrderByDescending(x => x.Author).ToList();
                break;
            case "priceAscending":
                books = books.OrderBy(x => x.Price).ToList();
                break;
            case "priceDescending":
                books = books.OrderByDescending(x => x.Price).ToList();
                break;
            case "topSellers":
                // Get all order details
                List<OrderDetail> orderDetails = new List<OrderDetail>();
                using (GreatBooksDBEntities context = new GreatBooksDBEntities())
                {
                    orderDetails = context.OrderDetails.ToList();
                }

                // Create dictionary of order amounts per ISBN
                Dictionary<string, int> orderAmounts = new Dictionary<string, int>();

                foreach (OrderDetail od in orderDetails)
                {
                    if (orderAmounts.ContainsKey(od.ISBN))
                    {
                        orderAmounts[od.ISBN] = orderAmounts[od.ISBN] + od.Quantity;
                    } else
                    {
                        orderAmounts.Add(od.ISBN, od.Quantity);
                    }
                }

                List<string> isbnSorted = orderAmounts.OrderByDescending(x => x.Value).Select(x => x.Key).ToList();

                List<EditBookView> sortedBooks = new List<EditBookView>();

                foreach (string isbn in isbnSorted)
                {
                    EditBookView book = books.Find(b => b.ISBN == isbn);
                    if (book != null)
                    {
                        sortedBooks.Add(book);
                    }
                }

                books.ForEach(x =>
                {
                    System.Diagnostics.Debug.WriteLine(x.ISBN);

                    if (!sortedBooks.Contains(x))
                    {
                        sortedBooks.Add(x);
                    }
                });

                books = sortedBooks;

                break;
        }

        Session["editBooks_bookViews"] = books;

        GridView_EditBooks.PageIndex = 0;

        BindGrid(GridView_EditBooks, books);
    }
}

public static class StringExtensionClass
{
    public static int ToInt32Ext(this string s)
    {
        return Int32.Parse(s);
    }
    public static int ToInt32Static(string s)
    {
        return Int32.Parse(s);
    }
    public static double ToDouble(this string s)
    {
        return Double.Parse(s);
    }
    public static decimal ToDecimal(this string s)
    {
        return Decimal.Parse(s);
    }
}

public class DropDownListItem
{
    string text;
    int value;
    public string Text { get { return text; } }
    public int Value { get { return value; } }
    public DropDownListItem (string text, int value)
    {
        this.text = text;
        this.value = value;
    }
}

public class EditBookView
{
    int DESCRIPTION_SHORT_LENGTH = 150;

    Book book;
    string isbn, title, category, author, language, ageGroup, dateAdded, publisher, publishedDate, format, dimensions;
    string description;
    int pages, quantity;
    double price;

    public Book Book { get { return book; } }
    public string ISBN { get { return isbn; } }
    public string Title { get { return title; } }
    public string Category { get { return category; } }
    public string Author { get { return author; } }
    public string Language { get { return language; } }
    public string AgeGroup { get { return ageGroup; } }
    public string DateAdded { get { return dateAdded; } }
    public string Publisher { get { return publisher; } }
    public string PublishedDate { get { return publishedDate; } }
    public string Format { get { return format; } }
    public string Dimensions { get { return dimensions; } }
    public string Description
    {
        get
        {
            if (description.Length > DESCRIPTION_SHORT_LENGTH)
            {
                return description.Substring(0, DESCRIPTION_SHORT_LENGTH).Trim() + "...";
            }
            return description;
        }
    }
    public string FullDescription { get { return description.Trim(); } }
    public int Pages { get { return pages; } }
    public int Quantity { get { return quantity; } }
    public double Price { get { return price; } }

    public EditBookView (Book book)
    {
        fillFields(book);
    }
    public EditBookView () : this(new Book())
    {
    }
    public void fillFields(Book book)
    {
        this.book = book;
        isbn = book.ISBN;
        title = book.Title;

        using (GreatBooksDBEntities context = new GreatBooksDBEntities())
        {
            category = context.BookCategories.Find(book.CategoryID).CategoryName;
            author = context.Authors.Find(book.AuthorID).AuthorName;
            language = context.Languages.Find(book.LanguageID).LanguageName;
            format = context.BookFormats.Find(book.FormatID).FormatName;
            publisher = context.Publishers.Find(book.PublisherID).PublisherName;

            //category = context.BookCategories.Where(x => x.CategoryID == book.CategoryID).First().CategoryName;
            //author = context.Authors.Where(x => x.AuthorID == book.AuthorID).First().AuthorName;
            //language = context.Languages.Where(x => x.Language == book.Language).First().LanguageName;
            //format = context.BookFormats.Where(x => x.FormatID == book.FormatID).First().FormatName;
            //publisher = context.Publishers.Where(x => x.PublisherID == book.PublisherID).First().PublisherName;
        }

        ageGroup = book.AgeGroup;
        dateAdded = string.Format("{0}/{1}/{2}", book.AddedDate.Value.Day, book.AddedDate.Value.Month, book.AddedDate.Value.Year);
        publishedDate = string.Format("{0}/{1}/{2}", book.PublishedDate.Value.Day, book.PublishedDate.Value.Month, book.PublishedDate.Value.Year);
        dimensions = book.Dimensions;
        description = book.Description;
        pages = Convert.ToInt32(book.Pages);
        quantity = Convert.ToInt32(book.Quantity);
        price = Convert.ToDouble(book.Price);
    }
}