<%-- Author: Tapan Piyush Mehta --%>

<%@ Page Title="Manage Manufacturer" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Manufacturer.aspx.cs" Inherits="EmmaApp.Manufacturer" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
        .auto-style1 {
            font-size: xx-large;
        }
        .auto-style3 {
            font-size: medium;
        }
    </style>
    <div class="auto-style1">
            Manufacturer<br />
            <br />
            <asp:GridView ID="gvManufacturer" runat="server" AutoGenerateColumns="False" CssClass="auto-style3" DataKeyNames="id" DataSourceID="obsManufacturer" Width="352px">
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
                    <asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="manName" HeaderText="Manufacturer" SortExpression="manName" />
                </Columns>
            </asp:GridView>
            <asp:DetailsView ID="dvManufacturer" runat="server" AutoGenerateRows="False" CssClass="auto-style3" DataKeyNames="id" DataSourceID="obsManufacturer" Height="50px" Width="219px">
                <Fields>
                    <asp:BoundField DataField="manName" HeaderText="Manufacturer" SortExpression="manName" />
                    <asp:TemplateField ShowHeader="False">
                        <InsertItemTemplate>
                            <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Insert" Text="Save New" OnClick="Button1_Click" />
                            &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Button ID="btn_AddNew" runat="server" CausesValidation="False" CommandName="New" OnClick="btn_AddNew_Click" Text="Add New" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Fields>
            </asp:DetailsView>
            <br />
            <asp:ObjectDataSource ID="obsManufacturer" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaLibrary.EquipmentDataSetTableAdapters.ManufacturerTableAdapter" UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="Original_id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="manName" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="manName" Type="String" />
                    <asp:Parameter Name="Original_id" Type="Int32" />
                </UpdateParameters>
            </asp:ObjectDataSource>
        </div>
</asp:Content>
