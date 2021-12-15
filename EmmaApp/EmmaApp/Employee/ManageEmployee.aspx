<%--Author Jessica Terryberry--%>

<%@ Page Title="Employees" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageEmployee.aspx.cs" Inherits="EmmaApp.Employee.ManageEmployee" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Manage Employees</h2>
    <br />
    <div>
        <asp:GridView ID="gvEmployees" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="odsManageEmployees">
            <Columns>
                <asp:TemplateField ShowHeader="False">
                    <EditItemTemplate>
                        <asp:Button ID="btnUpdate" runat="server" CausesValidation="True" CommandName="Update" Text="Save" />
                        <asp:Button ID="btnCancel" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Button ID="btnEdit" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                        <asp:Button ID="btnDelete" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick='return confirm("Are you sure you want to delete this Employee?");' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="id" HeaderText="Employee ID" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="empFirst" HeaderText="First Name" SortExpression="empFirst" />
                <asp:BoundField DataField="empLast" HeaderText="Last Name" SortExpression="empLast" />
                <asp:TemplateField HeaderText="Position" SortExpression="posID">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="odsPositions" DataTextField="posName" DataValueField="id" SelectedValue='<%# Bind("posID") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="odsPositions" DataTextField="posName" DataValueField="id" SelectedValue='<%# Bind("posID") %>'>
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <br />
        <asp:Button ID="btnCreateNew" runat="server" OnClick="btnCreateNew_Click" Text="Add New Employee" />
        <br />
        <asp:DetailsView ID="dvCreateEmployee" runat="server" AutoGenerateRows="False" DataKeyNames="id" DataSourceID="odsManageEmployees" DefaultMode="Insert" Height="50px" Visible="False" Width="220px">
            <Fields>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="empFirst" HeaderText="First Name" SortExpression="empFirst" />
                <asp:BoundField DataField="empLast" HeaderText="Last Name" SortExpression="empLast" />
                <asp:TemplateField HeaderText="Position" SortExpression="posID">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("posID") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="odsPositions" DataTextField="posName" DataValueField="id" SelectedValue='<%# Bind("posID") %>'>
                        </asp:DropDownList>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="odsPositions" DataTextField="posName" DataValueField="id" SelectedValue='<%# Bind("posID") %>'>
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
        <br />
        <asp:HyperLink ID="lnkBack1" runat="server" NavigateUrl="~/Employee"><big>Back to Employee Index</big></asp:HyperLink>
        <asp:ObjectDataSource ID="odsManageEmployees" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaLibrary.EmployeeSetTableAdapters.EmployeeCRUD" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="empFirst" Type="String" />
                <asp:Parameter Name="empLast" Type="String" />
                <asp:Parameter Name="posID" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="empFirst" Type="String" />
                <asp:Parameter Name="empLast" Type="String" />
                <asp:Parameter Name="posID" Type="Int32" />
                <asp:Parameter Name="Original_id" Type="Int32" />
            </UpdateParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsPositions" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaLibrary.EmployeeSetTableAdapters.PositionTableAdapter" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="posName" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="posName" Type="String" />
                <asp:Parameter Name="Original_id" Type="Int32" />
            </UpdateParameters>
        </asp:ObjectDataSource>
    </div>
</asp:Content>
