<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="EmmaApp.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        table {
            border-collapse: collapse;
            margin: auto;
            padding: 0;
            width: calc(100% - 40px);
        }
    </style>
    <h2>About Niagara Connects</h2>
    <br />
    <p>We're a team of Niagara College students working together to make a web application using ASP.NET</p>
    <p>In this project, each member has been assigned tables of the database for which we are responsible for making data sets and pages.</p>
    <br />
    <table border="1">
        <tr style="font-weight: bold; background-color: #1C5E55; color: white">
            <td>
                Student
            </td>
            <td>
                Sections / Tasks
            </td>
            <td>
                Database Tables
            </td>
        </tr>
        <tr>
            <td>
                <ul>
                    <li>Emma Casagrande-Kellam</li>
                </ul>
            </td>
            <td>
                <ul>
                    <li>Customers Section</li>
                    <li>Icons and Art</li>
                    <li>Concept Design</li>
                </ul>
            </td>
            <td>
                <ul>
                    <li>Customer</li>
                </ul>
            </td>
        </tr>
        <tr>
            <td>
                <ul>
                    <li>Tapan Piyush Mehta</li>
                </ul>
            </td>
            <td>
                <ul>
                    <li>Equipment Section</li>
                </ul>
            </td>
            <td>
                <ul>
                    <li>Equipment</li>
                    <li>Equip_Type</li>
                    <li>Manufacturer</li>
                </ul>
            </td>
        </tr>
        <tr>
            <td>
                <ul>
                    <li>Derek Truong</li>
                </ul>
            </td>
            <td>
                <ul>
                    <li>Sales Section</li>
                    <li>Navigation Bar</li>
                    <li>Home Page</li>
                    <li>Log-in System</li>
                </ul>
            </td>
            <td>
                <ul>
                    <li>Receipt</li>
                    <li>Order_Line</li>
                    <li>Payment</li>
                </ul>
            </td>
        </tr>
        <tr>
            <td>
                <ul>
                    <li>Jessica Terryberry</li>
                </ul>
            </td>
            <td>
                <ul>
                    <li>Employees Section</li>
                </ul>
            </td>
            <td>
                <ul>
                    <li>Employee</li>
                    <li>Position</li>
                </ul>
            </td>
        </tr>
        <tr>
            <td>
                <ul>
                    <li>Samuel Luke Obray</li>
                </ul>
            </td>
            <td>
                <ul>
                    <li>Inventory Section</li>
                </ul>
            </td>
            <td>
                <ul>
                    <li>Product</li>
                    <li>Inventory</li>
                </ul>
            </td>
        </tr>
        <tr>
            <td>
                <ul>
                    <li>Tarunbeer Singh</li>
                </ul>
            </td>
            <td>
                <ul>
                    <li>Restocking Section</li>
                </ul>
            </td>
            <td>
                <ul>
                    <li>Prod_Order</li>
                    <li>On_Order</li>
                </ul>
            </td>
        </tr>
    </table>
</asp:Content>
