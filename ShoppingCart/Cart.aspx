<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="CartView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="css/cart.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../bower_components/bootstrap/dist/css/bootstrap.min.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="row">
        <div class="col-xs-12">
            <span class="h1">
                <asp:Label ID="LabelPageTitle" runat="server" Text="Your Cart"></asp:Label>
            </span>
        </div>
    </div>
    <div class="row panel panel-default vertical-align margin-top-5">
        <div class="col-xs-8">
            <asp:UpdatePanel ID="UpdatePanel_OrderSummary" runat="server">
                <ContentTemplate>
                    <asp:Label ID="LabelOrderSummary" runat="server" Text=""></asp:Label>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div class="col-xs-4 margin-around-10">
            <asp:Button ID="Button_InitCart" Visible="false" runat="server" Text="Initialise Cart" CssClass="btn btn-danger btn-sm" OnClick="Button_InitCart_Click" />
            <asp:Button ID="Button_CheckoutTop" runat="server" Text="Checkout" CssClass="btn btn-primary" PostBackUrl="OrderConfirmation.aspx" />
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
        <div class="col-xs-1 col-xs-offset-4">
            Price
        </div>
        <div class="col-xs-1 col-xs-offset-1">
            Quantity
        </div>
        <div class="col-xs-1 col-xs-offset-1">
            Subtotal
        </div>
        <hr />
    </div>
    <asp:UpdatePanel ID="UpdatePanel_DEBUG" runat="server">
        <ContentTemplate>
            <asp:Label ID="Label_DEBUG" runat="server" Text="Label" Visible="false"></asp:Label>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Repeater ID="RepeaterCartContents" runat="server" OnItemDataBound="RepeaterCartContents_ItemDataBound">
        <ItemTemplate>
            <asp:PlaceHolder ID="PlaceHolder1" runat="server">
                <div class="row text-center">
                    <div class="container vertical-align">
                        <div class="col-sm-2">
                            <%--<asp:Label runat="server" Text='<%# Eval("ImagePath") %>'></asp:Label>--%>
                            <asp:Image ID="ImageBookCover" runat="server" ImageUrl='<%# "~/BookCover/" + Eval("ImagePath") %>' Width="150" />
                        </div>
                        <div class="col-sm-2 text-left">
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
                        <div class="col-sm-1 col-sm-offset-1">
                            <asp:UpdatePanel ID="UpdatePanel_Quantity" runat="server">
                                <ContentTemplate>
                                    <asp:Label ID="Label_Quantity_hidden" runat="server" Text='<%# Eval("ISBN") %>' Visible="false"></asp:Label>
                                    <asp:DropDownList ID="DropDownList_Quantity" runat="server" OnSelectedIndexChanged="DropDownList_Quantity_SelectedIndexChanged" DataSource='<%# Eval("QuantityOptions") %>' AutoPostBack="True"></asp:DropDownList>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="DropDownList_Quantity" EventName="SelectedIndexChanged"></asp:AsyncPostBackTrigger>
                                </Triggers>
                            </asp:UpdatePanel>
                        </div>
                        <div class="col-sm-1 col-sm-offset-1">
                            <asp:UpdatePanel ID="UpdatePanel_Subtotal" runat="server">
                                <ContentTemplate>
                                    <asp:Label ID="Label_Subtotal" runat="server" Text='<%# displayAsCurrency(Convert.ToDouble( Eval("Subtotal") )) %>'></asp:Label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                        <div class="col-sm-1 col-sm-offset-1">
                            <asp:Label ID="Label_Remove_hidden" runat="server" Text='<%# Eval("ISBN") %>' Visible="false"></asp:Label>
                            <asp:Button ID="ButtonRemove" runat="server" Text="Remove" CssClass="btn btn-danger btn-sm" OnClick="ButtonRemove_Click"></asp:Button>
                        </div>
                    </div>
                </div>
                <div class="col-sm-10 col-sm-offset-1">
                    <hr />
                </div>
            </asp:PlaceHolder>
        </ItemTemplate>
    </asp:Repeater>

    <div class="row">
        <div class="col-xs-12">
            <hr />
        </div>
    </div>
    <div class="row vertical-align">
        <div class="col-xs-4 col-xs-offset-4 text-right">
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <asp:Label runat="server" Text="Order total:" CssClass="text-bold"></asp:Label>
                    <asp:Label ID="LabelTotalCost" runat="server" Text=""></asp:Label>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div class="col-xs-1">
            <asp:Button ID="Button_CheckoutBottom" runat="server" Text="Checkout" CssClass="btn btn-primary" PostBackUrl="OrderConfirmation.aspx" />
        </div>
    </div>

    <asp:Panel ID="Panel_Footer" runat="server">
        <div class="container">
            <div class="row footer">
                <div class="col-xs-12 col-xs-offset-0 col-sm-6 col-sm-offset-3">
                    <div class="alert alert-info">
                        <asp:UpdatePanel ID="UpdatePanel_OrderSummaryFooter" runat="server">
                            <ContentTemplate>
                                <div class="row vertical-align">

                                    <div class="col-xs-8">

                                        <asp:Label ID="LabelOrder_SummaryFooter" runat="server" Text=""></asp:Label>
                                    </div>
                                    <div class="col-xs-4 text-right">

                                        <asp:Button ID="Button2" runat="server" Text="Checkout" CssClass="btn btn-primary" PostBackUrl="OrderConfirmation.aspx" />
                                    </div>
                                </div>

                            </ContentTemplate>
                        </asp:UpdatePanel>
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

