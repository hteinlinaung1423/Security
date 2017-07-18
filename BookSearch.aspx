<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master"  CodeFile="BookSearch.aspx.cs" Inherits="BookSearch" %>

<%-- Add this --> want to call Control on Master page from *.aspx (Yin) --%>
<%@ MasterType VirtualPath="~/MasterPage.master" %> 

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            margin-left: 0px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">  
</asp:Content>



<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>Search Keywords:
        <asp:Label ID="LabelKeyword" runat="server" Text="Label" Font-Bold="True" Font-Size="Larger"></asp:Label>
    </p>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ISBN" DataSourceID="SqlDataSource1" OnLoad="Page_Load" HorizontalAlign="Center" BorderColor="Black" PageSize="6" AllowPaging="True" Font-Bold="True" GridLines="Horizontal" BorderWidth="0px" Width="100%" CssClass="auto-style1">
                <Columns>

                    <asp:TemplateField HeaderText="Book" ControlStyle-Height="200">                      
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval ("ISBN","~/BookCover/{0}"+".jpg") %>' />
                        </ItemTemplate>

<ControlStyle Height="200px"></ControlStyle>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Title" SortExpression="Title">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Title") %>'></asp:Label>
                            <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Bind("Title") %>' Font-Bold="True" Font-Underline="True" Font-Size="Larger"></asp:HyperLink>
                        
                        </ItemTemplate>
                        <ItemStyle Width="200px" />
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Bind("Title") %>' Font-Bold="True" Font-Underline="True" Font-Size="Larger"></asp:HyperLink>
                        </ItemTemplate>

                    </asp:TemplateField>

                    <asp:BoundField DataField="ISBN" HeaderText="ISBN" ReadOnly="True" SortExpression="ISBN" ItemStyle-Width="80" >
                    <ItemStyle Width="150px"></ItemStyle>
                    </asp:BoundField>

                    <asp:BoundField DataField="AuthorName" HeaderText="AuthorName" SortExpression="AuthorName" ItemStyle-Width="130">
<ItemStyle Width="130px"></ItemStyle>
                    </asp:BoundField>

                    <asp:TemplateField HeaderText="Description" SortExpression="Description" ControlStyle-Width="350">
                        <ItemTemplate>      
                         <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Limit(Eval("Description"),70) %>' Tooltip='<%# Eval("Description") %>'></asp:Label>
                          <asp:LinkButton ID="ReadMoreLinkButton" runat="server" Text="Read More"
                                    Visible='<%# SetVisibility(Eval("Description"), 70) %>'
                                     OnClick="ReadMoreLinkButton_Click">
                    </asp:LinkButton>
                        </ItemTemplate>
  
<ControlStyle Width="350px"></ControlStyle>
  
                    </asp:TemplateField>

                    <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" HtmlEncode="False" DataFormatString="{0:c}"/>
                    
                    <asp:TemplateField HeaderText="Quantity" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="10" >
                        <ItemTemplate>
                            <asp:TextBox ID="TextBoxQuantity" runat="server" Width="20" Height="18" MaxLength="100" Rows="1" ></asp:TextBox>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="80px"></ItemStyle>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="AddToCart" ControlStyle-Width="80">
                        <ItemTemplate>
                            <asp:Button ID="AddtoCartBtn" runat="server" Text="AddToCart" OnClick="AddtoCartBtn_Click" Font-Size="Small" />
                        </ItemTemplate>

<ControlStyle Width="80px"></ControlStyle>
                    </asp:TemplateField>
                </Columns>
                <HeaderStyle BackColor="#CCCCCC" HorizontalAlign="Center" />
                <RowStyle Height="10px" />
                <SortedAscendingCellStyle BackColor="Red" />
            </asp:GridView>

          
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GreatBooksDBConnectionString %>" 
                SelectCommand="SELECT * FROM [booksearchview]"
                            
                FilterExpression="([ISBN] LIKE '%{0}%') OR ([Title] LIKE '%{1}%') OR ([Description] LIKE '%{2}%')">
                     <FilterParameters>
                        <asp:ControlParameter Name="ISBN" ControlID="tbxSearch" PropertyName="Text"/>
                        <asp:ControlParameter Name="Title" ControlID="tbxSearch" PropertyName="Text" />
                        <asp:ControlParameter Name="Description" ControlID="tbxSearch" PropertyName="Text" />
                    </FilterParameters>
            </asp:SqlDataSource>        
</asp:Content>     
                    

