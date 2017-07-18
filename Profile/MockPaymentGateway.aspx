<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MockPaymentGateway.aspx.cs" Inherits="MockPaymentGateway" %>

<script runat="server">





</script>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" type="text/css" href="../bower_components/bootstrap/dist/css/bootstrap.min.css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div>
        <div class="container">
            <div class="row">


                                <div class="col-xs-2  text-right">
                    Amount of Credit to Add (SGD)
                </div>
                <div class="col-xs-6">
                   
                <asp:textbox id="CreditAmount" runat="server" width="80px" cssclass="form-control   "></asp:textbox>
                    <asp:requiredfieldvalidator runat="server" id="reqTopUp" controltovalidate="CreditAmount" forecolor="Red" errormessage="Please enter value to add" />
                </div>


                <div class="col-xs-12">
                </div>
            </div>
            <div class="row">
                <div class="col-xs-6 col-xs-offset-2">

                    <asp:radiobuttonlist id="RadioButtonList1" runat="server">
                    <asp:ListItem>MasterCard</asp:ListItem>
                    <asp:ListItem>VISA</asp:ListItem>

                </asp:radiobuttonlist>
                    <asp:requiredfieldvalidator runat="server" id="reqType" controltovalidate="RadioButtonList1" forecolor="Red" errormessage="Select One" />
                </div>
            </div>
            <div class="row">
                <div class="col-xs-2  text-right">
                    Name on Card
                </div>
                <div class="col-xs-6">
                    <asp:textbox id="NameonCard" runat="server" width="253px" cssclass="form-control"></asp:textbox>
                    <asp:requiredfieldvalidator runat="server" id="reqName" controltovalidate="NameonCard" forecolor="Red" errormessage="Required Field" />

                </div>
            </div>
            <div class="row">
                <div class="col-xs-2 text-right">
                    Card Number
                </div>
                <div class="col-xs-6">
                    <asp:textbox id="CardNumber" maxlength="16" runat="server" width="253px" cssclass="form-control"></asp:textbox>
                    <asp:requiredfieldvalidator runat="server" id="reqCard" controltovalidate="CardNumber" forecolor="Red" errormessage="Required Field" />
                </div>
            </div>
            <div class="row">
                <div class="col-xs-2 text-right">
                    <asp:label runat="server" text="Security Code"></asp:label>
                </div>
                <div class="col-xs-6">
                    <asp:textbox id="SecCode" type="password" runat="server" maxlength="3" cssclass="form-control"></asp:textbox>
                    <asp:requiredfieldvalidator runat="server" id="reqSec" controltovalidate="SecCode" forecolor="Red" errormessage="Required Field" />
                </div>


            </div>
        <div class="row">
            <div class="col-xs-2  text-right">
                Expiry Date (MM/YY)
            </div>
            <div class="col-xs-6">
                <div class="form-inline">
                    <div class="form-group">
                <asp:textbox id="Month" type="password" runat="server" maxlength="2" width="41px" cssclass="form-control"></asp:textbox>
                /
                <asp:textbox id="Year" type="password" runat="server" maxlength="2" width="41px" cssclass="form-control"></asp:textbox>
                <asp:requiredfieldvalidator runat="server" id="ReqMonth" controltovalidate="Month" forecolor="Red" errormessage="Required Field" />
                <asp:requiredfieldvalidator runat="server" id="ReqYear" controltovalidate="Year" forecolor="Red" errormessage="Required Field" />

                </div>
                    </div>

            </div>
        </div>
        <div class="row">
            <div class="col-xs-6 col-xs-offset-2" style="margin-top:10px">
                <td>
                    <asp:button id="ClearButt" runat="server" text="Clear" onclick="ClearButt_Click" cssclass="btn btn-default" />
                </td>
                <td>
                    <asp:button id="SubmitButt" runat="server" text="Submit" onclick="SubmitButt_Click" cssclass="btn btn-default" />
                </td>
            </div>
        </div>
    </div>
        </div>


</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footer" runat="Server">
    <script src="../bower_components/jquery/dist/jquery.min.js"></script>
    <script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
</asp:Content>

