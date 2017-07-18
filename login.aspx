﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="login.aspx.cs" Inherits="login" %>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">
    <div class="col-md-6 col-md-offset-4">
        <asp:Login ID="Login1" runat="server">
            <LayoutTemplate>
                <div class="panel panel-default">
                    <div class="panel-heading" style="background: #475762">
                        <h2 class="panel-title" style="color: #ECEFF4">Login</h2>
                    </div>
                    <div class="panel-body">
                        <div class="form-group">
                            <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>

                            <asp:TextBox ID="UserName" runat="server" class="form-control" placeholder="Jan Doe"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="UserNameRequired" Style="color: red" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1">* User Name is required.</asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>

                            <asp:TextBox ID="Password" runat="server" TextMode="Password" class="form-control" placeholder="Password" OnTextChanged="Password_TextChanged"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="PasswordRequired" Style="color: red" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1">* Password is required.</asp:RequiredFieldValidator>
                        </div>
                        <div class="checkbox">
                            <label>
                                <asp:CheckBox ID="RememberMe" runat="server" Text="Remember me next time." />
                            </label>
                        </div>
                        <div style="color: red">
                            <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                        </div>
                        <br />
                        <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" ValidationGroup="Login1" class="btn btn-default" />
                    </div>
                </div>
            </LayoutTemplate>
        </asp:Login>
    </div>

</asp:Content>

