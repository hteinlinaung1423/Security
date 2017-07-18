<%@ Page Title="Add new book" Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="Add.aspx.cs" Inherits="Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" type="text/css" href="../bower_components/bootstrap/dist/css/bootstrap.min.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">
    <div class="col-sm-8 col-sm-offset-2">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">Add New Book</h3>
            </div>
            <div class="panel-body">
                <div class="form-group">
                    <label for="exampleInputEmail1">Title</label>
                    <asp:TextBox ID="tbTitle" class="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="vldTitle" runat="server" ErrorMessage="Title Is Required" ControlToValidate="tbTitle" ForeColor="Red"></asp:RequiredFieldValidator>

                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">Author</label><br />
                    <asp:DropDownList ID="ddlAuthor" runat="server" class="form-control" DataSourceID="SqlDataSource1" DataTextField="AuthorName" DataValueField="AuthorName">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=localhost;Initial Catalog=GreatBooksDB;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [AuthorName] FROM [Authors]"></asp:SqlDataSource>
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail1">ISBN</label>
                    <asp:TextBox ID="tbISBN" class="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="vldISBN" runat="server" ErrorMessage="ISBN Required" ControlToValidate="tbISBN" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">Price</label>
                    <asp:TextBox ID="tbPrice" class="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="vldPrice" runat="server" ErrorMessage="Price Is Required" ControlToValidate="tbPrice" ForeColor="Red"></asp:RequiredFieldValidator>

                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">Publisher</label><br />
                    <asp:DropDownList ID="ddlPublisher" runat="server" class="form-control" DataSourceID="SqlDataSource2" DataTextField="PublisherName" DataValueField="PublisherName">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Data Source=localhost;Initial Catalog=GreatBooksDB;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [PublisherName] FROM [Publishers]"></asp:SqlDataSource>

                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">Quantity</label>
                    <asp:TextBox ID="tbQuantity" class="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">Publish Date</label>
                    <asp:TextBox ID="tbPublishedDate" class="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">Pages</label>
                    <asp:TextBox ID="tbPages" class="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="exampleInputFile">File input</label>
                    <asp:FileUpload ID="fuImage" runat="server" />
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">Language</label><br />
                    <asp:DropDownList ID="ddlLanguage" runat="server" class="form-control" DataSourceID="SqlDataSource3" DataTextField="LanguageName" DataValueField="LanguageName">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="Data Source=localhost;Initial Catalog=GreatBooksDB;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [LanguageName] FROM [Languages]"></asp:SqlDataSource>
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">Format</label><br />
                    <asp:DropDownList ID="ddlFormat" runat="server" class="form-control" DataSourceID="SqlDataSource4" DataTextField="FormatName" DataValueField="FormatName">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="Data Source=localhost;Initial Catalog=GreatBooksDB;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [FormatName] FROM [BookFormats]"></asp:SqlDataSource>
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">Category</label><br />
                    <asp:DropDownList ID="ddlCategory" runat="server" class="form-control" DataSourceID="SqlDataSource5" DataTextField="CategoryName" DataValueField="CategoryName">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="Data Source=localhost;Initial Catalog=GreatBooksDB;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [CategoryName] FROM [BookCategories]"></asp:SqlDataSource>
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">Description</label>
                    <asp:TextBox ID="tbDescript" class="form-control" runat="server" Rows="10" TextMode="MultiLine"></asp:TextBox>
                </div>
                <asp:Button runat="server" ID="UploadButton" Text="Upload" OnClick="UploadButton_Click" />
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
            </div>
        </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="Server">
    <script src="../bower_components/jquery/dist/jquery.min.js"></script>
    <script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
</asp:Content>
