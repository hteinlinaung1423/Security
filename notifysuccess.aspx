<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="notifysuccess.aspx.cs" Inherits="notifysuccess" %>

<asp:content id="Content2" contentplaceholderid="ContentPlaceHolder1"
    runat="server">
    <div class="col-md-6 col-md-offset-4">
        <div class="page-header">
           <h1>Your account was successfully created.</h1>
            
                <asp:Button ID="Button1" runat="server" Text="Login Now" class="form-control btn-info" OnClick="Button1_Click"/>
        </div>
    </div>

</asp:content>
