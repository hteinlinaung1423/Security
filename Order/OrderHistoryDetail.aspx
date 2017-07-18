<%@ Page Title="Order History Detail" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="OrderHistoryDetail.aspx.cs" Inherits="OrderHistoryDetail" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" type="text/css" href="../bower_components/bootstrap/dist/css/bootstrap.min.css" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:label id="OrderDetailHead" runat="server" font-bold="True" font-size="X-Large" text="Oder Details"></asp:label>
    <br />
    <table class="table table-striped">
        <tbody>
            <tr>
                <td>Order ID:
                </td>
                <td>
                    <asp:label id="lbOrderID" runat="server" text="Label"></asp:label>
                </td>
            </tr>
            <tr>
                <td>Order Date:
                </td>
                <td>
                    <asp:label id="lbOrderDate" runat="server" text="Label"></asp:label>
                </td>
            </tr>
            <tr>
                <td>Order Status:
                </td>
                <td>
                    <asp:label id="lbOrderStatus" runat="server" text="Label"></asp:label>
                </td>
            </tr>
        </tbody>
    </table>

    <hr />
    <asp:repeater id="RepeaterOrderDetails" runat="server">
        <ItemTemplate>
            <div class="container">
                <div class="row">
                    <div class="col-md-3">
                        <asp:Image ID="Image2" runat="server" ImageUrl='<%# "~/BookCover/" + Eval("ImagePath") %>' /> 
                    </div>
                    <div class="col-md-4">
                        <br />
                        <span class="h3">
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("Title") %>'></asp:Label>
                        </span>
                        <br />
                        <b style="color:#475762">By <asp:Label ID="Label5" runat="server" Text='<%# Eval("Author") %>'></asp:Label></b>

                        <br />
                        Format : <asp:Label ID="Label6" runat="server" Text='<%# Eval("Format") %>'></asp:Label>

                        <br />
                        Quantity : <asp:Label ID="Label7" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label>

                        <br />
                        Price : $<asp:Label ID="Label8" runat="server" Text='<%# Eval("Price") %>'></asp:Label>

                        <p>
                            <hr />
                        </p>
                    </div>
                </div>
                <br />
            </div>
        </ItemTemplate>
    </asp:repeater>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="footer" runat="Server">
    <script src="../bower_components/jquery/dist/jquery.min.js"></script>
    <script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
</asp:Content>