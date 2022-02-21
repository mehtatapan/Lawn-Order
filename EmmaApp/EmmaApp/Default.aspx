<%-- Author: Derek Truong --%>

<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EmmaApp._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <center>
        <h2>Welcome to Lawn & Order!<br />
            <small>The Management App for Emma’s Small Engines</small>
        </h2>
    </center>

    <div class="jumbotron bg-success" style="background-color: #DFF0D8">
        <div class="row">
            <div class="col-sm-4">
                <center>
                    <a runat="server" href="~/Customers">
                        <img runat="server" src="~/images/ViewAllCustomers.png" alt="Customers Icon" width="221" height="163">
                    </a>
                    <br />
                    <br />
                    <a runat="server" href="~/Customers" type="button" class="btn btn-success">Customers</a>
                </center>
            </div>
            <div class="col-sm-4">
                <center>
                    <a runat="server" href="~/Equipment">
                        <img runat="server" src="~/images/ViewAllEquipment.png" alt="Equipment Icon" width="221" height="163">
                    </a>
                    <br />
                    <br />
                    <a runat="server" href="~/Equipment" type="button" class="btn btn-success">Equipment</a>
                </center>
            </div>
            <div class="col-sm-4">
                <center>
                    <a runat="server" href="~/Sales">
                        <img runat="server" src="~/images/Sales.png" alt="Sales Icon" width="221" height="163">
                    </a>
                    <br />
                    <br />
                    <a runat="server" href="~/Sales" type="button" class="btn btn-success">Sales</a>
                </center>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-sm-4">
                <center>
                    <a runat="server" href="~/Employee">
                        <img runat="server" src="~/images/Employee.png" alt="Employees Icon" width="190" height="163">
                    </a>
                    <br />
                    <br />
                    <a runat="server" href="~/Employee" type="button" class="btn btn-success">Employees</a>
                </center>
            </div>
            <div class="col-sm-4">
                <center>
                    <a runat="server" href="~/Inventory">
                        <img runat="server" src="~/images/Inventory.png" alt="Inventory Icon" width="180" height="163">
                    </a>
                    <br />
                    <br />
                    <a runat="server" href="~/Inventory" type="button" class="btn btn-success">Inventory</a>
                </center>
            </div>
            <div class="col-sm-4">
                <center>
                    <a runat="server" href="~/Restocking">
                        <img runat="server" src="~/images/NewOrder Request.png" alt="Restocking Icon" width="221" height="163">
                    </a>
                    <br />
                    <br />
                    <a runat="server" href="~/Restocking" type="button" class="btn btn-success">Restocking</a>
                </center>
            </div>
        </div>
    </div>

</asp:Content>
