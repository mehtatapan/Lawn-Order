<%@ Page Title="Equipment" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EmmaApp.SalesIndex" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <br />
    <asp:HyperLink ID="lnkManageEquipments" runat="server" NavigateUrl="~/Equipment/Manage_Equip/Manage_Equip.aspx"><big>Manage Equipments</big></asp:HyperLink>
    <br />
    <br />
    <asp:HyperLink ID="lnkManageEquip_Types" runat="server" NavigateUrl="~/Equipment/Equip_Type.aspx"><big>Manage Equipment Types</big></asp:HyperLink>
    <br />
    <br />
    <asp:HyperLink ID="lnkManageManufacturer" runat="server" NavigateUrl="~/Equipment/Manufacturer.aspx"><big>Manage Manufacturer</big></asp:HyperLink>
    <br />
</asp:Content>
