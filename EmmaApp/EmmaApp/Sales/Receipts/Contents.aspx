<%-- Author: Derek Truong --%>

<%@ Page Title="Receipt Contents" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="True" CodeBehind="Contents.aspx.cs" Inherits="EmmaApp.ReceiptContents" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
        /* https://stackoverflow.com/a/10680513 */
        .hiddencol
        {
            display: none;
        }
    </style>
    <h2><asp:Label ID="lblTopHeader" runat="server" Text="Order #"></asp:Label></h2>
    <asp:Label ID="lblOrderError" runat="server" Text="" ForeColor="Red"></asp:Label>
    <asp:DetailsView ID="dvSingleReceipt" runat="server" Height="160px" Width="250px" DataSourceID="odsSingleReceipt" AutoGenerateRows="False" DataKeyNames="id" OnDataBound="dvSingleReceipt_DataBound" EmptyDataText="&lt;strong&gt;This Order does not exist. Check that you have entered your Order Number correctly, or this Order may have been deleted by another user.&lt;/strong&gt;" OnItemUpdated="dvSingleReceipt_ItemUpdated">
        <FieldHeaderStyle Font-Bold="True" />
        <Fields>
            <asp:TemplateField HeaderText="Order&nbsp;Date" SortExpression="ordDate">
                <EditItemTemplate>
                    <asp:TextBox ID="txtDate" runat="server" Text='<%# Bind("ordDate","{0:yyyy-MM-dd}") %>' TextMode="Date"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblDate" runat="server" Text='<%# Bind("ordDate","{0:yyyy-MM-dd}") %>'></asp:Label>
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
            <asp:CommandField ButtonType="Button" ShowEditButton="True" UpdateText="Save" />
        </Fields>
        <EditRowStyle BackColor="#DFF0D8" />
    </asp:DetailsView>
    <h3>Order Contents</h3>
    <asp:Label ID="lblOrderLineError" runat="server" Text="" ForeColor="Red"></asp:Label>
    <asp:GridView ID="gvOrderLine" runat="server" Width="1200px" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="odsOrder_Line" EmptyDataText="&lt;b&gt;This Order contains no Contents.&lt;/b&gt;" OnRowCommand="gvOrderLine_RowCommand" OnRowDataBound="gvOrderLine_RowDataBound" OnRowDeleted="gvOrderLine_RowDeleted" OnRowUpdated="gvOrderLine_RowUpdated">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:Button ID="btnUpdate" runat="server" CausesValidation="True" CommandName="Update" Text="Save" />
                    <asp:Button ID="btnCancel" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Button ID="btnEdit" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                    <asp:Button ID="btnDelete" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick='return confirm("Are you sure you want to delete this Item from this Receipt?");' />
                </ItemTemplate>
                <ItemStyle Width="120px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Order&nbsp;Item" SortExpression="inventoryID">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlInvItem" runat="server" DataSourceID="odsInventory" DataTextField="invItem" DataValueField="id" SelectedValue='<%# Bind("inventoryID") %>' OnSelectedIndexChanged="ddlInvItem_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:DropDownList ID="ddlInvItem" runat="server" DataSourceID="odsInventory" DataTextField="invItem" DataValueField="id" SelectedValue='<%# Bind("inventoryID") %>' Enabled="False"></asp:DropDownList>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="QOH">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlQOH" runat="server" DataSourceID="odsInventory" DataTextField="invQuantity" DataValueField="id" Enabled="False" SelectedValue='<%# Eval("inventoryID") %>'></asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:DropDownList ID="ddlQOH" runat="server" DataSourceID="odsInventory" DataTextField="invQuantity" DataValueField="id" Enabled="False" SelectedValue='<%# Eval("inventoryID") %>'></asp:DropDownList>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Order&nbsp;Quantity" SortExpression="orlQuantity">
                <EditItemTemplate>
                    <asp:TextBox ID="txtQuantity" runat="server" Text='<%# Bind("orlQuantity") %>' TextMode="Number" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="* Quantity is required." ControlToValidate="txtQuantity" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="* Quantity cannot be negative." ControlToValidate="txtQuantity" Operator="GreaterThanEqual" ValueToCompare="0" ForeColor="Red" Display="Dynamic"></asp:CompareValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblQuantity" runat="server" Text='<%# Bind("orlQuantity") %>' Enabled="False"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CheckBoxField DataField="orlOrderReq" HeaderText="Request&nbsp;Restock" SortExpression="orlOrderReq" />
            <asp:TemplateField HeaderText="Suggested&nbsp;Price">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlInvPrice" runat="server" DataSourceID="odsInventory" DataTextField="invPrice" DataValueField="id" Enabled="False" SelectedValue='<%# Eval("inventoryID") %>'></asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:DropDownList ID="ddlInvPrice" runat="server" DataSourceID="odsInventory" DataTextField="invPrice" DataValueField="id" Enabled="False" SelectedValue='<%# Eval("inventoryID") %>'></asp:DropDownList>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Order&nbsp;Price" SortExpression="orlPrice">
                <EditItemTemplate>
                    <asp:TextBox ID="txtPrice" runat="server" Text='<%# Bind("orlPrice","{0:n}") %>' TextMode="Number" Step="0.01"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="* Price is required." ControlToValidate="txtPrice" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator3" runat="server" ErrorMessage="* Price cannot be negative." ControlToValidate="txtPrice" Operator="GreaterThanEqual" ValueToCompare="0" ForeColor="Red" Display="Dynamic"></asp:CompareValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblPrice" runat="server" Text='<%# Bind("orlPrice","${0:n}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="orlNote" HeaderText="Notes" SortExpression="orlNote" />
            <asp:BoundField DataField="receiptID" HeaderText="receiptID" SortExpression="receiptID" HeaderStyle-CssClass="hiddencol" ItemStyle-CssClass="hiddencol" >
                <HeaderStyle CssClass="hiddencol"></HeaderStyle>
                <ItemStyle CssClass="hiddencol"></ItemStyle>
            </asp:BoundField>
        </Columns>
        <EditRowStyle BackColor="#DFF0D8" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
    </asp:GridView>
    <asp:DetailsView ID="dvOrderLine" runat="server" AutoGenerateRows="False" DataKeyNames="id" DataSourceID="odsInsertOrder_Line" OnDataBound="dvOrderLine_DataBound" OnItemInserted="dvOrderLine_ItemInserted">
        <FieldHeaderStyle Font-Bold="True" />
        <Fields>
            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
            <asp:TemplateField HeaderText="Order&nbsp;Item" SortExpression="inventoryID">
                <InsertItemTemplate>
                    <asp:DropDownList ID="ddlNewInvItem" runat="server" DataSourceID="odsInventory" DataTextField="invItem" DataValueField="id" SelectedValue='<%# Bind("inventoryID") %>' OnSelectedIndexChanged="ddlNewInvItem_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:DropDownList ID="ddlNewInvItem" runat="server" DataSourceID="odsInventory" DataTextField="invItem" DataValueField="id" SelectedValue='<%# Bind("inventoryID") %>' Enabled="False"></asp:DropDownList>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="QOH">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlNewQOH" runat="server" DataSourceID="odsInventory" DataTextField="invQuantity" DataValueField="id" Enabled="False"></asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:DropDownList ID="ddlNewQOH" runat="server" DataSourceID="odsInventory" DataTextField="invQuantity" DataValueField="id" Enabled="False"></asp:DropDownList>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Order&nbsp;Quantity" SortExpression="orlQuantity">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtNewQuantity" runat="server" Text='<%# Bind("orlQuantity") %>' TextMode="Number"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="* Quantity is required." ControlToValidate="txtNewQuantity" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator4" runat="server" ErrorMessage="* Quantity cannot be negative." ControlToValidate="txtNewQuantity" Operator="GreaterThanEqual" ValueToCompare="0" ForeColor="Red" Display="Dynamic"></asp:CompareValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblNewQuantity" runat="server" Text='<%# Bind("orlQuantity") %>' Enabled="False"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CheckBoxField DataField="orlOrderReq" HeaderText="Request&nbsp;Restock" SortExpression="orlOrderReq" />
            <asp:TemplateField HeaderText="Suggested&nbsp;Price">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlNewInvPrice" runat="server" DataSourceID="odsInventory" DataTextField="invPrice" DataValueField="id" Enabled="False"></asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:DropDownList ID="ddlNewInvPrice" runat="server" DataSourceID="odsInventory" DataTextField="invPrice" DataValueField="id" Enabled="False"></asp:DropDownList>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Order&nbsp;Price" SortExpression="orlPrice">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtNewPrice" runat="server" Text='<%# Bind("orlPrice","{0:n}") %>' TextMode="Number" Step="0.01"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="* Price is required." ControlToValidate="txtNewPrice" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="* Price cannot be negative." ControlToValidate="txtNewPrice" Operator="GreaterThanEqual" ValueToCompare="0" ForeColor="Red" Display="Dynamic"></asp:CompareValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblNewPrice" runat="server" Text='<%# Bind("orlPrice","${0:n}") %>' Enabled="False"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="orlNote" HeaderText="Notes" SortExpression="orlNote" />
            <asp:TemplateField HeaderText="receiptID" SortExpression="receiptID">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtNewReceiptID" runat="server" Text='<%# Bind("receiptID") %>' Enabled="False"></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblNewReceiptID" runat="server" Text='<%# Bind("receiptID") %>' Enabled="False"></asp:Label>
                </ItemTemplate>
                <HeaderStyle CssClass="hiddencol" />
                <ItemStyle CssClass="hiddencol" />
            </asp:TemplateField>
            <asp:CommandField ShowInsertButton="True" ButtonType="Button" InsertText="Save New" NewText="Add Contents" >
                <ItemStyle Width="120px" />
            </asp:CommandField>
        </Fields>
        <InsertRowStyle BackColor="#DFF0D8" />
    </asp:DetailsView>
    <br />
    <asp:DetailsView ID="dvOrderTotal" runat="server" Height="50px" Width="200px" AutoGenerateRows="False" DataSourceID="odsOrderTotal">
        <Fields>
            <asp:TemplateField HeaderText="<big><strong>Order&nbsp;Total</strong></big>" SortExpression="ordTotal">
                <ItemTemplate>
                    <big><strong><asp:Label ID="lblOrderTotal" runat="server" Text='<%# Bind("ordTotal","${0:n}") %>'></asp:Label></strong></big>
                </ItemTemplate>
            </asp:TemplateField>
        </Fields>
    </asp:DetailsView>
    <br />
    <asp:HyperLink ID="lnkBack" runat="server" NavigateUrl="~/Sales/Receipts"><big>Back to Receipts</big></asp:HyperLink>
    <asp:ObjectDataSource ID="odsSingleReceipt" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaLibrary.ServiceOrderDataSetTableAdapters.SingleReceiptTableAdapter" UpdateMethod="Update">
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
            <asp:SessionParameter Name="Param1" SessionField="receiptID" Type="Int32" />
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
    <asp:ObjectDataSource ID="odsPayment" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaLibrary.ServiceOrderDataSetTableAdapters.PaymentTableAdapter"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsCustomer" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaLibrary.ServiceOrderDataSetTableAdapters.CustomerTableAdapter"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsEmployee" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaLibrary.ServiceOrderDataSetTableAdapters.EmployeeTableAdapter"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsOrder_Line" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaLibrary.ServiceOrderDataSetTableAdapters.Order_LineTableAdapter" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="orlPrice" Type="Decimal" />
            <asp:Parameter Name="orlQuantity" Type="Int32" />
            <asp:Parameter Name="orlOrderReq" Type="Boolean" />
            <asp:Parameter Name="orlNote" Type="String" />
            <asp:Parameter Name="inventoryID" Type="Int32" />
            <asp:Parameter Name="receiptID" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="Param1" SessionField="receiptID" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="orlPrice" Type="Decimal" />
            <asp:Parameter Name="orlQuantity" Type="Int32" />
            <asp:Parameter Name="orlOrderReq" Type="Boolean" />
            <asp:Parameter Name="orlNote" Type="String" />
            <asp:Parameter Name="inventoryID" Type="Int32" />
            <asp:Parameter Name="receiptID" Type="Int32" />
            <asp:Parameter Name="Original_id" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsInventory" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaLibrary.ServiceOrderDataSetTableAdapters.InventoryTableAdapter"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsInsertOrder_Line" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaLibrary.ServiceOrderDataSetTableAdapters.InsertOrder_LineTableAdapter" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="orlPrice" Type="Decimal" />
            <asp:Parameter Name="orlQuantity" Type="Int32" />
            <asp:Parameter Name="orlOrderReq" Type="Boolean" />
            <asp:Parameter Name="orlNote" Type="String" />
            <asp:Parameter Name="inventoryID" Type="Int32" />
            <asp:Parameter Name="receiptID" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="orlPrice" Type="Decimal" />
            <asp:Parameter Name="orlQuantity" Type="Int32" />
            <asp:Parameter Name="orlOrderReq" Type="Boolean" />
            <asp:Parameter Name="orlNote" Type="String" />
            <asp:Parameter Name="inventoryID" Type="Int32" />
            <asp:Parameter Name="receiptID" Type="Int32" />
            <asp:Parameter Name="Original_id" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsOrderTotal" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaLibrary.ServiceOrderDataSetTableAdapters.OrderTotalTableAdapter">
        <SelectParameters>
            <asp:SessionParameter Name="Param1" SessionField="receiptID" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
