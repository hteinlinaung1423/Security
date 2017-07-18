<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="PassUpdate.aspx.cs" Inherits="Profile_PassUpdate" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" type="text/css" href="../bower_components/bootstrap/dist/css/bootstrap.min.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-md-8 col-md-offset-2">
        <div class="panel panel-default">
            <div class="panel-heading" style="background: #475762">
                <h3 class="panel-title" style="color: #ECEFF4">Change Password for <%=User.Identity.Name %></h3>
            </div>

            <div class="panel-body">
                <div class="row">
                    <div class="col-md-4">Old Password:</div>
                    <div class="col-md-8">
                        <asp:TextBox ID="OldPasswordTextbox" runat="server" TextMode="Password" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="OldPasswordRequiredValidator" runat="server" ControlToValidate="OldPasswordTextbox" ForeColor="red" Display="Static" ErrorMessage="Required" />
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-4">Password:</div>
                    <div class="col-md-8">
                        <asp:TextBox ID="PasswordTextbox" runat="server" TextMode="Password" CssClass="form-control" />
                        <asp:RequiredFieldValidator runat="server" ID="rqAddress" ControlToValidate="PasswordTextBox" ForeColor="Red" ErrorMessage="Please enter your password" />
                        <asp:RequiredFieldValidator ID="PasswordRequiredValidator" runat="server" ControlToValidate="PasswordTextbox" ForeColor="red" Display="Static" ErrorMessage="Required" />
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-4">Confirm Password:</div>
                    <div class="col-md-8">
                        <asp:TextBox ID="PasswordConfirmTextbox" runat="server" TextMode="Password" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="PasswordConfirmRequiredValidator" runat="server" ControlToValidate="PasswordConfirmTextbox" ForeColor="red" Display="Static" ErrorMessage="Required" />
                    </div>
                </div>
                <br />

                <asp:CompareValidator ID="PasswordConfirmCompareValidator" runat="server"
                    ControlToValidate="PasswordConfirmTextbox" ForeColor="red"
                    Display="Static" ControlToCompare="PasswordTextBox"
                    ErrorMessage="Confirm password must match password." />
                <br />
                <div class="row">
                    <div class="col-md-3">
                        <asp:Button ID="ChangePasswordButton" Text="Change Password"
                            OnClick="ChangePassword_OnClick" runat="server" CssClass="btn-info form-control" />
                    </div>
                    <div class="col-md-4">
                        <asp:Label ID="Msg" runat="server" Text="Label" Visible="false" ForeColor="Red"></asp:Label></div>

                </div>


            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="Server">
    <script src="../bower_components/jquery/dist/jquery.min.js"></script>
    <script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
</asp:Content>

