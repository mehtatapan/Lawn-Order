<%-- Author: Tapan Piyush Mehta --%>

<%@ Page Title="Manage Equipment Type" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Equip_Type.aspx.cs" Inherits="EmmaApp.Equip_Type" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
        .auto-style1 {
            font-size: xx-large;
        }
        .auto-style2 {
            font-weight: normal;
            font-size: xx-large;
        }
        .auto-style3 {
            font-size: medium;
        }
    </style>
    <h2 class="auto-style2">Equipment Type</h2>
        <p class="auto-style2">
            <asp:GridView ID="gvEquip_Type" runat="server" AutoGenerateColumns="False" CssClass="auto-style3" DataKeyNames="id" DataSourceID="obsEquip_Type">
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
                    <asp:BoundField DataField="eqtType" HeaderText="Equipment Type" SortExpression="eqtType" />
                </Columns>
            </asp:GridView>
            <asp:DetailsView ID="dvEquip_Type" runat="server" AutoGenerateRows="False" CssClass="auto-style3" DataKeyNames="id" DataSourceID="obsEquip_Type" Height="50px" Width="169px">
                <Fields>
                    <asp:BoundField DataField="eqtType" HeaderText="Equipment Type" SortExpression="eqtType" />
                    <asp:TemplateField ShowHeader="False">
                        <InsertItemTemplate>
                            <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Insert" Text="Save New" />
                            &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Button ID="btn_AddNew" runat="server" CausesValidation="False" CommandName="New" Text="Add New" OnClick="btn_AddNew_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Fields>
            </asp:DetailsView>
        </p>
        <p class="auto-style2">
            <asp:ObjectDataSource ID="obsEquip_Type" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaLibrary.EquipmentDataSetTableAdapters.Equip_typeTableAdapter" UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="Original_id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="eqtType" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="eqtType" Type="String" />
                    <asp:Parameter Name="Original_id" Type="Int32" />
                </UpdateParameters>
            </asp:ObjectDataSource>
        </p>
        <p class="auto-style1">
            &nbsp;</p>
</asp:Content>
