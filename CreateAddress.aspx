<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="CreateAddress.aspx.cs" Inherits="CreateAddress" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">
    <div class="col-md-4 col-md-offset-4">
        
                <div class="panel panel-default">
                    <div class="panel-heading" style="background: #475762">
                        <h2 class="panel-title" style="color: #ECEFF4">Mailing Address</h2>
                    </div>
                    <div class="panel-body">
                        <div class="form-group">
                            <asp:Label ID="AddressLabel" runat="server" AssociatedControlID="Address">Address:</asp:Label>

                            <asp:TextBox ID="Address" runat="server" class="form-control" placeholder="Address"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="AddressRequired" Style="color: red" runat="server" ControlToValidate="Address" ErrorMessage="Address is required." ToolTip="Address  is required.">* Address  is required.</asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="PostalLabel" runat="server" AssociatedControlID="pCode">Postal Code:</asp:Label>

                            <asp:TextBox ID="pCode" runat="server"  class="form-control" placeholder="Postal Code"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="PostalRequired" Style="color: red" runat="server" ControlToValidate="pCode" ErrorMessage="Postal Code is required." ToolTip="Postal Code is required." >* Postal Code is required.</asp:RequiredFieldValidator>
                        </div>                                                           
                        <br />
                        <asp:Button ID="SubmitButton" runat="server"  Text="Submit"  class="btn btn-default" OnClick="SubmitButton_Click" />
                    </div>
                </div>
            
    </div>

</asp:Content>
