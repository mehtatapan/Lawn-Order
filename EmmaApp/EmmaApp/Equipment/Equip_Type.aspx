<%@ Page Title="Manage Equipment Type" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EmmaApp.SalesIndex" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <p>&nbsp;</p>
    <asp:GridView ID="gvEquip_Type" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="obsEquip_Type" Height="158px" Width="293px">
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
            <asp:BoundField DataField="eqtType" HeaderText="Equipment Type" SortExpression="eqtType" />
        </Columns>
    </asp:GridView>
    <br />
    <asp:ObjectDataSource ID="obsEquip_Type" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaLibrary.EquipmentDataSetTableAdapters.equip_typeTableAdapter" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_id" Type="Int32" />
            <asp:Parameter Name="Original_eqtType" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="eqtType" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="eqtType" Type="String" />
            <asp:Parameter Name="Original_id" Type="Int32" />
            <asp:Parameter Name="Original_eqtType" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    
</asp:Content>
