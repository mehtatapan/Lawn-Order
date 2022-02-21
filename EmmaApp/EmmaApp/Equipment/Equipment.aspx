<%-- Author: Tapan Piyush Mehta --%>

<%@ Page Title="Manage Equipment" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="True" CodeBehind="Equipment.aspx.cs" Inherits="EmmaApp.Manage_Equipment" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
        .auto-style1 {
            font-size: xx-large;
        }
        .auto-style2 {
            font-size: medium;
        }
    </style>
    <div class="auto-style1">
            Equipment<br />
            <asp:GridView ID="gvEquipment" runat="server" AutoGenerateColumns="False" CssClass="auto-style2" DataKeyNames="id" DataSourceID="obsEquipment" OnSelectedIndexChanged="gvEquipment_SelectedIndexChanged">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="equModel" HeaderText="equModel" SortExpression="equModel" />
                    <asp:BoundField DataField="equSerial" HeaderText="equSerial" SortExpression="equSerial" />
                    <asp:BoundField DataField="custID" HeaderText="custID" SortExpression="custID" />
                    <asp:BoundField DataField="equtypeID" HeaderText="equtypeID" SortExpression="equtypeID" />
                    <asp:BoundField DataField="equManuID" HeaderText="equManuID" SortExpression="equManuID" />
                </Columns>
            </asp:GridView>
            <asp:DetailsView ID="dvEquipment" runat="server" AutoGenerateRows="False" CssClass="auto-style2" DataKeyNames="id" DataSourceID="obsEquipment" Height="50px" Width="125px">
                <Fields>
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="equModel" HeaderText="Equipment" SortExpression="equModel" />
                    <asp:BoundField DataField="equSerial" HeaderText="Serial Number" SortExpression="equSerial" />
                    <asp:TemplateField HeaderText="Customer" SortExpression="custID">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("custID") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="obsCustomer" DataTextField="custName" DataValueField="id" SelectedValue='<%# Bind("custID") %>'>
                                <asp:ListItem Selected="True" Value="0">Select Customer :-</asp:ListItem>
                            </asp:DropDownList>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("custID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Equipment Type" SortExpression="equtypeID">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("equtypeID") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="obsEquip_Type" DataTextField="eqtType" DataValueField="id" SelectedValue='<%# Bind("equtypeID") %>'>
                                <asp:ListItem Selected="True" Value="0">Select Equipment Type :-</asp:ListItem>
                            </asp:DropDownList>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("equtypeID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Manufacturer" SortExpression="equManuID">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("equManuID") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:DropDownList ID="DropDownList6" runat="server" DataSourceID="obsManufacturer" DataTextField="manName" DataValueField="id" SelectedValue='<%# Bind("equManuID") %>'>
                                <asp:ListItem Selected="True" Value="0">Select Manufacturer :-</asp:ListItem>
                            </asp:DropDownList>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("equManuID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
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
            <asp:FormView ID="fvEquipment" runat="server" CssClass="auto-style2" DataKeyNames="id" DataSourceID="obsEquipment">
                <EditItemTemplate>
                    id:
                    <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                    <br />
                    equModel:
                    <asp:TextBox ID="equModelTextBox" runat="server" Text='<%# Bind("equModel") %>' />
                    <br />
                    equSerial:
                    <asp:TextBox ID="equSerialTextBox" runat="server" Text='<%# Bind("equSerial") %>' />
                    <br />
                    custID:
                    <asp:TextBox ID="custIDTextBox" runat="server" Text='<%# Bind("custID") %>' />
                    <br />
                    equtypeID:
                    <asp:TextBox ID="equtypeIDTextBox" runat="server" Text='<%# Bind("equtypeID") %>' />
                    <br />
                    equManuID:
                    <asp:TextBox ID="equManuIDTextBox" runat="server" Text='<%# Bind("equManuID") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    equModel:
                    <asp:TextBox ID="equModelTextBox" runat="server" Text='<%# Bind("equModel") %>' />
                    <br />
                    equSerial:
                    <asp:TextBox ID="equSerialTextBox" runat="server" Text='<%# Bind("equSerial") %>' />
                    <br />
                    custID:
                    <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="obsCustomer" DataTextField="custName" DataValueField="id" SelectedValue='<%# Bind("custID") %>'>
                        <asp:ListItem Selected="True" Value="0">Select Customer :-</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    equtypeID:
                    <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="obsEquip_Type" DataTextField="eqtType" DataValueField="id" SelectedValue='<%# Bind("equtypeID") %>'>
                        <asp:ListItem Selected="True" Value="0">Select Equipment Type :-</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    equManuID:
                    <asp:DropDownList ID="DropDownList6" runat="server" DataSourceID="obsManufacturer" DataTextField="manName" DataValueField="id" SelectedValue='<%# Bind("equManuID") %>'>
                        <asp:ListItem Selected="True" Value="0">Select Manufacturer :-</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    id:
                    <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                    <br />
                    equModel:
                    <asp:Label ID="equModelLabel" runat="server" Text='<%# Bind("equModel") %>' />
                    <br />
                    equSerial:
                    <asp:Label ID="equSerialLabel" runat="server" Text='<%# Bind("equSerial") %>' />
                    <br />
                    custID:
                    <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="obsCustomer" DataTextField="custName" DataValueField="id" SelectedValue='<%# Bind("custID") %>'>
                        <asp:ListItem Selected="True" Value="0">Select Customer :-</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    equtypeID:
                    <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="obsEquip_Type" DataTextField="eqtType" DataValueField="id" SelectedValue='<%# Bind("equtypeID") %>'>
                        <asp:ListItem Selected="True" Value="0">Select Equipment Type :-</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    equManuID:
                    <asp:DropDownList ID="DropDownList6" runat="server" DataSourceID="obsManufacturer" DataTextField="manName" DataValueField="id" SelectedValue='<%# Bind("equManuID") %>'>
                        <asp:ListItem Selected="True" Value="0">Select Manufacturer :-</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                    &nbsp;
                </ItemTemplate>
            </asp:FormView>
            <br />
            <asp:ObjectDataSource ID="obsEquipment" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaLibrary.EquipmentDataSetTableAdapters.EquipmentTableAdapter" UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="Original_id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="equModel" Type="String" />
                    <asp:Parameter Name="equSerial" Type="String" />
                    <asp:Parameter Name="custID" Type="Int32" />
                    <asp:Parameter Name="equtypeID" Type="Int32" />
                    <asp:Parameter Name="equManuID" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="equModel" Type="String" />
                    <asp:Parameter Name="equSerial" Type="String" />
                    <asp:Parameter Name="custID" Type="Int32" />
                    <asp:Parameter Name="equtypeID" Type="Int32" />
                    <asp:Parameter Name="equManuID" Type="Int32" />
                    <asp:Parameter Name="Original_id" Type="Int32" />
                </UpdateParameters>
            </asp:ObjectDataSource>
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
            <asp:ObjectDataSource ID="obsCustomer" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaLibrary.EquipmentDataSetTableAdapters.CustomerTableAdapter"></asp:ObjectDataSource>
            <br />
        </div>
</asp:Content>
