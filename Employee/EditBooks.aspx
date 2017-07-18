<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EditBooks.aspx.cs" Inherits="EditBooks" MaintainScrollPositionOnPostback="True" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../css/editBooks.css" rel="stylesheet" />
     <link rel="stylesheet" type="text/css" href="../bower_components/bootstrap/dist/css/bootstrap.min.css" />
    
    <link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" />
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<%--            <asp:UpdatePanel ID="UpdatePanel_GridView" runat="server" UpdateMode="Conditional">
            <ContentTemplate>--%>
<%--                    <script type="text/javascript">
        //console.log("hello");
        function BindControlEvents() {
            //jQuery is wrapped in BindEvents function so it can be re-bound after each callback.
            //Your code would replace the following line:
            console.log("hello");
            $('#<%= getTextBoxControlID("TextBox_DateAdded") %>')
                .datepicker({ dateFormat: 'dd/mm/yy' });
        }

        //Initial bind
        $(document).ready(function () {
            BindControlEvents();
        });

        //Re-bind for callbacks
        var prm = Sys.WebForms.PageRequestManager.getInstance();

        prm.add_endRequest(function () {
            BindControlEvents();
        });

    </script>--%>
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <span class="h1">
                    <asp:Label ID="Label_Header" runat="server" Text="Edit Books"></asp:Label>
                </span>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-4">
                <div class="form-group form-inline">
                    <asp:TextBox ID="TextBox_Search" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:Button ID="Button_Search" runat="server" Text="Search" OnClick="Button_Search_Click" CssClass="btn btn-success" />
                    <asp:Label ID="Label_Results" runat="server" Text=""></asp:Label>
                </div>
            </div>
            <div class="col-xs-4 vertical-align">
                <asp:Label ID="Label_SortBy" runat="server" Text="Sort by:" CssClass="text-bold margin-right-5"></asp:Label>
                <asp:DropDownList ID="DropDownList_SortBy" runat="server" OnSelectedIndexChanged="DropDownList_SortBy_SelectedIndexChanged" AutoPostBack="True" CssClass="btn btn-default">
                    <asp:ListItem Selected="True" Value="titleAscending">Titles A -&gt; Z</asp:ListItem>
                    <asp:ListItem Value="titleDescending">Titles Z -&gt; A</asp:ListItem>
                    <asp:ListItem Value="authorAscending">Authors A -&gt; Z</asp:ListItem>
                    <asp:ListItem Value="authorDescending">Authors Z -&gt; A</asp:ListItem>
                    <asp:ListItem Value="priceDescending">Price high -&gt; Price low</asp:ListItem>
                    <asp:ListItem Value="priceAscending">Price low -&gt; Price high</asp:ListItem>
                    <asp:ListItem Value="topSellers">Top sellers</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-12">
                <div class="floating-header text-bold hidden">
                    <div class="floating-header-col-start">
                    </div>
                    <div class="floating-header-col1">
                        Cover
                    </div>
                    <div class="floating-header-col2">
                        ISBN<br />Title<br />Category<br />Pages
                    </div>
                    <div class="floating-header-col3">
                        Author<br />Language<br />Age Group<br />Date Added
                    </div>
                    <div class="floating-header-col4">
                        Description
                    </div>
                    <div class="floating-header-col5">
                        Publisher<br />Published Date<br />Format<br />Dimensions
                    </div>
                    <div class="floating-header-col6">
                        Price<br />Quantity in Stock
                    </div>
                    <div class="floating-header-col7">
                    </div>
                    <div class="floating-header-col-end">
                    </div>
                </div>

                <asp:GridView ID="GridView_EditBooks" runat="server"
                    AutoGenerateColumns="false"
                    OnDataBound="GridView_EditBooks_DataBound"
                    OnRowDataBound="GridView_EditBooks_RowDataBound"
                    AllowPaging="true"
                    PageSize="10"
                    HeaderStyle-CssClass="text-center-impt"
                    CssClass="table table-responsive table-striped"
                    GridLines="None"
                    OnRowEditing="GridView_EditBooks_RowEditing"
                    OnRowCancelingEdit="GridView_EditBooks_RowCancelingEdit"
                    OnRowUpdating="GridView_EditBooks_RowUpdating"
                    OnRowDeleting="GridView_EditBooks_RowDeleting"
                    OnPageIndexChanging="GridView_EditBooks_PageIndexChanging"
                    PagerStyle-HorizontalAlign="Center" PagerSettings-Position="TopAndBottom">

                    <PagerSettings Mode="NumericFirstLast" FirstPageText="First" LastPageText="Last" PreviousPageText="Previous" NextPageText="Next" />
                    <PagerTemplate>
                        <asp:Button Text="First" runat="server" CommandName="Page" CommandArgument="First" CssClass="btn btn-default btn-sm" />
                        <asp:Button Text="Prev" runat="server" CommandName="Page" CommandArgument="Prev" CssClass="btn btn-default btn-sm" />

                        <asp:DropDownList ID="DropDownList_JumpToPage" runat="server" OnSelectedIndexChanged="DropDownList_JumpToPage_SelectedIndexChanged" AutoPostBack="True" CssClass="btn btn-default btn-sm"></asp:DropDownList>

                        <asp:Label ID="Paging_CurrentPage" Text="" runat="server"><%# " / " + GridView_EditBooks.PageCount %></asp:Label>
                        <asp:Button Text="Next" runat="server" CommandName="Page" CommandArgument="Next" CssClass="btn btn-default btn-sm" />
                        <asp:Button Text="Last" runat="server" CommandName="Page" CommandArgument="Last" CssClass="btn btn-default btn-sm" />
                    </PagerTemplate>
                    <Columns>
                        <%-- Images --%>
                        <asp:TemplateField ItemStyle-Width="10%" HeaderText="Cover" ItemStyle-CssClass="text-center"><%-- HeaderStyle-CssClass="text-center-impt">--%>
                            <EditItemTemplate>
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/BookCover/" + Eval("ISBN") + ".jpg" %>' Width="100px" />
                                <div class="form-group margin-top-10">
                                   <%-- <asp:Button ID="Button_ChangeImage" runat="server" Text="Change" CssClass="form-control btn btn-info btn-sm" />--%>
                                </div>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/BookCover/" + Eval("ISBN") + ".jpg" %>' Width="100px" />
                            </ItemTemplate>
                        </asp:TemplateField>
                         <%-- Book info --%>
                        <asp:TemplateField ItemStyle-Width="20%" HeaderText="Title<br />ISBN<br />Category<br />Pages"><%-- HeaderStyle-CssClass="text-center-impt">--%>
                            <EditItemTemplate>
                                <div class="form-group">
                                    <label>Title:</label>
                                    <asp:TextBox ID="TextBox_Title" runat="server" Text='<%# Eval("Title") %>' CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>ISBN</label>
                                    <br />
                                    <asp:Label ID="Label_ISBNEdit" runat="server" Text='<%# Eval("ISBN") %>' CssClass="text-italics"></asp:Label>
                                </div>
                                <div class="form-group">
                                    <label>Category</label>
                                    <asp:DropDownList ID="DropDownList_Category" runat="server" CssClass="form-control"></asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label>Pages:</label>
                                    <asp:TextBox ID="TextBox_Pages" runat="server" Text='<%# Eval("Pages") %>' CssClass="form-control"></asp:TextBox>
                                </div>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label_Title" runat="server" Text='<%# Eval("Title") %>' CssClass="text-bold"></asp:Label>
                                <br />
                                <asp:Label ID="Label_ISBN" runat="server" Text='<%# Eval("ISBN") %>' CssClass="text-italics"></asp:Label>
                                <br />
                                <asp:Label ID="Label_Category" runat="server" Text='<%# Eval("Category") %>'></asp:Label>
                                <br />
                                <asp:Label ID="Label_Pages" runat="server" Text='<%# Eval("Pages") + " pages" %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%-- Author and Language --%>
                        <asp:TemplateField ItemStyle-Width="15%" HeaderText="Author<br />Language<br />Age Group<br />Date Added">
                            <EditItemTemplate>
                                <div class="form-group">
                                    <label>Author:</label>
                                    <asp:DropDownList ID="DropDownList_Author" runat="server" CssClass="form-control"></asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label>Language:</label>
                                    <asp:DropDownList ID="DropDownList_Language" runat="server" CssClass="form-control"></asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label>Age Group:</label>
                                    <asp:TextBox ID="TextBox_AgeGroup" runat="server" Text='<%# Eval("AgeGroup") %>' CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Date Added:</label>
                                    <asp:TextBox ID="TextBox_DateAdded" runat="server" Text='<%# Eval("DateAdded") %>' CssClass="form-control"></asp:TextBox>
                                </div>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label_Author" runat="server" Text='<%# Eval("Author") %>' CssClass="text-bold"></asp:Label>
                                <br />
                                <asp:Label ID="Label_Language" runat="server" Text='<%# Eval("Language") %>'></asp:Label>
                                <br />
                                <asp:Label ID="Label_AgeGroup" runat="server" Text='<%# Eval("AgeGroup") %>'></asp:Label>
                                <br />
                                <asp:Label ID="Label_DateAdded" runat="server" Text='<%# Eval("DateAdded") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%-- Description --%>
                        <asp:TemplateField ItemStyle-Width="25%" HeaderText="Description">
                            <EditItemTemplate>
                                <div class="form-group">
                                <textarea id="textArea_Description" name="textArea_Description" class="form-control" style="width: 100%; height: 243px;"><asp:Literal ID="Literal_Description" runat="server" Text='<%# Eval("FullDescription") %>'></asp:Literal></textarea>
                                </div>
                                <asp:Button ID="Button_ResetDescription" runat="server" Text="Reset description"
                                    OnClick="Button_ResetDescription_Click"
                                    CssClass="btn btn-warning btn-block btn-xs" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label_Description" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
                                <asp:Button ID="Button_ViewDescription" runat="server" Text="Read more"
                                    OnClick="Button_ViewDescription_Click"
                                    CssClass="btn btn-default btn-block btn-xs"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%-- Publisher and Format --%>
                        <asp:TemplateField  ItemStyle-Width="12%" HeaderText="Publisher<br />Published Date<br />Format<br />Dimensions">
                            <EditItemTemplate>
                                <div class="form-group">
                                    <label>Publisher:</label>
                                    <asp:DropDownList ID="DropDownList_Publisher" runat="server" CssClass="form-control"></asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label>Published Date:</label>
                                    <asp:TextBox ID="TextBox_PublishedDate" runat="server" Text='<%# Eval("PublishedDate") %>' CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Format:</label>
                                    <asp:DropDownList ID="DropDownList_Format" runat="server" CssClass="form-control"></asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label>Dimensions:</label>
                                    <asp:TextBox ID="TextBox_Dimensions" runat="server" Text='<%# Eval("Dimensions") %>' CssClass="form-control"></asp:TextBox>
                                </div>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label_Publisher" runat="server" Text='<%# Eval("Publisher") %>'></asp:Label>
                                <br />
                                <asp:Label ID="Label_PublishedDate" runat="server" Text='<%# Eval("PublishedDate") %>'></asp:Label>
                                <br />
                                <asp:Label ID="Label_Format" runat="server" Text='<%# Eval("Format") %>'></asp:Label>
                                <br />
                                <asp:Label ID="Label_Dimensions" runat="server" Text='<%# Eval("Dimensions") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%-- Price and Quantity --%>
                        <asp:TemplateField ItemStyle-Width="8%" HeaderText="Price<br />Quantity in Stock">
                            <EditItemTemplate>
                                <div class="form-group">
                                    <label>Price:</label>
                                    <asp:TextBox ID="TextBox_Price" runat="server" Text='<%# Eval("Price") %>' CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Quantity in stock:</label>
                                    <asp:TextBox ID="TextBox_Quantity" runat="server" Text='<%# Eval("Quantity") %>' CssClass="form-control"></asp:TextBox>
                                </div>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label_Price" runat="server" Text='<%# displayAsCurrency(Convert.ToDouble(Eval("Price"))) %>'></asp:Label>
                                <br />
                                <asp:Label ID="Label_Quantity" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="false" ItemStyle-Width="10%">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkEdit" runat="server" Text="Edit" CommandName="Edit" CssClass="btn btn-warning" />
                                <br />
                                <br />
                                <asp:LinkButton ID="LinkDelete" runat="server" Text="Delete" CommandName="Delete" CssClass="btn btn-danger btn-sm" />
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
                            <%--               </ContentTemplate>
                        </asp:UpdatePanel>--%>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="Server">
    <script src="../bower_components/jquery/dist/jquery.min.js"></script>
    <script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
</asp:Content>

