<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SuccessfulPayment.aspx.cs" Inherits="SuccessfulPayment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <link rel="stylesheet" type="text/css" href="../bower_components/bootstrap/dist/css/bootstrap.min.css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">

        <div class="col-xs-10 col-xs-offset-2">
    <h1>Transaction Successful</h1>
        <br />
        <h2>Your Current Balance is: 
        <asp:Label ID="CreditBalance" runat="server" Text="Label"></asp:Label></h2>
        <asp:Button ID="AcceptBalance" runat="server" Text="Ok" OnClick="AcceptBalance_Click" Width="183px" CssClass="btn btn-primary " />
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footer" Runat="Server">
        <script src="../bower_components/jquery/dist/jquery.min.js"></script>
    <script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
</asp:Content>

