﻿<%-- Author: Samuel Luke Obray --%>

<%@ Page Title="Inventory" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EmmaApp.Inventory" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
        .auto-style1 {
            margin-right: 4px;
        }

        /* https://stackoverflow.com/a/10680513 */
        .hiddencol {
            display: none;
        }
    </style>
    <h2>Select Product</h2>
    <div>
        <br />
        <table>
        <tr>
            <td>
                <b>Brand Name Contains:</b>
            </td>
            <td>
                <b>Item Name Contains:</b>
            </td>
            <td></td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="txtBrandFilter" runat="server" Text=''></asp:TextBox>&nbsp;
            </td>
            <td>
                <asp:TextBox ID="txtItemFilter" runat="server" Text=''></asp:TextBox>&nbsp;
            </td>
            <td>
                <asp:Button ID="btnFilter" runat="server" Text="Filter" AutoPostBack="True" />
                <asp:Button ID="btnClearFilter" runat="server" Text="Clear" AutoPostBack="True" OnClick="btnClearFilter_Click" />
            </td>
        </tr>
    </table>
        <br />
        <asp:GridView ID="gvProduct" runat="server" AutoGenerateColumns="False" DataKeyNames="ProductID" DataSourceID="obsInventoryLikeBrand" OnSelectedIndexChanged="gvProduct_SelectedIndexChanged" CssClass="auto-style1" EmptyDataText="&lt;b&gt;No Products match Filters.&lt;/b&gt;">
            <Columns>
                <asp:CommandField ShowSelectButton="True" ButtonType="Button" />
                <asp:BoundField DataField="ProductID" HeaderText="ProductID" InsertVisible="False" ReadOnly="True" SortExpression="ProductID">
                    <HeaderStyle CssClass="hiddencol"></HeaderStyle>
                    <ItemStyle CssClass="hiddencol"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="Products" HeaderText="Products" ReadOnly="True" SortExpression="Products" />
            </Columns>
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        </asp:GridView>
        <br />
        &nbsp;&nbsp;&nbsp;<asp:DetailsView ID="dvNew" runat="server" AutoGenerateRows="False" DataKeyNames="id" DataSourceID="obsNew" Height="50px" Width="125px" OnDataBound="dvNew_DataBound" OnItemInserted="dvNew_ItemInserted">
            <FieldHeaderStyle Font-Bold="True" />
            <Fields>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id">
                    <HeaderStyle CssClass="hiddencol"></HeaderStyle>
                    <ItemStyle CssClass="hiddencol"></ItemStyle>
                </asp:BoundField>
                <asp:TemplateField HeaderText="Product" SortExpression="prodName">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("prodName") %>'></asp:TextBox>
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
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("prodDescription") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="Requires Value" ForeColor="Red"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("prodDescription") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Brand" SortExpression="prodBrand">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("prodBrand") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("prodBrand") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" Display="Dynamic" ErrorMessage="Requires Value" ForeColor="Red"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("prodBrand") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowInsertButton="True" ButtonType="Button" />
            </Fields>
            <InsertRowStyle BackColor="#DFF0D8" />
        </asp:DetailsView>
        <br />
        <asp:Label ID="lblError" runat="server" Text="" ForeColor="Red"></asp:Label>
        <br />
        <br />
        <asp:HyperLink ID="lnkBack" runat="server" NavigateUrl="~/Default"><big>Back to Main Menu</big></asp:HyperLink>
    </div>
    <asp:ObjectDataSource ID="obsProducts" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaLibrary.InventoryDataSetTableAdapters.inventoryTableAdapter"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="obsNew" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaLibrary.InventoryDataSetTableAdapters.productTableAdapter" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_id" Type="Int32" />
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
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="obsInventoryLikeBrand" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaLibrary.InventoryDataSetTableAdapters.InventoryWithFiltersTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtBrandFilter" DefaultValue="%" Name="Param1" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtItemFilter" DefaultValue="%" Name="Param2" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
