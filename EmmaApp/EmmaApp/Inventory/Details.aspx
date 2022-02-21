<%-- Author: Samuel Luke Obray --%>

<%@ Page Title="Inventory Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="EmmaApp.Details" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
        /* https://stackoverflow.com/a/10680513 */
        .hiddencol {
            display: none;
        }
    </style>
    <h2><%=Request.QueryString["Name"] %></h2>
    <div>
        <asp:DetailsView ID="dvName" runat="server" AutoGenerateRows="False" DataKeyNames="id" DataSourceID="obsForm" OnItemDeleted="dvName_ItemDeleted">
            <FieldHeaderStyle Font-Bold="True" />
            <Fields>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id">
                    <HeaderStyle CssClass="hiddencol"></HeaderStyle>
                    <ItemStyle CssClass="hiddencol"></ItemStyle>
                </asp:BoundField>
                <asp:TemplateField HeaderText="Product Name" SortExpression="prodName">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("prodName") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="Requires Value" ForeColor="Red"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("prodName") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="Requires Value" ForeColor="Red"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("prodName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Description" SortExpression="prodDescription">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("prodDescription") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="Requires Value" ForeColor="Red"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("prodDescription") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="Requires Value" ForeColor="Red"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("prodDescription") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ButtonType="Button" DeleteText="Delete This Product" />
            </Fields>
            <EditRowStyle BackColor="#DFF0D8" />
        </asp:DetailsView>
        <br />
    </div>
    <h2>Inventory Information</h2>
    <asp:GridView ID="gvDetails" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="obsDetails" OnRowDeleted="gvDetails_RowDeleted">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ButtonType="Button" DeleteText="Delete Inventory Info" />
            <asp:TemplateField HeaderText="Size" SortExpression="invSize">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("invSize") %>' TextMode="Number" Step="0.01"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" Display="Dynamic" ErrorMessage="Requires Value" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator3" runat="server" ErrorMessage="Size cannot be negative" ControlToValidate="TextBox3" Operator="GreaterThanEqual" ValueToCompare="0" ForeColor="Red" Display="Dynamic"></asp:CompareValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("invSize") %>' TextMode="Number" Step="0.01"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Measurement" SortExpression="invMeasure">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("invMeasure") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4" Display="Dynamic" ErrorMessage="Requires Value" ForeColor="Red"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("invMeasure") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Quantity" SortExpression="invQuantity">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("invQuantity") %>' TextMode="Number"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox5" Display="Dynamic" ErrorMessage="Requires Value" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator5" runat="server" ErrorMessage="Quantity cannot be negative" ControlToValidate="TextBox5" Operator="GreaterThanEqual" ValueToCompare="0" ForeColor="Red" Display="Dynamic"></asp:CompareValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("invQuantity") %>' TextMode="Number"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Price" SortExpression="invPrice">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("invPrice","{0:n}") %>' TextMode="Number" Step="0.01"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox6" Display="Dynamic" ErrorMessage="Requires Value" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator6" runat="server" ErrorMessage="Price cannot be negative" ControlToValidate="TextBox6" Operator="GreaterThanEqual" ValueToCompare="0" ForeColor="Red" Display="Dynamic"></asp:CompareValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("invPrice","${0:n}") %>' TextMode="Number" Step="0.01"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="productID" HeaderText="productID" SortExpression="productID">
                <HeaderStyle CssClass="hiddencol"></HeaderStyle>
                <ItemStyle CssClass="hiddencol"></ItemStyle>
            </asp:BoundField>
        </Columns>
        <EditRowStyle BackColor="#DFF0D8" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
    </asp:GridView>
    <br />
    <asp:DetailsView ID="dvNew" runat="server" AutoGenerateRows="False" DataKeyNames="id" DataSourceID="obsNew" Height="50px" Width="125px" OnDataBound="dvNew_DataBound" OnItemInserted="dvNew_ItemInserted">
        <FieldHeaderStyle Font-Bold="True" />
        <Fields>
            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
            <asp:TemplateField HeaderText="Size" SortExpression="invSize">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("invSize") %>' TextMode="Number" Step="0.01"></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("invSize") %>' TextMode="Number" Step="0.01"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox7" Display="Dynamic" ErrorMessage="Requires Value" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator7" runat="server" ErrorMessage="Size cannot be negative" ControlToValidate="TextBox7" Operator="GreaterThanEqual" ValueToCompare="0" ForeColor="Red" Display="Dynamic"></asp:CompareValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("invSize") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Measurement" SortExpression="invMeasure">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("invMeasure") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("invMeasure") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TextBox8" Display="Dynamic" ErrorMessage="Requires Value" ForeColor="Red"></asp:RequiredFieldValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("invMeasure") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Quantity" SortExpression="invQuantity">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("invQuantity") %>' TextMode="Number"></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("invQuantity") %>' TextMode="Number"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="TextBox9" Display="Dynamic" ErrorMessage="Requires Value" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator9" runat="server" ErrorMessage="Quantity cannot be negative" ControlToValidate="TextBox9" Operator="GreaterThanEqual" ValueToCompare="0" ForeColor="Red" Display="Dynamic"></asp:CompareValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("invQuantity") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Price" SortExpression="invPrice">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("invPrice") %>' TextMode="Number" Step="0.01"></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("invPrice") %>' TextMode="Number" Step="0.01"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="TextBox10" Display="Dynamic" ErrorMessage="Requires Value" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator10" runat="server" ErrorMessage="Price cannot be negative" ControlToValidate="TextBox10" Operator="GreaterThanEqual" ValueToCompare="0" ForeColor="Red" Display="Dynamic"></asp:CompareValidator>
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
            <asp:CommandField ShowInsertButton="True" ButtonType="Button" NewText="Add Inventory Info For This Product" />
        </Fields>
        <InsertRowStyle BackColor="#DFF0D8" />
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
        <asp:HyperLink ID="lnkBackToInventory" runat="server" NavigateUrl="~/Inventory"><big>Back to Product List</big></asp:HyperLink>
    </p>
</asp:Content>
