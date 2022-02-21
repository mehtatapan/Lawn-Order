<%-- Author: Tapan Piyush Mehta --%>

<%@ Page Title="Equipment" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EmmaApp.SalesIndex" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
     <h2><%: Title %><br />
        <small>Please select an option below</small></h2>

    <div class="jumbotron bg-success" style="background-color: #DFF0D8">
        <div class="row">
            <div class="col-sm-4">
                <center>
                    <h3>Manage Equipment</h3><br />
                    <a runat="server" href="~/Equipment/Equipment">
                        <img runat="server" src="~/images/ViewAllEquipment.png" alt="Equipment Icon" width="221" height="163">
                    </a>
                    <br />
                    <br />
                    <a runat="server" href="~/Equipment/Equipment" type="button" class="btn btn-success">Manage Equipment</a>
                    <br />
                    <br />
                </center>
            </div>
            <div class="col-sm-4">
                <center>
                    <h3>Manage Equipment Types</h3>
                    <br />
                    <a runat="server" href="~/Equipment/Equip_Type">
                        <img runat="server" src="~/images/EquipmentType.png" alt="Equipment Type Icon" width="221" height="163">
                    </a>
                    <br />
                    <br />
                    <a runat="server" href="~/Equipment/Equip_Type" type="button" class="btn btn-success">Manage Equipment Types</a>
                    <br />
                    <br />
                </center>
            </div>
            <div class="col-sm-4">
                <center>
                    <h3>Manage Manufacturers</h3>
                    <br />
                    <a runat="server" href="~/Equipment/Manufacturer">
                        <img runat="server" src="~/images/Manufacturer.png" alt="Payment Methods Icon" width="221" height="163">
                    </a>
                    <br />
                    <br />
                    <a runat="server" href="~/Equipment/Manufacturer" type="button" class="btn btn-success">Manage Manufacturers</a>
                    <br />
                    <br />
                </center>
            </div>
        </div>
    </div>
    <asp:HyperLink ID="lnkHome" runat="server" NavigateUrl="~/Default"><big>Back to Main Menu</big></asp:HyperLink>
</asp:Content>
