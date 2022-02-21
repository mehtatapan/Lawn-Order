<%--Author Jessica Terryberry--%>

<%@ Page Title="Employees" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EmmaApp.EmployeeIndex" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %><br />
        <small>Please select an option below</small></h2>

    <div class="jumbotron bg-success" style="background-color: #DFF0D8">
        <div class="row">
            <div class="col-sm-6">
                <center>
                    <h3>Manage Employees</h3><br />
                    <a runat="server" href="~/Employee/ManageEmployee">
                        <img runat="server" src="~/images/EditCustomer.png" alt="Employees Icon" width="200" height="163">
                    </a>
                    <br />
                    <br />
                    <a runat="server" href="~/Employee/ManageEmployee" type="button" class="btn btn-success">Manage Employees</a>
                    <br />
                    <br />
                </center>
            </div>
            <div class="col-sm-6">
                <center>
                     <h3>Manage Positions</h3>
                    <br />
                    <a runat="server" href="~/Employee/ManagePosition">
                        <img runat="server" src="~/images/Employee.png" alt="Positions Icon" width="190" height="163">
                    </a>
                    <br />
                    <br />
                    <a runat="server" href="~/Employee/ManagePosition" type="button" class="btn btn-success">Manage Positions</a>
                    <br />
                    <br />
                </center>
            </div>
        </div>
    </div>
    <asp:HyperLink ID="lnkBack" runat="server" NavigateUrl="~/Default"><big>Back to Main Menu</big></asp:HyperLink>
</asp:Content>
