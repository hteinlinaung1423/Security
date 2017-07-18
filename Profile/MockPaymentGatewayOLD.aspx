<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MockPaymentGatewayOLD.aspx.cs" Inherits="MockPaymentGateway" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table border="0" class="table table-bordered">
        <tr>
            <td>Amount of Credit to Add (SGD)</td>
            <td>
                <asp:TextBox ID="CreditAmount" runat="server" Width="80px"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" id="reqTopUp" controltovalidate="CreditAmount" ForeColor="Red" errormessage="Please enter value to add" />
            </td></tr>
            </table>
        </div>
        <div>
        <table border="0">
        <tr>
            <td>
                <asp:RadioButtonList ID="RadioButtonList1" RepeatDirection="Horizontal" runat="server">
                    <asp:ListItem>MasterCard</asp:ListItem>
                    <asp:ListItem>VISA</asp:ListItem>

                </asp:RadioButtonList>
                <asp:RequiredFieldValidator runat="server" id="reqType" controltovalidate="RadioButtonList1" ForeColor="Red" errormessage="Select One" />
            </td>
        </tr>
        <tr>
            <td>Name on Card</td>
            <td><asp:TextBox ID="NameonCard" runat="server" Width="253px" CssClass="form-control" ></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" id="reqName" controltovalidate="NameonCard" ForeColor="Red" errormessage="Required Field"/></td>
        </tr>
        <tr>
            <td>Card Number</td>
            <td><asp:TextBox ID="CardNumber" MaxLength="16" runat="server" Width="253px" CssClass="form-control" ></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" id="reqCard" controltovalidate="CardNumber" ForeColor="Red" errormessage="Required Field" /></td>
        </tr>
        <tr>
            <td>Security Code</td>
            <td><asp:TextBox ID="SecCode" type="password" runat="server" MaxLength="3"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" id="reqSec" controltovalidate="SecCode" ForeColor="Red" errormessage="Required Field" /></td>
        </tr>
        <tr>
            <td>Expiry Date (MM/YY)</td>
            <td><asp:TextBox ID="Month" type="password" runat="server" MaxLength="2" Width="41px"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" id="ReqMonth" controltovalidate="Month" ForeColor="Red" errormessage="Required Field" />
                /
                <asp:TextBox ID="Year" type="password" runat="server" MaxLength="2" Width="41px"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" id="ReqYear" controltovalidate="Year" ForeColor="Red" errormessage="Required Field" />
            </td>
        </tr>
        <tr>
            <td><asp:Button ID="ClearButt" runat="server" Text="Clear" OnClick="ClearButt_Click" /></td>
            <td><asp:Button ID="SubmitButt" runat="server" Text="Submit" OnClick="SubmitButt_Click" /></td>
        </tr>

    </table>
        </div>
    </form>
</body>
</html>
