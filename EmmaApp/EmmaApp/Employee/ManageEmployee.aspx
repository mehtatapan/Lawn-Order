<%--Author Jessica Terryberry--%>

<%@ Page Title="Employees" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageEmployee.aspx.cs" Inherits="EmmaApp.Employee.ManageEmployee" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Manage Employees</h2>
    <br />
    <table>
        <tr>
            <td>
                <b>First Name Contains:</b>
            </td>
            <td>
                <b>Last Name Contains:</b>
            </td>
            <td>
                <b>Position:</b>
            </td>
            <td></td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="txtFirstNameFilter" runat="server" Text=''></asp:TextBox>&nbsp;
            </td>
            <td>
                <asp:TextBox ID="txtLastNameFilter" runat="server" Text=''></asp:TextBox>&nbsp;
            </td>
            <td>
                <asp:DropDownList ID="ddlPositionFilter" runat="server" DataSourceID="odsPositions" DataTextField="posName" DataValueField="id" AppendDataBoundItems="true">
                    <asp:ListItem Text="ANY" Value="0" />
                </asp:DropDownList>&nbsp;
            </td>
            <td>
                <asp:Button ID="btnFilter" runat="server" Text="Filter" AutoPostBack="True" />
                <asp:Button ID="btnClearFilter" runat="server" Text="Clear" AutoPostBack="True" OnClick="btnClearFilter_Click" />
            </td>
        </tr>
    </table>
    <br />
    <div>
        <asp:GridView ID="gvEmployees" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="odsManageEmployeesWithFilters" EmptyDataText="&lt;b&gt;No Employees match Filters.&lt;/b&gt;">
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
                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="odsPositions" DataTextField="posName" DataValueField="id" SelectedValue='<%# Bind("posID") %>' Enabled="False">
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#DFF0D8" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" Font-Underline="True" ForeColor="#80C1FF" />
        </asp:GridView>
        <br />
        <asp:Button ID="btnCreateNew" runat="server" OnClick="btnCreateNew_Click" Text="Add New Employee" />
        <br />
        <asp:DetailsView ID="dvCreateEmployee" runat="server" AutoGenerateRows="False" DataKeyNames="id" DataSourceID="odsManageEmployees" DefaultMode="Insert" Height="50px" Visible="False" Width="220px">
            <FieldHeaderStyle Font-Bold="True" />
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
                <asp:TemplateField ShowHeader="False">
                    <InsertItemTemplate>
                        <asp:Button ID="btnInsert" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                        <asp:Button ID="btnCancel" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" OnClick="btnCreateNew_Click" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Button ID="btnNew" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Fields>
            <InsertRowStyle BackColor="#DFF0D8" />
        </asp:DetailsView>
        <br />
        <asp:HyperLink ID="lnkBack1" runat="server" NavigateUrl="~/Employee"><big>Back to Employees Menu</big></asp:HyperLink>
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
        <asp:ObjectDataSource ID="odsManageEmployeesWithFilters" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaLibrary.EmployeeSetTableAdapters.EmployeeCRUDwithFiltersTableAdapter" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="empFirst" Type="String" />
                <asp:Parameter Name="empLast" Type="String" />
                <asp:Parameter Name="posID" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="txtFirstNameFilter" DefaultValue="%" Name="Param1" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txtLastNameFilter" DefaultValue="%" Name="Param2" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="ddlPositionFilter" DefaultValue="0" Name="Param3" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="empFirst" Type="String" />
                <asp:Parameter Name="empLast" Type="String" />
                <asp:Parameter Name="posID" Type="Int32" />
                <asp:Parameter Name="Original_id" Type="Int32" />
            </UpdateParameters>
        </asp:ObjectDataSource>
    </div>
</asp:Content>
