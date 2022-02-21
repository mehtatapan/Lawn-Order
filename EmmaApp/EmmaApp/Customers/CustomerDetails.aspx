<%@ Page Title="Custome Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="True" CodeBehind="CustomerDetails.aspx.cs" Inherits="EmmaApp.Customers.CustomerDetails" %>
<%-- Author: Emma Casagrande-Kellam --%>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><asp:Label ID="lblTopHeader" runat="server" Text="Customer Details"></asp:Label></h2>
    <p>
        <asp:DetailsView ID="dvCustomerDetails" runat="server" AutoGenerateRows="False" DataKeyNames="id" DataSourceID="odsCustomerDetails" Height="50px" Width="350px">
            <Fields>
                <asp:TemplateField HeaderText="First Name" SortExpression="custFirst">
                    <EditItemTemplate>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFirstName" ErrorMessage="*Must provide first name" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="txtFirstName" runat="server" Text='<%# Bind("custFirst") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("custFirst") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("custFirst") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle Font-Bold="True" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Last Name" SortExpression="custLast">
                    <EditItemTemplate>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtLastName" ErrorMessage="*Must provide last name" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="txtLastName" runat="server" Text='<%# Bind("custLast") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("custLast") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("custLast") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle Font-Bold="True" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Phone" SortExpression="custPhone">
                    <EditItemTemplate>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtPhone" ErrorMessage="*Please enter a 10 digit phone number with no spaces or special characters" ForeColor="Red" ValidationExpression="^[0-9]{10}$" Display="Dynamic"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPhone" ErrorMessage="*Must provide phone number" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="txtPhone" runat="server" Text='<%# Bind("custPhone") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("custPhone") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("custPhone") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle Font-Bold="True" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Address" SortExpression="custAddress">
                    <EditItemTemplate>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtAddress" ErrorMessage="*Must provide an address" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="txtAddress" runat="server" Text='<%# Bind("custAddress") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("custAddress") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("custAddress") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle Font-Bold="True" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="City" SortExpression="custCity">
                    <EditItemTemplate>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtCity" ErrorMessage="*Must provide a city" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="txtCity" runat="server" Text='<%# Bind("custCity") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("custCity") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("custCity") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle Font-Bold="True" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Postal Code" SortExpression="custPostal">
                    <EditItemTemplate>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtPostalCode" ErrorMessage="*Please enter a valid Canadian postal code in uppercase with no spaces or special characters" ForeColor="Red" ValidationExpression="[ABCEGHJKLMNPRSTVXY][0-9][ABCEGHJKLMNPRSTVWXYZ][0-9][ABCEGHJKLMNPRSTVWXYZ][0-9]" Display="Dynamic"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtPostalCode" ErrorMessage="*Must provide a postal code" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="txtPostalCode" runat="server" Text='<%# Bind("custPostal") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("custPostal") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("custPostal") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle Font-Bold="True" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Email" SortExpression="custEmail">
                    <EditItemTemplate>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtEmail" ErrorMessage="*Please enter a valid email address" ForeColor="Red" ValidationExpression="^([a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6})*$" Display="Dynamic"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtEmail" ErrorMessage="*Must provide an email address" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="txtEmail" runat="server" Text='<%# Bind("custEmail") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("custEmail") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("custEmail") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle Font-Bold="True" />
                </asp:TemplateField>
                <asp:CommandField ShowEditButton="True" ButtonType="Button"/>
            </Fields>
            <EditRowStyle BackColor="#DFF0D8" />
        </asp:DetailsView>
    </p>
    <p>
        <asp:ObjectDataSource ID="odsCustomerDetails" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaLibrary.CustomerDataSetTableAdapters.CustomerDetailsTableAdapter" UpdateMethod="Update">
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
            <SelectParameters>
                <asp:SessionParameter Name="Param1" SessionField="customerID" Type="Int32" />
            </SelectParameters>
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
    </p>
    <h3>Customer&#39;s Equipment</h3>
    <p>
        <asp:GridView ID="gvCustomerEquipment" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="odsEquipment" Width="800px" EmptyDataText="&lt;b&gt;This Customer has no Equipment.&lt;/b&gt;">
            <Columns>
                <asp:BoundField DataField="equModel" HeaderText="Model" SortExpression="equModel" />
                <asp:BoundField DataField="equSerial" HeaderText="Serial Number" SortExpression="equSerial" />
                <asp:TemplateField HeaderText="Equipment Type" SortExpression="equtypeID">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("equtypeID") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="odsEquipmentType" DataTextField="eqtType" DataValueField="id" Enabled="False" SelectedValue='<%# Bind("equtypeID") %>'>
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Manufacturer" SortExpression="equManuID">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("equManuID") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="odsManufacturer" DataTextField="manName" DataValueField="id" Enabled="False" SelectedValue='<%# Bind("equManuID") %>'>
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        </asp:GridView>
    </p>
    <p>
        <asp:ObjectDataSource ID="odsEquipment" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaLibrary.CustomerDataSetTableAdapters.EquipmentTableAdapter" UpdateMethod="Update">
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
            <SelectParameters>
                <asp:SessionParameter Name="Param1" SessionField="customerID" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="equModel" Type="String" />
                <asp:Parameter Name="equSerial" Type="String" />
                <asp:Parameter Name="custID" Type="Int32" />
                <asp:Parameter Name="equtypeID" Type="Int32" />
                <asp:Parameter Name="equManuID" Type="Int32" />
                <asp:Parameter Name="Original_id" Type="Int32" />
            </UpdateParameters>
        </asp:ObjectDataSource>
    </p>
    <p>
        <asp:ObjectDataSource ID="odsEquipmentType" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaLibrary.CustomerDataSetTableAdapters.EquipmentTypeTableAdapter"></asp:ObjectDataSource>
    </p>
    <p>
        <asp:ObjectDataSource ID="odsManufacturer" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaLibrary.CustomerDataSetTableAdapters.ManufacturerTableAdapter"></asp:ObjectDataSource>
    </p>
    <h3>Customer&#39;s Receipts</h3>
    <p>
        <asp:GridView ID="gvCustomerReceipts" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="odsReceipt" EmptyDataText="&lt;b&gt;This Customer has no Receipts.&lt;/b&gt;" Width="800px">
            <Columns>
                <asp:TemplateField HeaderText="Order Number" SortExpression="ordNumber">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ordNumber") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("ordNumber") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="ordDate" HeaderText="Date" SortExpression="ordDate" />
                <asp:CheckBoxField DataField="ordPaid" HeaderText="Paid" SortExpression="ordPaid" />
                <asp:TemplateField HeaderText="Payment Type" SortExpression="paymentID">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("paymentID") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="odsPaymentType" DataTextField="payType" DataValueField="id" Enabled="False" SelectedValue='<%# Bind("paymentID") %>'>
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Employee" SortExpression="empID">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("empID") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="odsEmployee" DataTextField="empFull" DataValueField="id" Enabled="False" SelectedValue='<%# Bind("empID") %>'>
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        </asp:GridView>
    </p>
    <p>
        <asp:ObjectDataSource ID="odsReceipt" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaLibrary.CustomerDataSetTableAdapters.ReceiptTableAdapter" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ordNumber" Type="String" />
                <asp:Parameter Name="ordDate" Type="DateTime" />
                <asp:Parameter Name="ordPaid" Type="Boolean" />
                <asp:Parameter Name="paymentID" Type="Int32" />
                <asp:Parameter Name="custID" Type="Int32" />
                <asp:Parameter Name="empID" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="Param1" SessionField="customerID" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="ordNumber" Type="String" />
                <asp:Parameter Name="ordDate" Type="DateTime" />
                <asp:Parameter Name="ordPaid" Type="Boolean" />
                <asp:Parameter Name="paymentID" Type="Int32" />
                <asp:Parameter Name="custID" Type="Int32" />
                <asp:Parameter Name="empID" Type="Int32" />
                <asp:Parameter Name="Original_id" Type="Int32" />
            </UpdateParameters>
        </asp:ObjectDataSource>
    </p>
    <p>
        <asp:ObjectDataSource ID="odsPaymentType" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaLibrary.CustomerDataSetTableAdapters.PaymentTypeTableAdapter"></asp:ObjectDataSource>
    </p>
    <p>
        <asp:ObjectDataSource ID="odsEmployee" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaLibrary.CustomerDataSetTableAdapters.EmployeeTableAdapter"></asp:ObjectDataSource>
    </p>
    <p>
        <asp:HyperLink ID="lnkBackToCustomers" runat="server" NavigateUrl="~/Customers"><big>Back to Customers</big></asp:HyperLink>
    </p>
</asp:Content>
