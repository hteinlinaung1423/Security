<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SuccessfulPaymentOLD.aspx.cs" Inherits="Bin_SuccessfulPayment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <h1>Transaction Successful</h1>
        <br />
        <h2>Your Current Balance is: 
        <asp:Label ID="CreditBalance" runat="server" Text="Label"></asp:Label></h2>
    </div>
        <asp:Button ID="AcceptBalance" runat="server" Text="Ok" OnClick="AcceptBalance_Click" Width="183px" />
    </form>
</body>
</html>
