<%@ Page Title="Book Added" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Complete_Add.aspx.cs" Inherits="Complete_Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" type="text/css" href="../bower_components/bootstrap/dist/css/bootstrap.min.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">

    <div class="row">
        <div class="col-xs-1">

        </div>
            <div class="col-xs-2">
            <h2>Book Added</h2>
        </div>
    </div>

    <hr />
        
    <div class="container">
                <div class="row">
                    <div class="col-xs-2">
                        <asp:Image ID="imgAdd" runat="server" Width="175px"/>
                    </div>
                    <div class="col-xs-5">
                        <span class="h3">
                            Title: <asp:Label ID="lblTitle" runat="server"></asp:Label>
                        </span>
                        <br />
                        Author: <asp:Label ID="lblAuthor" runat="server"></asp:Label>
                        <br />
                        ISBN: <asp:Label ID="lblISBN" runat="server"></asp:Label>

                        <br />
                        Price: <asp:Label ID="lblPrice" runat="server"></asp:Label>

                        <br />
                        Quantity: <asp:Label ID="lblQuantity" runat="server"></asp:Label>

                        <hr />
                    </div>
                </div>
        </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="Server">
    <script src="../bower_components/jquery/dist/jquery.min.js"></script>
    <script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
</asp:Content>
