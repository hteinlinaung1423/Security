<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">

    <div class="row">
        <div class="col-xs-6 col-md-3">
            <a href="Details.aspx?isbn=9780062390851" class="thumbnail">
                <img src="BookCover/9780062390851.jpg" alt="..." />
            </a>
            <div class="caption">
                <h4>
                    Everybody Lies</h4>
                <p>By Seth Stephens-Davidowitz</p>
                Price: $ 27.99
            </div>
        </div>
        <div class="col-xs-6 col-md-3">
            <a href="Details.aspx?isbn=9780262035613" class="thumbnail">
                <img src="BookCover/9780262035613.jpg" alt="..." />
            </a>
            <div class="caption">
                <h4>
                    Deep Learning</h4>
                <p>By Seth Stephens-Davidowitz</p>
                Price: $ 80.00 
            </div>
        </div>
        <div class="col-xs-6 col-md-3">
            <a href="Details.aspx?isbn=9780744017311" class="thumbnail">
                <img src="BookCover/9780744017311.jpg" alt="..." />
            </a>
            <div class="caption">
                <h4>
                    The Art of Persona 5</h4>
                <p>Prima Games </p>
                Price: $ 39.99  
            </div>
        </div>
        <div class="col-xs-6 col-md-3">
            <a href="Details.aspx?isbn=9780984782857" class="thumbnail">
                <img src="BookCover/9780984782857.jpg" alt="..." />
            </a>
            <div class="caption">
                <h4>
                    Cracking the Coding Interview</h4>
                <p>By Gayle Laakmann McDowell</p>
                Price: $ 26.79
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3"
    runat="server">



    <div class="container-fluid" style="padding-left: 0!important; padding-right: 0!important">

        

        <hr />
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1"></li>

            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner carousel_color carousel_height" role="listbox">

                <div class="item active">
                    <img src="BookCover/This Month (May 2017).png" alt="..." />
                </div>

                <div class="item">
                    <img src="BookCover/Best Fictions.png" alt="..." />
                </div>
            </div>
        </div>
    </div>
    <hr />
</asp:Content>
