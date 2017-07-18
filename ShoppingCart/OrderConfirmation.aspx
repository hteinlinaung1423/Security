<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="OrderConfirmation.aspx.cs" Inherits="OrderConfirmation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="css/cart.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../bower_components/bootstrap/dist/css/bootstrap.min.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row">
        <div class="col-xs-12">
            <span class="h1">
                <asp:Label ID="LabelPageTitle" runat="server" Text="Checkout Confirmation"></asp:Label>
            </span>
        </div>
    </div>
    <div class="row panel panel-default vertical-align margin-top-5">
        <div class="col-xs-8">
            <asp:Label ID="LabelOrderSummary" runat="server" Text=""></asp:Label>
        </div>
        <div class="col-xs-4 margin-around-10">
            <asp:Button ID="Button_EditCart" runat="server" Text="Edit Cart" CssClass="btn btn-warning" PostBackUrl="Cart.aspx" />
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12">
            <span class="h3">
                <asp:Label ID="LabelCartDetails" runat="server" Text="Cart Details"></asp:Label>
            </span>
        </div>
    </div>
    <div class="row text-center text-bold">
        <div class="col-xs-1 col-xs-offset-6">
            Price
        </div>
        <div class="col-xs-1">
            Quantity
        </div>
        <div class="col-xs-1">
            Subtotal
        </div>
        <hr />
    </div>
    <asp:Repeater ID="RepeaterCartContents" runat="server">
        <%--OnItemDataBound="RepeaterCartContents_ItemDataBound">--%>
        <ItemTemplate>
            <asp:PlaceHolder ID="PlaceHolder1" runat="server">
                <div class="row text-center">
                    <div class="container vertical-align">
                        <div class="col-sm-2">
                            <%--<asp:Label runat="server" Text='<%# Eval("ImagePath") %>'></asp:Label>--%>
                            <asp:Image ID="ImageBookCover" runat="server" ImageUrl='<%# "~/BookCover/" + Eval("ImagePath") %>' Width="80" />
                        </div>
                        <div class="col-sm-4 text-left">
                            <asp:LinkButton ID="LinkTitle" runat="server" ForeColor="Black" PostBackUrl='<%# "~/Details.aspx?ISBN=" + Eval("ISBN") %>'>
                            <asp:Label runat="server" Text='<%# Eval("Title") %>' CssClass="h4"></asp:Label>
                            </asp:LinkButton>

                            <br />
                            By: 
                                <asp:Label runat="server" Text='<%# Eval("Author") %>' CssClass="h5"></asp:Label>

                            <br />
                            <asp:Label runat="server" Text='<%# Eval("Format") + " – " + Eval("Language") %>'></asp:Label>
                        </div>
                        <div class="col-sm-1">
                            <asp:Label runat="server" Text='<%# displayAsCurrency(Convert.ToDouble( Eval("Price") )) %>'></asp:Label>
                        </div>
                        <div class="col-sm-1">
                            <asp:Label ID="Label_Quantity" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label>
                        </div>
                        <div class="col-sm-1">
                            <asp:Label ID="Label_Subtotal" runat="server" Text='<%# displayAsCurrency(Convert.ToDouble( Eval("Subtotal") )) %>'></asp:Label>
                        </div>
                    </div>
                </div>
                <div class="col-sm-10 col-sm-offset-1">
                    <hr />
                </div>
            </asp:PlaceHolder>
        </ItemTemplate>
    </asp:Repeater>
    <div class="margin-bottom-100"></div>

    <asp:Panel ID="Panel_Footer" runat="server">
        <div class="container">
            <div class="row footer-confirmation">
                <div class="col-xs-6 col-xs-offset-3">
                    <div class="panel panel-info">
                        <div class="panel-heading text-center">
                            <span class="h4">
                                <asp:Label ID="Label_Footer_Header" runat="server" Text="Order Confirmation"></asp:Label>
                            </span>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-sm-7 text-align-footer text-bold">
                                    Order Subtotal
                                </div>
                                <div class="col-sm-5">
                                    <asp:Label ID="Label_Subtotal" runat="server" Text="$10"></asp:Label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-7 text-align-footer text-bold">
                                    Discount
                                </div>
                                <div class="col-sm-5">
                                    <asp:Label ID="Label_GST" runat="server" Text="$10"></asp:Label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-7 text-align-footer text-bold">
                                    Total to pay
                                </div>
                                <div class="col-sm-5">
                                    <asp:Label ID="Label_TotalToPay" runat="server" Text="$10"></asp:Label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-7 text-align-footer text-bold">
                                    Credit in account
                                </div>
                                <div class="col-sm-5">
                                    <asp:Label ID="Label_CreditInAccount" runat="server" Text="$10"></asp:Label>

                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-7 text-align-footer text-bold">
                                    Credit after purchase
                                </div>
                                <div class="col-sm-5">
                                    <asp:Label ID="Label_CreditAfterPurchase" runat="server" Text="$10"></asp:Label>

                                </div>
                            </div>
                            <div class="row text-center margin-top-5">
                                <asp:Button ID="Button_PayNow" runat="server" Text="Pay Now" CssClass="btn btn-primary width-wide" OnClick="Button_PayNow_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </asp:Panel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="Server">
    <script src="../bower_components/jquery/dist/jquery.min.js"></script>
    <script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
</asp:Content>

