<%-- Author: Derek Truong --%>

<%@ Page Title="Payment Methods" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PaymentMethods.aspx.cs" Inherits="EmmaApp.PaymentMethods" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Manage Payment Methods</h2>
    <br />
    <asp:Label ID="lblError" runat="server" Text="" ForeColor="Red"></asp:Label>
    <asp:GridView ID="gvPayMethods" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="odsPayMethods" Width="300px" AllowPaging="True" OnRowCommand="gvPayMethods_RowCommand" OnRowDataBound="gvPayMethods_RowDataBound" OnRowDeleted="gvPayMethods_RowDeleted" OnRowUpdated="gvPayMethods_RowUpdated">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:Button ID="btnUpdate" runat="server" CausesValidation="True" CommandName="Update" Text="Save" />
                    <asp:Button ID="btnCancel" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Button ID="btnEdit" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                    <asp:Button ID="btnDelete" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick='return confirm("Are you sure you want to delete this Item from this Payment Method?");' />
                </ItemTemplate>
                <ItemStyle Width="130px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Payment&nbsp;Method" SortExpression="payType">
                <EditItemTemplate>
                    <asp:TextBox ID="txtPayMethod" runat="server" Text='<%# Bind("payType") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="* This cannot be blank." ControlToValidate="txtPayMethod" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblPayMethod" runat="server" Text='<%# Bind("payType") %>' Enabled="False"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:DetailsView ID="dvPayMethods" runat="server" AutoGenerateRows="False" DataKeyNames="id" DataSourceID="odsPayMethods" OnDataBound="dvPayMethods_DataBound" OnItemInserted="dvPayMethods_ItemInserted">
        <FieldHeaderStyle Font-Bold="True" />
        <Fields>
            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
            <asp:TemplateField HeaderText="Payment&nbsp;Method" SortExpression="payType">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtNewPayMethod" runat="server" Text='<%# Bind("payType") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="* This cannot be blank." ControlToValidate="txtNewPayMethod" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblNewPayMethod" runat="server" Text='<%# Bind("payType") %>' Enabled="False"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ButtonType="Button" InsertText="Save New" NewText="Add New" ShowInsertButton="True">
            <ItemStyle Width="130px" />
            </asp:CommandField>
        </Fields>
    </asp:DetailsView>
    <br />
    <asp:HyperLink ID="lnkBack" runat="server" NavigateUrl="~/Sales"><big>Back to Sales Index</big></asp:HyperLink>
    <asp:ObjectDataSource ID="odsPayMethods" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaLibrary.ServiceOrderDataSetTableAdapters.PayMethodTableAdapter" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="payType" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="payType" Type="String" />
            <asp:Parameter Name="Original_id" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
</asp:Content>
