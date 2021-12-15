<%--Author Jessica Terryberry--%>

<%@ Page Title="Employee" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EmmaApp.EmployeeIndex" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <br />
    <asp:HyperLink ID="lnkManageEmployees" runat="server" NavigateUrl="ManageEmployee"><big>Manage Employees</big></asp:HyperLink>
    <br />
    <asp:HyperLink ID="lnkManagePositions" runat="server" NavigateUrl="ManagePosition"><big>Manage Positions</big></asp:HyperLink>
</asp:Content>
