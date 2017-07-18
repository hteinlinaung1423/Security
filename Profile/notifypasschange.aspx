<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="notifypasschange.aspx.cs" Inherits="Profile_notifypasschange" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" type="text/css" href="../bower_components/bootstrap/dist/css/bootstrap.min.css" />
</asp:Content>
<asp:content id="Content2" contentplaceholderid="ContentPlaceHolder1"
    runat="server">
    <div class="col-md-8 col-md-offset-3">
        <div class="page-header">
           <h1>Your password was successfully changed.</h1>
            
               <div class="col-md-3"><asp:Button ID="Button1" runat="server" Text="Logout Now" class="form-control btn-info" OnClick="Button1_Click"/></div> 
        </div>
    </div>

</asp:content>
<asp:Content ID="Content4" ContentPlaceHolderID="footer" Runat="Server">
        <script src="../bower_components/jquery/dist/jquery.min.js"></script>
    <script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
</asp:Content>

