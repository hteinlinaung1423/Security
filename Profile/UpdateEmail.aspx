<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UpdateEmail.aspx.cs" Inherits="UpdateEmail" %>
<script runat="server">

   

 

</script>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <link rel="stylesheet" type="text/css" href="../bower_components/bootstrap/dist/css/bootstrap.min.css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

  <h3>Update Email for <%=User.Identity.Name%></h3>

  <asp:Label id="Msg" ForeColor="maroon" runat="server" /><br />


  <table cellpadding="3" border="0">
    <tr>
      <td>E-mail Address:</td>
      <td><asp:TextBox id="EmailTextBox" MaxLength="128" Columns="30" runat="server" /></td>
      <td><asp:RequiredFieldValidator id="EmailRequiredValidator" runat="server"
                                    ControlToValidate="EmailTextBox" ForeColor="red"
                                    Display="Static" ErrorMessage="Required" /></td>
    </tr>
      <tr>
          <td>Password</td>
          <td><asp:TextBox ID="PasswordTextBox" TextMode="Password" MaxLength="128" Columns="30" runat="server" /></td>
          <td><asp:RequiredFieldValidator ID="PasswordRequiredValidator" runat="server"
                                        ControlToValidate="PasswordTextBox" ForeColor="Red"
                                        Display="Static" ErrorMessage="Required"/></td>
      </tr>
    <tr>
      <td></td>
      <td><asp:Button id="UpdateEmailButton" 
                      Text="Update E-mail" 
                      OnClick="UpdateEmailButton_OnClick" 
                      runat="server" /></td>
    </tr>
      </table>


</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footer" Runat="Server">
        <script src="../bower_components/jquery/dist/jquery.min.js"></script>
    <script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
</asp:Content>

