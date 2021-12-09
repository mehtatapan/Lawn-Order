<%-- Author: Derek Truong --%>

<%@ Page Title="Receipts" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EmmaApp.ManageReceipts" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Manage Receipts</h2>
    <br />
    <asp:Label ID="lblError" runat="server" Text="" ForeColor="Red"></asp:Label>
    <!-- Using HTML5 Date Input Type Inside GridView: http://www.binaryintellect.net/articles/0d7482a0-0706-41c0-8543-859dd2431768.aspx -->
    <asp:GridView ID="gvReceipt" runat="server" DataSourceID="odsReceipt" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="id" Width="1100px" OnRowCommand="gvReceipt_RowCommand" OnRowDataBound="gvReceipt_RowDataBound" OnRowDeleted="gvReceipt_RowDeleted" OnSelectedIndexChanged="gvReceipt_SelectedIndexChanged" OnRowUpdated="gvReceipt_RowUpdated">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:Button ID="btnUpdate" runat="server" CausesValidation="True" CommandName="Update" Text="Save" />
                    <asp:Button ID="btnCancel" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Button ID="btnEdit" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                    <asp:Button ID="btnSelect" runat="server" CausesValidation="False" CommandName="Select" Text="Contents" />
                    <asp:Button ID="btnDelete" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick='return confirm("Are you sure you want to delete this Receipt?");' />
                </ItemTemplate>
                <ItemStyle Width="200px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Date" SortExpression="ordDate">
                <EditItemTemplate>
                    <asp:TextBox ID="txtDate" runat="server" Text='<%# Bind("ordDate","{0:yyyy-MM-dd}") %>' TextMode="Date"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblDate" runat="server" Text='<%# Bind("ordDate","{0:yyyy-MM-dd}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Order&nbsp;Number" SortExpression="ordNumber">
                <EditItemTemplate>
                    <asp:TextBox ID="txtOrderNumber" runat="server" Text='<%# Bind("ordNumber") %>' Enabled="False"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblOrderNumber" runat="server" Text='<%# Bind("ordNumber") %>' Enabled="False"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Order&nbsp;Total">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlOrderTotal" runat="server" DataSourceID="odsAllOrderTotals" DataTextField="ordTotal" DataValueField="receiptID" SelectedValue='<%# Eval("id") %>' Enabled="False"></asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:DropDownList ID="ddlOrderTotal" runat="server" DataSourceID="odsAllOrderTotals" DataTextField="ordTotal" DataValueField="receiptID" SelectedValue='<%# Eval("id") %>' Enabled="False"></asp:DropDownList>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CheckBoxField DataField="ordPaid" HeaderText="Is&nbsp;Paid" SortExpression="ordPaid" />
            <asp:TemplateField HeaderText="Pay&nbsp;Method" SortExpression="paymentID">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlPayment" runat="server" DataSourceID="odsPayment" DataTextField="payType" DataValueField="id" SelectedValue='<%# Bind("paymentID") %>'></asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:DropDownList ID="ddlPayment" runat="server" DataSourceID="odsPayment" DataTextField="payType" DataValueField="id" SelectedValue='<%# Bind("paymentID") %>' Enabled="False"></asp:DropDownList>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Customer" SortExpression="custID">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlCustomer" runat="server" DataSourceID="odsCustomer" DataTextField="custName" DataValueField="id" SelectedValue='<%# Bind("custID") %>'></asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:DropDownList ID="ddlCustomer" runat="server" DataSourceID="odsCustomer" DataTextField="custName" DataValueField="id" SelectedValue='<%# Bind("custID") %>' Enabled="False"></asp:DropDownList>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Employee" SortExpression="empID">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlEmployee" runat="server" DataSourceID="odsEmployee" DataTextField="empName" DataValueField="id" SelectedValue='<%# Bind("empID") %>'></asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:DropDownList ID="ddlEmployee" runat="server" DataSourceID="odsEmployee" DataTextField="empName" DataValueField="id" SelectedValue='<%# Bind("empID") %>' Enabled="False"></asp:DropDownList>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:DetailsView ID="dvReceipt" runat="server" AutoGenerateRows="False" DataKeyNames="id" DataSourceID="odsReceipt" OnDataBound="dvReceipt_DataBound">
        <FieldHeaderStyle Font-Bold="True" />
        <Fields>
            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
            <asp:TemplateField HeaderText="Order&nbsp;Number" SortExpression="ordNumber">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtNewOrderNumber" runat="server" Text='<%# Bind("ordNumber") %>' Enabled="False"></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblNewOrderNumber" runat="server" Text='<%# Bind("ordNumber") %>' Enabled="False"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Date" SortExpression="ordDate">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtNewDate" runat="server" Text='<%# Bind("ordDate","{0:yyyy-MM-dd}") %>' TextMode="Date"></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:TextBox ID="txtNewDate" runat="server" Text='<%# Bind("ordDate","{0:yyyy-MM-dd}") %>' TextMode="Date" Enabled="False"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CheckBoxField DataField="ordPaid" HeaderText="Is&nbsp;Paid" SortExpression="ordPaid" />
            <asp:TemplateField HeaderText="Pay&nbsp;Method" SortExpression="paymentID">
                <InsertItemTemplate>
                    <asp:DropDownList ID="ddlNewPayment" runat="server" DataSourceID="odsPayment" DataTextField="payType" DataValueField="id" SelectedValue='<%# Bind("paymentID") %>'></asp:DropDownList>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:DropDownList ID="ddlNewPayment" runat="server" DataSourceID="odsPayment" DataTextField="payType" DataValueField="id" SelectedValue='<%# Bind("paymentID") %>' Enabled="False"></asp:DropDownList>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Customer" SortExpression="custID">
                <InsertItemTemplate>
                    <asp:DropDownList ID="ddlNewCustomer" runat="server" DataSourceID="odsCustomer" DataTextField="custName" DataValueField="id" SelectedValue='<%# Bind("custID") %>'>
                    </asp:DropDownList>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:DropDownList ID="ddlNewCustomer" runat="server" DataSourceID="odsCustomer" DataTextField="custName" DataValueField="id" SelectedValue='<%# Bind("custID") %>' Enabled="False">
                    </asp:DropDownList>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Employee" SortExpression="empID">
                <InsertItemTemplate>
                    <asp:DropDownList ID="ddlNewEmployee" runat="server" DataSourceID="odsEmployee" DataTextField="empName" DataValueField="id" SelectedValue='<%# Bind("empID") %>'></asp:DropDownList>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:DropDownList ID="ddlNewEmployee" runat="server" DataSourceID="odsEmployee" DataTextField="empName" DataValueField="id" SelectedValue='<%# Bind("empID") %>' Enabled="False"></asp:DropDownList>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowInsertButton="True" InsertText="Save New" NewText="Add New" ButtonType="Button">
                <ItemStyle Width="200px" />
            </asp:CommandField>
        </Fields>
    </asp:DetailsView>
    <asp:ObjectDataSource ID="odsReceipt" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaLibrary.ServiceOrderDataSetTableAdapters.ReceiptTableAdapter" UpdateMethod="Update" OnInserted="odsReceipt_Inserted" OnObjectCreated="odsReceipt_ObjectCreated">
        <DeleteParameters>
            <asp:Parameter Name="Original_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ordNumber" Type="String" />
            <asp:Parameter Name="ordDate" Type="DateTime" />
            <asp:Parameter Name="ordPaid" Type="Boolean" />
            <asp:Parameter Name="paymentID" Type="Int32" />
            <asp:Parameter Name="custID" Type="Int32" />
            <asp:Parameter Name="empID" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="ordNumber" Type="String" />
            <asp:Parameter Name="ordDate" Type="DateTime" />
            <asp:Parameter Name="ordPaid" Type="Boolean" />
            <asp:Parameter Name="paymentID" Type="Int32" />
            <asp:Parameter Name="custID" Type="Int32" />
            <asp:Parameter Name="empID" Type="Int32" />
            <asp:Parameter Name="Original_id" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <br />
    <asp:HyperLink ID="lnkBack" runat="server" NavigateUrl="~/Sales"><big>Back to Sales Index</big></asp:HyperLink>
    <asp:ObjectDataSource ID="odsNextOrdNumber" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaLibrary.ServiceOrderDataSetTableAdapters.NextOrdNumberTableAdapter"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsPayment" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaLibrary.ServiceOrderDataSetTableAdapters.PaymentTableAdapter"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsCustomer" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaLibrary.ServiceOrderDataSetTableAdapters.CustomerTableAdapter"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsEmployee" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaLibrary.ServiceOrderDataSetTableAdapters.EmployeeTableAdapter"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsAllOrderTotals" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaLibrary.ServiceOrderDataSetTableAdapters.AllOrderTotalsTableAdapter"></asp:ObjectDataSource>
</asp:Content>
