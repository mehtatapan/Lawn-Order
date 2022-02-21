<%-- Author: Derek Truong --%>

<%@ Page Title="Receipts" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="True" CodeBehind="Default.aspx.cs" Inherits="EmmaApp.ManageReceipts" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Manage Receipts</h2>
    <br />
    <table>
        <tr>
            <td>
                <b>Receipts After:</b>
            </td>
            <td>
                <b>Receipts Before:</b>
            </td>
            <td>
                <b>Paid Status:</b>
            </td>
            <td></td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="txtMinimumDate" runat="server" Text='' TextMode="Date"></asp:TextBox>&nbsp;
            </td>
            <td>
                <asp:TextBox ID="txtMaximumDate" runat="server" Text='' TextMode="Date"></asp:TextBox>&nbsp;
            </td>
            <td>
                <asp:DropDownList ID="ddlPaidFilter" runat="server">
                    <asp:ListItem Text="ANY" Value="2" />
                    <asp:ListItem Text="Paid" Value="1" />
                    <asp:ListItem Text="Not Paid" Value="0" />
                </asp:DropDownList>&nbsp;
            </td>
            <td>
                <asp:Button ID="btnFilter" runat="server" Text="Filter" AutoPostBack="True" />
                <asp:Button ID="btnClearFilter" runat="server" Text="Clear" AutoPostBack="True" OnClick="btnClearFilter_Click" />
            </td>
        </tr>
    </table>
    <br />
    <asp:Label ID="lblError" runat="server" Text="" ForeColor="Red"></asp:Label>
    <!-- Using HTML5 Date Input Type Inside GridView: http://www.binaryintellect.net/articles/0d7482a0-0706-41c0-8543-859dd2431768.aspx -->
    <asp:GridView ID="gvReceipt" runat="server" DataSourceID="odsReceiptBetweenDates" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="id" Width="1100px" OnRowCommand="gvReceipt_RowCommand" OnRowDataBound="gvReceipt_RowDataBound" OnRowDeleted="gvReceipt_RowDeleted" OnSelectedIndexChanged="gvReceipt_SelectedIndexChanged" OnRowUpdated="gvReceipt_RowUpdated" EmptyDataText="&lt;b&gt;No Receipts match Filters.&lt;/b&gt;">
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
        <EditRowStyle BackColor="#DFF0D8" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
    </asp:GridView>
    <asp:DetailsView ID="dvReceipt" runat="server" AutoGenerateRows="False" DataKeyNames="id" DataSourceID="odsReceipt" OnDataBound="dvReceipt_DataBound" OnItemInserted="dvReceipt_ItemInserted">
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
        <InsertRowStyle BackColor="#DFF0D8" />
    </asp:DetailsView>
    <br />
    <asp:DetailsView ID="dvGrandTotal" runat="server" Height="100px" Width="200px" AutoGenerateRows="False" DataSourceID="odsGrandTotalsBetweenDates">
        <Fields>
            <asp:TemplateField HeaderText="<big><b>Grand Total Within Dates</b></big>" SortExpression="grandTotal">
                <ItemTemplate>
                    <big><asp:Label ID="lblGrandTotal" runat="server" Text='<%# Bind("grandTotal","${0:n}") %>'></asp:Label></big>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="<big><b>Party Fund (0.02%)</b></big>" SortExpression="partyFund">
                <ItemTemplate>
                    <big><asp:Label ID="lblPartyFund" runat="server" Text='<%# Bind("partyFund","${0:n}") %>'></asp:Label></big>
                </ItemTemplate>
            </asp:TemplateField>
        </Fields>
    </asp:DetailsView>
    <br />
    <asp:HyperLink ID="lnkBack" runat="server" NavigateUrl="~/Sales"><big>Back to Sales Menu</big></asp:HyperLink>
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
    <asp:ObjectDataSource ID="odsNextOrdNumber" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaLibrary.ServiceOrderDataSetTableAdapters.NextOrdNumberTableAdapter"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsPayment" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaLibrary.ServiceOrderDataSetTableAdapters.PaymentTableAdapter"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsCustomer" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaLibrary.ServiceOrderDataSetTableAdapters.CustomerTableAdapter"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsEmployee" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaLibrary.ServiceOrderDataSetTableAdapters.EmployeeTableAdapter"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsAllOrderTotals" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaLibrary.ServiceOrderDataSetTableAdapters.AllOrderTotalsTableAdapter"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsReceiptBetweenDates" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaLibrary.ServiceOrderDataSetTableAdapters.ReceiptBetweenDatesTableAdapter" UpdateMethod="Update">
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
        <SelectParameters>
            <asp:ControlParameter ControlID="txtMinimumDate" DefaultValue="1700-1-1" Name="Param1" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtMaximumDate" DefaultValue="9999-12-31" Name="Param2" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="ddlPaidFilter" DefaultValue="2" Name="Param3" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
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
    <asp:ObjectDataSource ID="odsGrandTotalsBetweenDates" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaLibrary.ServiceOrderDataSetTableAdapters.GrandTotalsBetweenDatesTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtMinimumDate" DefaultValue="1700-1-1" Name="Param1" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtMaximumDate" DefaultValue="9999-12-31" Name="Param2" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="ddlPaidFilter" DefaultValue="2" Name="Param3" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
