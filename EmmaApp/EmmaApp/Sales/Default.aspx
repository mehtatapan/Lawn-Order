<%-- Author: Derek Truong --%>

<%@ Page Title="Sales" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EmmaApp.SalesIndex" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <br />
    <asp:HyperLink ID="lnkManageReceipts" runat="server" NavigateUrl="~/Sales/Receipts"><big>Manage Receipts</big></asp:HyperLink>
    <br />
    <asp:HyperLink ID="lnkManagePayMethods" runat="server" NavigateUrl="~/Sales/PaymentMethods"><big>Manage Payment Methods</big></asp:HyperLink>
</asp:Content>
