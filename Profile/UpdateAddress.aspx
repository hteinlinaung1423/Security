<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="UpdateAddress.aspx.cs" Inherits="ProfileManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" type="text/css" href="../bower_components/bootstrap/dist/css/bootstrap.min.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-md-8 col-md-offset-2">
        <div class="panel panel-default">
            <div class="panel-heading" style="background: #475762">
                <h3 class="panel-title" style="color: #ECEFF4">Change Mailing Address for <%=User.Identity.Name%></h3>
            </div>

            <asp:Label ID="Msg" ForeColor="maroon" runat="server" /><br />
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-4">Current Mailing Address:</div>
                    <div class="col-md-8">
                        <asp:Label ID="CurrentAddress" runat="server" />
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-4">New Mailing Address:</div>
                    <div class="col-md-8">
                        <asp:TextBox ID="AddressTextBox" runat="server" CssClass="form-control"/>
                        <asp:RequiredFieldValidator runat="server" ID="rqAddress" ControlToValidate="AddressTextBox" ForeColor="Red" ErrorMessage="Please enter your address" />
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-4">Postal Code</div>
                    <div class="col-md-8">
                        <asp:TextBox ID="pCode" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="rqpCode" ControlToValidate="pCode" ForeColor="Red" ErrorMessage="Please enter your postal code" />
                    </div>
                </div>
                <br />
                <div class="col-md-3"><asp:Button ID="UpdateAddressButton" runat="server" Text="Update" OnClick="UpdateAddressButton_OnClick" CssClass="btn-info form-control"/></div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="Server">
    <script src="../bower_components/jquery/dist/jquery.min.js"></script>
    <script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
</asp:Content>
