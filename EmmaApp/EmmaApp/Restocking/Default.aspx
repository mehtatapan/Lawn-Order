<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EmmaApp.Restocking" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Restocking</h2>
    
  
    <asp:GridView ID="gvOnOrder" runat="server" AutoGenerateColumns="False" DataKeyNames="prodorderID" DataSourceID="OnOrdDVObjectDataSource" OnSelectedIndexChanged="gvOnOrder_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
            <asp:BoundField DataField="onordInvoiceNum" HeaderText="InvoiceNum" SortExpression="onordInvoiceNum" />
            <asp:BoundField DataField="onordArriveDate" HeaderText="ArriveDate" SortExpression="onordArriveDate" />
            <asp:BoundField DataField="onordNumInOrder" HeaderText="NumInOrder" SortExpression="onordNumInOrder" />
            <asp:BoundField DataField="onordPrice" HeaderText="Price" SortExpression="onordPrice" />
            <asp:BoundField DataField="inventoryID" HeaderText="inventoryID" SortExpression="inventoryID" />
            <asp:BoundField DataField="prodorderID" HeaderText="OrderID" SortExpression="prodorderID" />
        </Columns>
    </asp:GridView>

     


        <h4>

            <asp:DetailsView ID="dvOnOrder" runat="server" Height="50px" Width="411px" DataSourceID="OnOrdDVObjectDataSource" AutoGenerateRows="False" DataKeyNames="id">
                <Fields>
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="onordInvoiceNum" HeaderText="onordInvoiceNum" SortExpression="onordInvoiceNum" />
                    <asp:BoundField DataField="onordArriveDate" HeaderText="onordArriveDate" SortExpression="onordArriveDate" />
                    <asp:BoundField DataField="onordNumInOrder" HeaderText="onordNumInOrder" SortExpression="onordNumInOrder" />
                    <asp:BoundField DataField="onordPrice" HeaderText="onordPrice" SortExpression="onordPrice" />
                    <asp:BoundField DataField="inventoryID" HeaderText="inventoryID" SortExpression="inventoryID" />
                    <asp:BoundField DataField="prodorderID" HeaderText="prodorderID" SortExpression="prodorderID" />
                    <asp:CommandField ShowInsertButton="True" />
                </Fields>
            </asp:DetailsView>
    </h4>
    <h4>
        <hr />
        <asp:Label ID="lblProduct" runat="server" Text=""></asp:Label>
        
            <br />
        
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="id" DataSourceID="ObjectDataSource5">
                <EditItemTemplate>
                    id:
                    <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                    <br />
                    pordNumber:
                    <asp:TextBox ID="pordNumberTextBox" runat="server" Text='<%# Bind("pordNumber") %>' />
                    <br />
                    pordDateOrdered:
                    <asp:TextBox ID="pordDateOrderedTextBox" runat="server" Text='<%# Bind("pordDateOrdered") %>' />
                    <br />
                    pordPaid:
                    <asp:CheckBox ID="pordPaidCheckBox" runat="server" Checked='<%# Bind("pordPaid") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    pordNumber:
                    <asp:TextBox ID="pordNumberTextBox" runat="server" Text='<%# Bind("pordNumber") %>' />
                    <br />
                    pordDateOrdered:
                    <asp:TextBox ID="pordDateOrderedTextBox" runat="server" Text='<%# Bind("pordDateOrdered") %>' />
                    <br />
                    pordPaid:
                    <asp:CheckBox ID="pordPaidCheckBox" runat="server" Checked='<%# Bind("pordPaid") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    id:
                    <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                    <br />
                    pordNumber:
                    <asp:Label ID="pordNumberLabel" runat="server" Text='<%# Bind("pordNumber") %>' />
                    <br />
                    pordDateOrdered:
                    <asp:Label ID="pordDateOrderedLabel" runat="server" Text='<%# Bind("pordDateOrdered") %>' />
                    <br />
                    pordPaid:
                    <asp:CheckBox ID="pordPaidCheckBox" runat="server" Checked='<%# Bind("pordPaid") %>' Enabled="false" />
                    <br />

                </ItemTemplate>
            </asp:FormView>
            &nbsp;<br />
        <asp:DetailsView ID="dvProdOrder" runat="server" AutoGenerateRows="False" DataKeyNames="id" DataSourceID="prodOrderObjectDataSource" Height="50px" Width="411px">
                <Fields>
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="pordNumber" HeaderText="pordNumber" SortExpression="pordNumber" />
                    <asp:BoundField DataField="pordDateOrdered" HeaderText="pordDateOrdered" SortExpression="pordDateOrdered" />
                    <asp:CheckBoxField DataField="pordPaid" HeaderText="pordPaid" SortExpression="pordPaid" />
                    <asp:CommandField ShowInsertButton="True" />
                </Fields>
            </asp:DetailsView>
    <h4>
        
            &nbsp;</h4>
    <h4>
            &nbsp;</h4>
    
    
   
    <br />
  
    
    <br />
    
    <br />
    <br />
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="Delete" InsertMethod="Insert"  OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaLibrary.RestockingDataSetTableAdapters.inventoryTableAdapter" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_id" Type="Int32" />
            <asp:Parameter Name="Original_invQuantity" Type="Int32" />
            <asp:Parameter Name="Original_invSize" Type="Decimal" />
            <asp:Parameter Name="Original_invMeasure" Type="String" />
            <asp:Parameter Name="Original_invPrice" Type="Decimal" />
            <asp:Parameter Name="Original_productID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="invQuantity" Type="Int32" />
            <asp:Parameter Name="invSize" Type="Decimal" />
            <asp:Parameter Name="invMeasure" Type="String" />
            <asp:Parameter Name="invPrice" Type="Decimal" />
            <asp:Parameter Name="productID" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="invQuantity" Type="Int32" />
            <asp:Parameter Name="invSize" Type="Decimal" />
            <asp:Parameter Name="invMeasure" Type="String" />
            <asp:Parameter Name="invPrice" Type="Decimal" />
            <asp:Parameter Name="productID" Type="Int32" />
            <asp:Parameter Name="Original_id" Type="Int32" />
            <asp:Parameter Name="Original_invQuantity" Type="Int32" />
            <asp:Parameter Name="Original_invSize" Type="Decimal" />
            <asp:Parameter Name="Original_invMeasure" Type="String" />
            <asp:Parameter Name="Original_invPrice" Type="Decimal" />
            <asp:Parameter Name="Original_productID" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <br />
    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaLibrary.RestockingDataSetTableAdapters.productTableAdapter" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_id" Type="Int32" />
            <asp:Parameter Name="Original_prodName" Type="String" />
            <asp:Parameter Name="Original_prodDescription" Type="String" />
            <asp:Parameter Name="Original_prodBrand" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="prodName" Type="String" />
            <asp:Parameter Name="prodDescription" Type="String" />
            <asp:Parameter Name="prodBrand" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="prodName" Type="String" />
            <asp:Parameter Name="prodDescription" Type="String" />
            <asp:Parameter Name="prodBrand" Type="String" />
            <asp:Parameter Name="Original_id" Type="Int32" />
            <asp:Parameter Name="Original_prodName" Type="String" />
            <asp:Parameter Name="Original_prodDescription" Type="String" />
            <asp:Parameter Name="Original_prodBrand" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaLibrary.RestockingDataSetTableAdapters.DataTable1TableAdapter"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource4" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaLibrary.RestockingDataSetTableAdapters.on_orderTableAdapter" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_id" Type="Int32" />
            <asp:Parameter Name="Original_onordInvoiceNum" Type="String" />
            <asp:Parameter Name="Original_onordArriveDate" Type="DateTime" />
            <asp:Parameter Name="Original_onordNumInOrder" Type="Int32" />
            <asp:Parameter Name="Original_onordPrice" Type="Decimal" />
            <asp:Parameter Name="Original_inventoryID" Type="Int32" />
            <asp:Parameter Name="Original_prodorderID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="onordInvoiceNum" Type="String" />
            <asp:Parameter Name="onordArriveDate" Type="DateTime" />
            <asp:Parameter Name="onordNumInOrder" Type="Int32" />
            <asp:Parameter Name="onordPrice" Type="Decimal" />
            <asp:Parameter Name="inventoryID" Type="Int32" />
            <asp:Parameter Name="prodorderID" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="onordInvoiceNum" Type="String" />
            <asp:Parameter Name="onordArriveDate" Type="DateTime" />
            <asp:Parameter Name="onordNumInOrder" Type="Int32" />
            <asp:Parameter Name="onordPrice" Type="Decimal" />
            <asp:Parameter Name="inventoryID" Type="Int32" />
            <asp:Parameter Name="prodorderID" Type="Int32" />
            <asp:Parameter Name="Original_id" Type="Int32" />
            <asp:Parameter Name="Original_onordInvoiceNum" Type="String" />
            <asp:Parameter Name="Original_onordArriveDate" Type="DateTime" />
            <asp:Parameter Name="Original_onordNumInOrder" Type="Int32" />
            <asp:Parameter Name="Original_onordPrice" Type="Decimal" />
            <asp:Parameter Name="Original_inventoryID" Type="Int32" />
            <asp:Parameter Name="Original_prodorderID" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource5" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaLibrary.RestockingDataSetTableAdapters.prod_orderTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="gvOnOrder" Name="Param1" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource6" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaLibrary.RestockingDataSetTableAdapters.prod_orderTableAdapter" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_id" Type="Int32" />
            <asp:Parameter Name="Original_pordNumber" Type="String" />
            <asp:Parameter Name="Original_pordDateOrdered" Type="DateTime" />
            <asp:Parameter Name="Original_pordPaid" Type="Boolean" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="pordNumber" Type="String" />
            <asp:Parameter Name="pordDateOrdered" Type="DateTime" />
            <asp:Parameter Name="pordPaid" Type="Boolean" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="gvOnOrder" Name="Param1" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="pordNumber" Type="String" />
            <asp:Parameter Name="pordDateOrdered" Type="DateTime" />
            <asp:Parameter Name="pordPaid" Type="Boolean" />
            <asp:Parameter Name="Original_id" Type="Int32" />
            <asp:Parameter Name="Original_pordNumber" Type="String" />
            <asp:Parameter Name="Original_pordDateOrdered" Type="DateTime" />
            <asp:Parameter Name="Original_pordPaid" Type="Boolean" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="prodOrderObjectDataSource" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaLibrary.RestockingDataSetTableAdapters.prod_order1TableAdapter" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_id" Type="Int32" />
            <asp:Parameter Name="Original_pordNumber" Type="String" />
            <asp:Parameter Name="Original_pordDateOrdered" Type="DateTime" />
            <asp:Parameter Name="Original_pordPaid" Type="Boolean" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="pordNumber" Type="String" />
            <asp:Parameter Name="pordDateOrdered" Type="DateTime" />
            <asp:Parameter Name="pordPaid" Type="Boolean" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="pordNumber" Type="String" />
            <asp:Parameter Name="pordDateOrdered" Type="DateTime" />
            <asp:Parameter Name="pordPaid" Type="Boolean" />
            <asp:Parameter Name="Original_id" Type="Int32" />
            <asp:Parameter Name="Original_pordNumber" Type="String" />
            <asp:Parameter Name="Original_pordDateOrdered" Type="DateTime" />
            <asp:Parameter Name="Original_pordPaid" Type="Boolean" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="on_OrderObjectDataSource" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaLibrary.RestockingDataSetTableAdapters.on_orderTableAdapter" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_id" Type="Int32" />
            <asp:Parameter Name="Original_onordInvoiceNum" Type="String" />
            <asp:Parameter Name="Original_onordArriveDate" Type="DateTime" />
            <asp:Parameter Name="Original_onordNumInOrder" Type="Int32" />
            <asp:Parameter Name="Original_onordPrice" Type="Decimal" />
            <asp:Parameter Name="Original_inventoryID" Type="Int32" />
            <asp:Parameter Name="Original_prodorderID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="onordInvoiceNum" Type="String" />
            <asp:Parameter Name="onordArriveDate" Type="DateTime" />
            <asp:Parameter Name="onordNumInOrder" Type="Int32" />
            <asp:Parameter Name="onordPrice" Type="Decimal" />
            <asp:Parameter Name="inventoryID" Type="Int32" />
            <asp:Parameter Name="prodorderID" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="onordInvoiceNum" Type="String" />
            <asp:Parameter Name="onordArriveDate" Type="DateTime" />
            <asp:Parameter Name="onordNumInOrder" Type="Int32" />
            <asp:Parameter Name="onordPrice" Type="Decimal" />
            <asp:Parameter Name="inventoryID" Type="Int32" />
            <asp:Parameter Name="prodorderID" Type="Int32" />
            <asp:Parameter Name="Original_id" Type="Int32" />
            <asp:Parameter Name="Original_onordInvoiceNum" Type="String" />
            <asp:Parameter Name="Original_onordArriveDate" Type="DateTime" />
            <asp:Parameter Name="Original_onordNumInOrder" Type="Int32" />
            <asp:Parameter Name="Original_onordPrice" Type="Decimal" />
            <asp:Parameter Name="Original_inventoryID" Type="Int32" />
            <asp:Parameter Name="Original_prodorderID" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="OnOrdDVObjectDataSource" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaLibrary.RestockingDataSetTableAdapters.on_orderDVTableAdapter" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_id" Type="Int32" />
            <asp:Parameter Name="Original_onordInvoiceNum" Type="String" />
            <asp:Parameter Name="Original_onordArriveDate" Type="DateTime" />
            <asp:Parameter Name="Original_onordNumInOrder" Type="Int32" />
            <asp:Parameter Name="Original_onordPrice" Type="Decimal" />
            <asp:Parameter Name="Original_inventoryID" Type="Int32" />
            <asp:Parameter Name="Original_prodorderID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="onordInvoiceNum" Type="String" />
            <asp:Parameter Name="onordArriveDate" Type="DateTime" />
            <asp:Parameter Name="onordNumInOrder" Type="Int32" />
            <asp:Parameter Name="onordPrice" Type="Decimal" />
            <asp:Parameter Name="inventoryID" Type="Int32" />
            <asp:Parameter Name="prodorderID" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="onordInvoiceNum" Type="String" />
            <asp:Parameter Name="onordArriveDate" Type="DateTime" />
            <asp:Parameter Name="onordNumInOrder" Type="Int32" />
            <asp:Parameter Name="onordPrice" Type="Decimal" />
            <asp:Parameter Name="inventoryID" Type="Int32" />
            <asp:Parameter Name="prodorderID" Type="Int32" />
            <asp:Parameter Name="Original_id" Type="Int32" />
            <asp:Parameter Name="Original_onordInvoiceNum" Type="String" />
            <asp:Parameter Name="Original_onordArriveDate" Type="DateTime" />
            <asp:Parameter Name="Original_onordNumInOrder" Type="Int32" />
            <asp:Parameter Name="Original_onordPrice" Type="Decimal" />
            <asp:Parameter Name="Original_inventoryID" Type="Int32" />
            <asp:Parameter Name="Original_prodorderID" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <br />
    <br />
        






   
</asp:Content>
