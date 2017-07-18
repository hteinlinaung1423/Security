<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddCredits.aspx.cs" Inherits="AddCredits" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="Label1" runat="server" Text="Current Credits"></asp:Label>
        <br />
        <asp:Label ID="Label_Credits" runat="server" Text="$"></asp:Label>
        <br />
        <asp:Label ID="Label3" runat="server" Text="Credits to add:"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox_CreditsToAdd" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="Button_AddCredits" runat="server" Text="Add credits" OnClick="Button_AddCredits_Click" />

    </div>
    </form>
</body>
</html>
