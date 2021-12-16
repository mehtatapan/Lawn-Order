<%@ Page Title="Product Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="EmmaApp.Details" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
        /* https://stackoverflow.com/a/10680513 */
        .hiddencol {
            display: none;
        }
    </style>
    <h1><%=Request.QueryString["Name"] %></h1>
    <div>
        <asp:DetailsView ID="dvName" runat="server" AutoGenerateRows="False" DataKeyNames="id" DataSourceID="obsForm">
            <FieldHeaderStyle Font-Bold="True" />
            <Fields>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id">
                    <HeaderStyle CssClass="hiddencol"></HeaderStyle>
                    <ItemStyle CssClass="hiddencol"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="prodName" HeaderText="Product Name" SortExpression="prodName" />
                <asp:BoundField DataField="prodDescription" HeaderText="Description" SortExpression="prodDescription" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ButtonType="Button" />
            </Fields>
        </asp:DetailsView>
        <br />
    </div>
    <asp:GridView ID="gvDetails" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="obsDetails" OnRowDeleted="gvDetails_RowDeleted">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ButtonType="Button" />
            <asp:BoundField DataField="invSize" HeaderText="Size" SortExpression="invSize" />
            <asp:BoundField DataField="invMeasure" HeaderText="Measurement" SortExpression="invMeasure" />
            <asp:BoundField DataField="invQuantity" HeaderText="Quantity" SortExpression="invQuantity" />
            <asp:TemplateField HeaderText="Price" SortExpression="invPrice">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("invPrice","{0:n}") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("invPrice","${0:n}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="productID" HeaderText="productID" SortExpression="productID">
                <HeaderStyle CssClass="hiddencol"></HeaderStyle>
                <ItemStyle CssClass="hiddencol"></ItemStyle>
            </asp:BoundField>
        </Columns>
    </asp:GridView>
    <br />
    <asp:DetailsView ID="dvNew" runat="server" AutoGenerateRows="False" DataKeyNames="id" DataSourceID="obsNew" Height="50px" Width="125px" OnDataBound="dvNew_DataBound" OnItemInserted="dvNew_ItemInserted">
        <FieldHeaderStyle Font-Bold="True" />
        <Fields>
            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
            <asp:TemplateField HeaderText="Size" SortExpression="invSize">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("invSize") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("invSize") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="Requires Value" ForeColor="Red"></asp:RequiredFieldValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("invSize") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Measurement" SortExpression="invMeasure">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("invMeasure") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("invMeasure") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="Requires Value" ForeColor="Red"></asp:RequiredFieldValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("invMeasure") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Quantity" SortExpression="invQuantity">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("invQuantity") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("invQuantity") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" Display="Dynamic" ErrorMessage="Requires Value" ForeColor="Red"></asp:RequiredFieldValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("invQuantity") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Price" SortExpression="invPrice">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("invPrice") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("invPrice") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4" Display="Dynamic" ErrorMessage="Requires Value" ForeColor="Red"></asp:RequiredFieldValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("invPrice") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="productID" SortExpression="productID">
                <HeaderStyle CssClass="hiddencol" />
                <ItemStyle CssClass="hiddencol" />
                <EditItemTemplate>
                    <asp:TextBox ID="txtProductID" runat="server" Text='<%# Bind("productID") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="txtProductID" runat="server" Text='<%# Bind("productID") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="txtProductID" runat="server" Text='<%# Bind("productID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowInsertButton="True" />
        </Fields>
    </asp:DetailsView>
    <br />
    <br />
    <asp:Label ID="lblError" runat="server" Text="" ForeColor="Red"></asp:Label>
    <br />
    <br />
    <br />
    <asp:ObjectDataSource ID="obsForm" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaLibrary.ProductDetailsTableAdapters.productTableAdapter" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="prodName" Type="String" />
            <asp:Parameter Name="prodDescription" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="Param1" SessionField="ID" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="prodName" Type="String" />
            <asp:Parameter Name="prodDescription" Type="String" />
            <asp:Parameter Name="Original_id" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="obsDetails" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaLibrary.ProductDetailsTableAdapters.inventoryTableAdapter" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="invSize" Type="Decimal" />
            <asp:Parameter Name="invQuantity" Type="Int32" />
            <asp:Parameter Name="invMeasure" Type="String" />
            <asp:Parameter Name="invPrice" Type="Decimal" />
            <asp:Parameter Name="productID" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="Param1" SessionField="ID" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="invSize" Type="Decimal" />
            <asp:Parameter Name="invQuantity" Type="Int32" />
            <asp:Parameter Name="invMeasure" Type="String" />
            <asp:Parameter Name="invPrice" Type="Decimal" />
            <asp:Parameter Name="productID" Type="Int32" />
            <asp:Parameter Name="Original_id" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="obsNew" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaLibrary.ProductDetailsTableAdapters.inventoryNewTableAdapter" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="invSize" Type="Decimal" />
            <asp:Parameter Name="invQuantity" Type="Int32" />
            <asp:Parameter Name="invMeasure" Type="String" />
            <asp:Parameter Name="invPrice" Type="Decimal" />
            <asp:Parameter Name="productID" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="invSize" Type="Decimal" />
            <asp:Parameter Name="invQuantity" Type="Int32" />
            <asp:Parameter Name="invMeasure" Type="String" />
            <asp:Parameter Name="invPrice" Type="Decimal" />
            <asp:Parameter Name="productID" Type="Int32" />
            <asp:Parameter Name="Original_id" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <p>
        <asp:HyperLink ID="lnkBackToInventory" runat="server" NavigateUrl="~/Inventory"><big>Back to Inventory</big></asp:HyperLink>
    </p>
</asp:Content>
