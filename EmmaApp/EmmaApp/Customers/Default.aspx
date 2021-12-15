<%@ Page Title="Customers Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="True" CodeBehind="Default.aspx.cs" Inherits="EmmaApp.Customers.Default" %>
<%-- Author: Emma Casagrande-Kellam --%>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><asp:Label ID="lblTopHeader" runat="server" Text="Customers"></asp:Label></h2>
    <asp:GridView ID="gvCustomers" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="odsCustomers" Width="1100px" OnSelectedIndexChanged="gvCustomers_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ShowEditButton="True" ShowSelectButton="True" SelectText="Details" ButtonType="Button" />
            <asp:TemplateField HeaderText="First Name" SortExpression="custFirst">
                <EditItemTemplate>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="txtFirstNameEdit" ErrorMessage="*Must provide first name" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtFirstNameEdit" runat="server" Text='<%# Bind("custFirst") %>'></asp:TextBox><br />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("custFirst") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Last Name" SortExpression="custLast">
                <EditItemTemplate>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtLastNameEdit" ErrorMessage="*Must provide last name" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtLastNameEdit" runat="server" Text='<%# Bind("custLast") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("custLast") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Phone" SortExpression="custPhone">
                <EditItemTemplate>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtPhoneEdit" ErrorMessage="*Please enter a 10 digit phone number with no spaces or special characters" ForeColor="Red" ValidationExpression="^[0-9]{10}$" Display="Dynamic"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtPhoneEdit" ErrorMessage="*Must provide phone number" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtPhoneEdit" runat="server" Text='<%# Bind("custPhone") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("custPhone") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Address" SortExpression="custAddress">
                <EditItemTemplate>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtAddressEdit" ErrorMessage="*Must provide an address" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtAddressEdit" runat="server" Text='<%# Bind("custAddress") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("custAddress") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="City" SortExpression="custCity">
                <EditItemTemplate>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtCityEdit" ErrorMessage="*Must provide a city" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtCityEdit" runat="server" Text='<%# Bind("custCity") %>'></asp:TextBox><br />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("custCity") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Postal Code" SortExpression="custPostal">
                <EditItemTemplate>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtPostalEdit" ErrorMessage="*Please enter a valid Canadian postal code in uppercase with no spaces or special characters" ForeColor="Red" ValidationExpression="[ABCEGHJKLMNPRSTVXY][0-9][ABCEGHJKLMNPRSTVWXYZ][0-9][ABCEGHJKLMNPRSTVWXYZ][0-9]" Display="Dynamic"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtPostalEdit" ErrorMessage="*Must provide a postal code" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtPostalEdit" runat="server" Text='<%# Bind("custPostal") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("custPostal") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Email" SortExpression="custEmail">
                <EditItemTemplate>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="txtEmailEdit" ErrorMessage="*Please enter a valid email address" ForeColor="Red" ValidationExpression="^([a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6})*$" Display="Dynamic"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtEmailEdit" ErrorMessage="*Must provide an email" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtEmailEdit" runat="server" Text='<%# Bind("custEmail") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("custEmail") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <asp:ObjectDataSource ID="odsCustomers" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaLibrary.CustomerDataSetTableAdapters.CustomerLookupTableAdapter" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="custFirst" Type="String" />
            <asp:Parameter Name="custLast" Type="String" />
            <asp:Parameter Name="custPhone" Type="String" />
            <asp:Parameter Name="custAddress" Type="String" />
            <asp:Parameter Name="custCity" Type="String" />
            <asp:Parameter Name="custPostal" Type="String" />
            <asp:Parameter Name="custEmail" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="custFirst" Type="String" />
            <asp:Parameter Name="custLast" Type="String" />
            <asp:Parameter Name="custPhone" Type="String" />
            <asp:Parameter Name="custAddress" Type="String" />
            <asp:Parameter Name="custCity" Type="String" />
            <asp:Parameter Name="custPostal" Type="String" />
            <asp:Parameter Name="custEmail" Type="String" />
            <asp:Parameter Name="Original_id" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:DetailsView ID="dvCustomer" runat="server" AutoGenerateRows="False" DataKeyNames="id" DataSourceID="odsCustomers" Height="50px" OnDataBound="dvCustomer_DataBound" Width="300px">
        <Fields>
            <asp:TemplateField HeaderText="ID" InsertVisible="False" SortExpression="id">
                <EditItemTemplate>
                    <table cellpadding="0" cellspacing="0" style="margin:5px 0px; border:1px solid #A0A0A0;width:100%;height:100%">
                        <tr>
                            <td style="padding: 2px 4px; height: 17px; font-family: Segoe UI; font-style: normal; font-weight: normal; font-size: 8.830189pt; text-decoration: none; background-color: buttonface; color: #102040; background-image: url(mvwres://Microsoft.Web.Design.Client, Version=15.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a/TemplateHeaderBackground.gif); background-repeat: repeat-x; border-bottom: 1px solid #A0A0A0;">ItemTemplate </td>
                        </tr>
                        <tr style="">
                            <td style="padding:4px;height:50px;vertical-align:top;">
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                            </td>
                        </tr>
                    </table>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="txtNewCustomerID" runat="server" Text='<%# Bind("ID") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="First Name" SortExpression="custFirst">
                <EditItemTemplate>
                    <table cellpadding="0" cellspacing="0" style="margin:5px 0px; border:1px solid #A0A0A0;width:100%;height:100%">
                        <tr>
                            <td style="padding: 2px 4px; height: 17px; font-family: Segoe UI; font-style: normal; font-weight: normal; font-size: 8.830189pt; text-decoration: none; background-color: buttonface; color: #102040; background-image: url(mvwres://Microsoft.Web.Design.Client, Version=15.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a/TemplateHeaderBackground.gif); background-repeat: repeat-x; border-bottom: 1px solid #A0A0A0;">InsertItemTemplate </td>
                        </tr>
                        <tr style="">
                            <td style="padding:4px;height:50px;vertical-align:top;">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFirstName" ErrorMessage="*Must provide first name" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="txtFirstName" runat="server" Text='<%# Bind("custFirst") %>'></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFirstName" ErrorMessage="*Must provide first name" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtFirstName" runat="server" Text='<%# Bind("custFirst") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <span id="idControl">dvCustomer</span> - Field[1] - First Name
                </ItemTemplate>
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Last Name" SortExpression="custLast">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("custLast") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtLastName" ErrorMessage="*Must provide last name" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtLastName" runat="server" Text='<%# Bind("custLast") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("custLast") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Phone" SortExpression="custPhone">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("custPhone") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtPhone" ErrorMessage="*Please enter a 10 digit phone number with no spaces or special characters" ForeColor="Red" ValidationExpression="^[0-9]{10}$" Display="Dynamic"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPhone" ErrorMessage="*Must provide phone number" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtPhone" runat="server" Text='<%# Bind("custPhone") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("custPhone") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Address" SortExpression="custAddress">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("custAddress") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtAddress" ErrorMessage="*Must provide an address" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtAddress" runat="server" Text='<%# Bind("custAddress") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("custAddress") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="City" SortExpression="custCity">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("custCity") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtCity" ErrorMessage="*Must provide a city" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtCity" runat="server" Text='<%# Bind("custCity") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("custCity") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Postal" SortExpression="custPostal">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("custPostal") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtPostal" ErrorMessage="*Please enter a valid Canadian postal code with no spaces or special characters" ForeColor="Red" ValidationExpression="[ABCEGHJKLMNPRSTVXY][0-9][ABCEGHJKLMNPRSTVWXYZ][0-9][ABCEGHJKLMNPRSTVWXYZ][0-9]" Display="Dynamic"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtPostal" ErrorMessage="*Must provide a postal code" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtPostal" runat="server" Text='<%# Bind("custPostal") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("custPostal") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Email" SortExpression="custEmail">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("custEmail") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="*Please enter a valid email address" ForeColor="Red" ValidationExpression="^([a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6})*$" Display="Dynamic"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtEmail" ErrorMessage="*Must provide an email" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtEmail" runat="server" Text='<%# Bind("custEmail") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("custEmail") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateField>
            <asp:CommandField InsertText="Save New" NewText="Add New" ShowInsertButton="True" ButtonType="Button" />
        </Fields>
    </asp:DetailsView>

    <br />
    
</asp:Content>
