<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master"  CodeFile="BookSearch2.aspx.cs" Inherits="BookSearch2" MaintainScrollPositionOnPostback="True" %>

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
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Title") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                     <%--       <asp:HyperLink ID="HyperLinkTitle" runat="server"  Text='<%# Bind("Title") %>' Click="linkGoSomewhere_Click" >HyperLink</asp:HyperLink>--%>
                            <asp:LinkButton ID="LinkButtonTitle" runat="server" Text='<%# Bind("Title") %>' OnClick="linkGoSomewhere_Click" >LinkButton</asp:LinkButton>
                        </ItemTemplate>
                        <ItemStyle Width="80px" />
                    </asp:TemplateField>

                    <asp:BoundField DataField="ISBN" HeaderText="ISBN" SortExpression="ISBN" ItemStyle-Width="130" ReadOnly="True">
<ItemStyle Width="130px"></ItemStyle>
                    </asp:BoundField>

                    <asp:BoundField DataField="AuthorName" HeaderText="AuthorName" SortExpression="AuthorName"/>
                    
                    <asp:BoundField DataField="CategoryName" HeaderText="CategoryName" SortExpression="CategoryName" />

                    <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" HtmlEncode="False" DataFormatString="{0:c}"/>

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
                </Columns>

                <HeaderStyle BackColor="#CCCCCC" HorizontalAlign="Center" />
                <RowStyle Height="10px" />
                <SortedAscendingCellStyle BackColor="Red" />
            </asp:GridView>

          
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GreatBooksDBConnectionString %>" 
                SelectCommand="SELECT [Title], [ISBN], [AuthorName], [CategoryName], [Price], [Description] FROM [ViewForBooksearch2]"
                            
                FilterExpression="([ISBN] LIKE '%{0}%') OR ([Title] LIKE '%{1}%') OR ([Description] LIKE '%{2}%')">
                     <FilterParameters>
                        <asp:ControlParameter Name="ISBN" ControlID="tbxSearch" PropertyName="Text"/>
                        <asp:ControlParameter Name="Title" ControlID="tbxSearch" PropertyName="Text" />
                        <asp:ControlParameter Name="Description" ControlID="tbxSearch" PropertyName="Text" />
                    </FilterParameters>
            </asp:SqlDataSource>        
</asp:Content>     
                    

