<%@ Page Title="Order History" EnableEventValidation="false" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="OrderHistory.aspx.cs" Inherits="Profile_OrderHistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" type="text/css" href="../bower_components/bootstrap/dist/css/bootstrap.min.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    
    <asp:Label ID="lbOrderHistoryHead" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Order History"></asp:Label>
    <br />
    <asp:Label ID="lbUserOrderSummary" runat="server" Text="Label"></asp:Label>
    <hr />
    <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" HorizontalAlign="Center" TabIndex="15" >
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Button ID="Button5" runat="server" Text="View Detail" OnClick="Button5_Click" CssClass="btn-success"/>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        
        <EditRowStyle HorizontalAlign="Center" />
        
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <HeaderStyle BackColor="#475762" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle"/>
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Center" VerticalAlign="Middle" />
        <RowStyle ForeColor="#000066" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#007DBB" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#00547E" />
        
    </asp:GridView>
    
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="Server">
    <script src="../bower_components/jquery/dist/jquery.min.js"></script>
    <script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
</asp:Content>
