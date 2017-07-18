<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="MyProfile.aspx.cs" Inherits="Profile_MyProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" type="text/css" href="../bower_components/bootstrap/dist/css/bootstrap.min.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">
    <div class="col-md-6 col-md-offset-3">
        <div class="panel panel-default" >
            <div class="panel-heading" style="background: #475762">
                <h3 class="panel-title"  style="color: #ECEFF4">My Profile</h3>
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-4">User Name</div>
                    <div class="col-md-8">
                        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">User Role</div>
                    <div class="col-md-8">
                        <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">Address</div>
                    <div class="col-md-8">
                        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">Credits</div>
                    <div class="col-md-8">
                        $<asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-4">
                        <asp:Button ID="Button1" runat="server" Text="Change Password" CssClass="form-control btn-info" OnClick="Button1_Click"/></div>
                    <div class="col-md-4">
                        <asp:Button ID="Button2" runat="server" Text="Change Address" CssClass="form-control btn-info" OnClick="Button2_Click"/>
                    </div>
                    <div class="col-md-4">
                        <asp:Button ID="Button3" runat="server" Text="Change Email" CssClass="form-control btn-info" OnClick="Button3_Click"/>
                    </div>
                </div>

            </div>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="Server">
    <script src="../bower_components/jquery/dist/jquery.min.js"></script>
    <script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
</asp:Content>