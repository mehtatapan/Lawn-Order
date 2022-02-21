<%-- Author: Derek Truong --%>

<%@ Page Title="Sales" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EmmaApp.SalesIndex" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %><br />
        <small>Please select an option below</small></h2>

    <div class="jumbotron bg-success" style="background-color: #DFF0D8">
        <div class="row">
            <div class="col-sm-6">
                <center>
                    <h3>Manage Receipts</h3><br />
                    <a runat="server" href="~/Sales/Receipts">
                        <img runat="server" src="~/images/WarrentyReport.png" alt="Receipts Icon" width="160" height="163">
                    </a>
                    <br />
                    <br />
                    <a runat="server" href="~/Sales/Receipts" type="button" class="btn btn-success">Manage Receipts</a>
                    <br />
                    <br />
                </center>
            </div>
            <div class="col-sm-6">
                <center>
                     <h3>Manage Payment Methods</h3>
                    <a runat="server" href="~/Sales/PaymentMethods">
                        <img runat="server" src="~/images/Payment Method v2.png" alt="Payment Methods Icon" width="221" height="163">
                    </a>
                    <br />
                    <br />
                    <br />
                    <a runat="server" href="~/Sales/PaymentMethods" type="button" class="btn btn-success">Manage Payment Methods</a>
                    <br />
                    <br />
                </center>
            </div>
        </div>
    </div>
    <asp:HyperLink ID="lnkBack" runat="server" NavigateUrl="~/Default"><big>Back to Main Menu</big></asp:HyperLink>
</asp:Content>
