<%@ Page Title="Manage Manufacturer" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EmmaApp.SalesIndex" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="obsManufacturer" Width="284px">
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
                <asp:BoundField DataField="manName" HeaderText="Manufacturer" SortExpression="manName" />
            </Columns>
        </asp:GridView>
    </p>
    <p>&nbsp;</p>
    <p>
        <asp:ObjectDataSource ID="obsManufacturer" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaLibrary.EquipmentDataSetTableAdapters.manufacturerTableAdapter" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_id" Type="Int32" />
                <asp:Parameter Name="Original_manName" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="manName" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="manName" Type="String" />
                <asp:Parameter Name="Original_id" Type="Int32" />
                <asp:Parameter Name="Original_manName" Type="String" />
            </UpdateParameters>
        </asp:ObjectDataSource>
    </p>
    
</asp:Content>
