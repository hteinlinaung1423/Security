<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Details.aspx.cs" Inherits="Details" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="Server">
    <div class="container-fluid">
        <div class="alert alert-success">
            <asp:Label ID="lblResult" runat="server"></asp:Label>
            <asp:Button ID="Button1" runat="server" Text="My Shopping List" CssClass="right carousel_color" ForeColor="#ECEFF4" Visible="False" OnClick="Button1_Click" />
        </div>
        <br />
        <div class="row">
            <div class="col-md-4" style="width: 20%">
                <asp:Image ID="imgbook" runat="server" width="100%"  />
                <br />
                <br />
                <p>
                    Published Date:
                        <asp:Label ID="lblpublishedDate" runat="server"></asp:Label>
                </p>
                <p>
                    Publisher:
                        <asp:Label ID="lblpublisher" runat="server"></asp:Label>
                </p>
                <p>ISBN:<asp:Label ID="lblisbn" runat="server"></asp:Label></p>
                <p>Pages:<asp:Label ID="lblpages" runat="server"></asp:Label></p>
            </div>
            <div class="col-md-8">

                <div class="page-header" style="margin-top: 0">
                    <h1 style="margin-top: 0">
                        <asp:Label ID="lblTitle" runat="server"></asp:Label></h1>
                    <small>By
                        <asp:Label ID="lblAuthor" runat="server" CssClass="detailsAuthor" /></small>
                </div>



                <p>
                    <asp:Label ID="lblDesc" runat="server"></asp:Label>
                </p>
                <hr />

                <asp:Label ID="lblPrice" runat="server" CssClass="detailsPrice"></asp:Label><br />
                <br />
                <% if (!Page.User.IsInRole("Employee"))
                    { %>
                Quantity:
                    <asp:DropDownList ID="ddlAmount" runat="server"></asp:DropDownList>
                <br />
                <br />
                <asp:Button ID="btnAdd" runat="server" CssClass="carousel_color" ForeColor="#ECEFF4" OnClick="btnAdd_Click" Text="Add To Cart" />
                <% } %>




                <%--<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
                    <div class="modal-dialog modal-sm" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="gridSystemModalLabel">Added Successfully</h4>
                            </div>
                            <div class="modal-body">
                                <p>Your Item was successfully added to your shopping list.</p>
                                <br />
                            </div>
                        </div>
                    </div>
                </div>--%>

                <br />

            </div>
        </div>
    </div>
</asp:Content>


