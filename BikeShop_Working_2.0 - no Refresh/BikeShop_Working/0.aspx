<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="0.aspx.cs" Inherits="BikeShop_Working.BikeShop" %>
<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">



 <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
      <h2>Add Customer<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2BikeShop2 %>" SelectCommand="SELECT * FROM [Customers]"></asp:SqlDataSource>
</h2>
       <%-- <!-- Add Customer input fields -->
        <!-- ... -->--%>
<asp:Label ID="lblFirstName" runat="server" Text="First Name:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:TextBox ID="txtFirstName" runat="server" BackColor="#CCFFCC" BorderColor="#006600" CssClass="shadow" OnTextChanged="txtFirstName_TextChanged" Width="155px"></asp:TextBox><br />

<asp:Label ID="lblLastName" runat="server" Text="Last Name:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:TextBox ID="txtLastName" runat="server" BackColor="#99FF99" BorderColor="#006600" CssClass="shadow" OnTextChanged="txtLastName_TextChanged" Width="157px"></asp:TextBox><br />

<asp:Label ID="lblCreditCard" runat="server" Text="Credit Card:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:TextBox ID="txtCreditCard" runat="server" BackColor="#CCFFCC" BorderColor="#006600" CssClass="shadow-lg" Width="159px"></asp:TextBox><br />

<asp:Label ID="lblPIN" runat="server" Text="PIN:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:TextBox ID="txtPIN" runat="server" BackColor="#99FF99" BorderColor="#006600" Width="158px"></asp:TextBox><br />

<asp:Label ID="lblPhone" runat="server" Text="Phone:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:TextBox ID="txtPhone" runat="server" BorderColor="#006600" Width="158px"></asp:TextBox><br />

<asp:Label ID="lblEmail" runat="server" Text="Email:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:TextBox ID="txtEmail" runat="server" BackColor="#99FF99" BorderColor="#006600" Width="159px"></asp:TextBox><br />

<asp:Label ID="lblStreet" runat="server" Text="Street:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:TextBox ID="txtStreet" runat="server" BorderColor="#006600" Width="162px"></asp:TextBox><br />

<asp:Label ID="lblCity" runat="server" Text="City:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:TextBox ID="txtCity" runat="server" BackColor="#99FF99" BorderColor="#006600" OnTextChanged="txtCity_TextChanged" Width="163px"></asp:TextBox><br />

<asp:Label ID="lblState" runat="server" Text="State:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:TextBox ID="txtState" runat="server" BorderColor="#006600" OnTextChanged="txtState_TextChanged" Width="165px"></asp:TextBox><br />

<asp:Label ID="lblZipCode" runat="server" Text="Zip Code:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:TextBox ID="txtZipCode" runat="server" BackColor="#99FF99" BorderColor="#006600" Width="167px"></asp:TextBox><br />

      <strong>
      <asp:Label ID="Label4" runat="server" Text="Fill out above form to add a customer..." ForeColor="#003300"></asp:Label>
      </strong>
      <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<asp:Button ID="btnAddCustomer" runat="server" Text="Add Customer" OnClick="btnAddCustomer_Click" CssClass="mb-3" />

        <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" AutoGenerateColumns="False" DataKeyNames="Customer_ID" DataSourceID="SqlDataSource1" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Customer_ID" HeaderText="Customer_ID" InsertVisible="False" ReadOnly="True" SortExpression="Customer_ID" />
                <asp:BoundField DataField="First_Name" HeaderText="First_Name" SortExpression="First_Name" />
                <asp:BoundField DataField="Last_Name" HeaderText="Last_Name" SortExpression="Last_Name" />
                <asp:BoundField DataField="Credit_Card_Encrypted" HeaderText="Credit_Card_Encrypted" SortExpression="Credit_Card_Encrypted" />
                <asp:BoundField DataField="Credit_Card_PIN_Encrypted" HeaderText="Credit_Card_PIN_Encrypted" SortExpression="Credit_Card_PIN_Encrypted" />
                <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="Street" HeaderText="Street" SortExpression="Street" />
                <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                <asp:BoundField DataField="Zip_Code" HeaderText="Zip_Code" SortExpression="Zip_Code" />
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
</asp:GridView>
         </ContentTemplate>
</asp:UpdatePanel>

<asp:UpdatePanel ID="UpdatePanel2" runat="server">
    <ContentTemplate>
        <h2>Add Staff</h2>
        <!-- Add Staff input fields -->
        <!-- ... -->

            First Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtStaffFirstName" runat="server" CssClass="offset-sm-0" BackColor="#FFCC66" BorderColor="#990000" Width="140px" /><br />
            Last Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtStaffLastName" runat="server" BackColor="#FFFF99" BorderColor="Maroon" OnTextChanged="txtStaffLastName_TextChanged" Width="141px" /><br />
            Email:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtStaffEmail" runat="server" BackColor="#FFCC66" BorderColor="Maroon" Width="140px" /><br />
            Phone:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtStaffPhone" runat="server" BackColor="#FFFF99" BorderColor="Maroon" /><br />
            Is Manager: <asp:CheckBox ID="chkIsManager" runat="server" /><br />

        <strong>
      <asp:Label ID="Label9" runat="server" Text="Fill out above form to add a staff member to the coropate registry..." ForeColor="Maroon"></asp:Label>
      </strong>
      <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

        <asp:Button ID="btnAddStaff" runat="server" Text="Add Staff" OnClick="btnAddStaff_Click" />
   
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2BikeShop2 %>" SelectCommand="SELECT * FROM [Staff]"></asp:SqlDataSource>
   
        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Staff_ID" DataSourceID="SqlDataSource4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Staff_ID" HeaderText="Staff_ID" InsertVisible="False" ReadOnly="True" SortExpression="Staff_ID" />
                <asp:BoundField DataField="First_Name" HeaderText="First_Name" SortExpression="First_Name" />
                <asp:BoundField DataField="Last_Name" HeaderText="Last_Name" SortExpression="Last_Name" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                <asp:CheckBoxField DataField="IsManager" HeaderText="IsManager" SortExpression="IsManager" />
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
      </asp:GridView>
    </ContentTemplate>
</asp:UpdatePanel>

<asp:UpdatePanel ID="UpdatePanel3" runat="server">
    <ContentTemplate>

        <h2>Manage Staff<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2BikeShop2 %>" SelectCommand="SELECT [Staff_ID] FROM [Staff]"></asp:SqlDataSource>
      </h2>
        <!-- Manage Staff DropDownList and buttons -->
        <!-- ... -->
        <asp:UpdatePanel ID="UpdatePanel6" runat="server">
    <ContentTemplate>
<asp:DropDownList ID="ddlManagerStaff" runat="server" DataTextField="FullName" DataValueField="Staff_ID" BackColor="#FFFFCC" />
        
        <br />
        <strong>
        <asp:Label ID="Label12" runat="server" ForeColor="Maroon" Text="Choose employee to promote or demote"></asp:Label>
        </strong>
        
        </ContentTemplate>
</asp:UpdatePanel>
<%--<asp:DropDownList ID="ddlManagerStaff" runat="server" DataTextField="Staff_ID" DataValueField="Staff_ID" DataSourceID="SqlDataSource2"></asp:DropDownList><br />--%>
<asp:Button ID="btnPromote" runat="server" Text="Promote" OnClick="btnPromote_Click" BackColor="Lime" />
<asp:Button ID="btnDemote" runat="server" Text="Demote" OnClick="btnDemote_Click" />

        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2BikeShop2 %>" SelectCommand="SELECT * FROM [Staff]"></asp:SqlDataSource>
      <asp:Label ID="Label2" runat="server" Text="..."></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
      <asp:Label ID="Label3" runat="server" Text="..."></asp:Label>
      <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2BikeShop2 %>" SelectCommand="SELECT * FROM [Staff_Store]"></asp:SqlDataSource>
      <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Staff_ID" DataSourceID="SqlDataSource3" ForeColor="#333333" AllowSorting="True" GridLines="None">
          <AlternatingRowStyle BackColor="White" />
          <Columns>
              <asp:BoundField DataField="Staff_ID" HeaderText="Staff_ID" InsertVisible="False" ReadOnly="True" SortExpression="Staff_ID" />
              <asp:BoundField DataField="First_Name" HeaderText="First_Name" SortExpression="First_Name" />
              <asp:BoundField DataField="Last_Name" HeaderText="Last_Name" SortExpression="Last_Name" />
              <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
              <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
              <asp:CheckBoxField DataField="IsManager" HeaderText="IsManager" SortExpression="IsManager" />
          </Columns>
          <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
          <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
          <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
          <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
          <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
          <SortedAscendingCellStyle BackColor="#FDF5AC" />
          <SortedAscendingHeaderStyle BackColor="#4D0000" />
          <SortedDescendingCellStyle BackColor="#FCF6C0" />
          <SortedDescendingHeaderStyle BackColor="#820000" />
      </asp:GridView>

        <asp:GridView ID="GridView8" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource9" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:BoundField DataField="Staff_ID" HeaderText="Staff_ID" SortExpression="Staff_ID" />
                <asp:BoundField DataField="Store_ID" HeaderText="Store_ID" SortExpression="Store_ID" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
      </asp:GridView>
 </ContentTemplate>
</asp:UpdatePanel>


    
<asp:UpdatePanel ID="UpdatePanel4" runat="server">
    <ContentTemplate>

       <h2>Add Store</h2>
   <!-- Add Store input fields -->
   <!-- ... -->

        Store_Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox1" runat="server" BackColor="#666666" BorderColor="#EEEECC" ForeColor="White" OnTextChanged="TextBox1_TextChanged" Width="153px" /><br />
        Phone:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox2" runat="server" BackColor="#666666" BorderColor="#EEEECC" ForeColor="White" Width="155px" /><br />
        Email:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox3" runat="server" BackColor="#666666" BorderColor="#EEEECC" ForeColor="White" Width="157px" /><br />
        Street:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox4" runat="server" BackColor="#666666" BorderColor="#EEEECC" ForeColor="White" Width="158px" /><br />
        City:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox5" runat="server" BackColor="#666666" BorderColor="#EEEECC" ForeColor="White" OnTextChanged="TextBox5_TextChanged" Width="154px" /><br />
        State:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox6" runat="server" BackColor="#666666" BorderColor="#EEEECC" ForeColor="White" Width="156px" /><br />
        Zip_Code:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox7" runat="server" BackColor="#666666" BorderColor="#CCCCCC" ForeColor="White" Width="156px" />
      <br />
        <strong>
        <asp:Label ID="Label1" runat="server" ForeColor="#666666" Text="Fill out above form to add store to corporate registry..."></asp:Label>
        </strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <asp:Button ID="addStore" runat="server" OnClick="addStore_Click" Text="Add Store" />
      <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2BikeShop2 %>" SelectCommand="SELECT * FROM [Stores]"></asp:SqlDataSource>
      <asp:GridView ID="GridView9" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Store_ID" DataSourceID="SqlDataSource10" ForeColor="Black" GridLines="Vertical">
          <AlternatingRowStyle BackColor="White" />
          <Columns>
              <asp:BoundField DataField="Store_ID" HeaderText="Store_ID" InsertVisible="False" ReadOnly="True" SortExpression="Store_ID" />
              <asp:BoundField DataField="Store_Name" HeaderText="Store_Name" SortExpression="Store_Name" />
              <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
              <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
              <asp:BoundField DataField="Street" HeaderText="Street" SortExpression="Street" />
              <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
              <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
              <asp:BoundField DataField="Zip_Code" HeaderText="Zip_Code" SortExpression="Zip_Code" />
          </Columns>
          <FooterStyle BackColor="#CCCC99" />
          <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
          <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
          <RowStyle BackColor="#F7F7DE" />
          <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
          <SortedAscendingCellStyle BackColor="#FBFBF2" />
          <SortedAscendingHeaderStyle BackColor="#848384" />
          <SortedDescendingCellStyle BackColor="#EAEAD3" />
          <SortedDescendingHeaderStyle BackColor="#575357" />
      </asp:GridView>

        </ContentTemplate>
</asp:UpdatePanel>
      <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <br />
      <br />
      <br />
       
 <asp:UpdatePanel ID="UpdatePanel5" runat="server">
    <ContentTemplate>   
    
    <h2>Place Order</h2>
        <!-- Place Order input fields -->
        <!-- ... -->
  
        <div>
            <label>Customer:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="ddlCustomer" runat="server" BackColor="#CCCCCC"></asp:DropDownList>
        </div>
        <div>
            <label>Store:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="ddlStore" runat="server" BackColor="#CCCCCC"></asp:DropDownList>
        </div>
        <div>
            <label>Staff:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="ddlStaff" runat="server" BackColor="#CCCCCC"></asp:DropDownList>
        </div>
        <div>
            <label>Discount:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtDiscount" runat="server" BackColor="#CCCCCC" BorderColor="#000002" ForeColor="Black" Width="78px"></asp:TextBox>
        </div>

        <div>
         <label>Product:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
            <asp:DropDownList ID="ddlProduct" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlProduct_SelectedIndexChanged" BackColor="#CCCCCC"></asp:DropDownList>
        </div>
        <div>
            <label>Quantity:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
            <asp:DropDownList ID="ddlQuantity" runat="server" BackColor="#CCCCCC"></asp:DropDownList>
        </div>
        <div>
            <label>Source Store:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <asp:DropDownList ID="ddlSourceStore" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlSourceStore_SelectedIndexChanged" BackColor="#CCCCCC"></asp:DropDownList>
        </div>
           

        <strong>
        <asp:Label ID="lblMessage" runat="server" ForeColor="#000066">Fill out above form to place an order...</asp:Label>
        </strong>
      <br />

        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

        <asp:Button ID="btnPlaceOrder" runat="server" Text="Place Order" OnClick="btnPlaceOrder_Click" />

    <%--        <asp:Button ID="btnAddItem" runat="server" Text="Add Item" OnClick="btnAddItem_Click" /> < br /> --%>

      <%--<asp:GridView ID="gvOrderItems" runat="server" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FFF1D4" />
            <SortedAscendingHeaderStyle BackColor="#B95C30" />
            <SortedDescendingCellStyle BackColor="#F1E5CE" />
            <SortedDescendingHeaderStyle BackColor="#93451F" />
      </asp:GridView>  --%>

      <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2BikeShop2 %>" SelectCommand="SELECT * FROM [Orders]"></asp:SqlDataSource>
      <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2BikeShop2 %>" SelectCommand="SELECT * FROM [Order_Items]"></asp:SqlDataSource>
      <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2BikeShop2 %>" SelectCommand="SELECT * FROM [Stock]"></asp:SqlDataSource>
      <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2BikeShop2 %>" SelectCommand="SELECT * FROM [Products]"></asp:SqlDataSource>
      <asp:Label ID="Label5" runat="server" Text="Label">The Bike Shop Order Form</asp:Label>
      <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" DataKeyNames="Order_ID" DataSourceID="SqlDataSource5" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
          <AlternatingRowStyle BackColor="#DCDCDC" />
          <Columns>
              <asp:BoundField DataField="Order_ID" HeaderText="Order_ID" InsertVisible="False" ReadOnly="True" SortExpression="Order_ID" />
              <asp:BoundField DataField="Customer_ID" HeaderText="Customer_ID" SortExpression="Customer_ID" />
              <asp:BoundField DataField="Staff_ID" HeaderText="Staff_ID" SortExpression="Staff_ID" />
              <asp:BoundField DataField="Store_ID" HeaderText="Store_ID" SortExpression="Store_ID" />
              <asp:BoundField DataField="Order_Date" HeaderText="Order_Date" SortExpression="Order_Date" />
              <asp:BoundField DataField="Discount" HeaderText="Discount" SortExpression="Discount" />
          </Columns>
          <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
          <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
          <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
          <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
          <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
          <SortedAscendingCellStyle BackColor="#F1F1F1" />
          <SortedAscendingHeaderStyle BackColor="#0000A9" />
          <SortedDescendingCellStyle BackColor="#CAC9C9" />
          <SortedDescendingHeaderStyle BackColor="#000065" />
      </asp:GridView>
      <asp:Label ID="Label6" runat="server" Text="Label">Orders</asp:Label>
      <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" DataKeyNames="Order_Item_ID" DataSourceID="SqlDataSource6" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
          <AlternatingRowStyle BackColor="#DCDCDC" />
          <Columns>
              <asp:BoundField DataField="Order_Item_ID" HeaderText="Order_Item_ID" InsertVisible="False" ReadOnly="True" SortExpression="Order_Item_ID" />
              <asp:BoundField DataField="Order_ID" HeaderText="Order_ID" SortExpression="Order_ID" />
              <asp:BoundField DataField="Product_ID" HeaderText="Product_ID" SortExpression="Product_ID" />
              <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
              <asp:BoundField DataField="Source_Store_ID" HeaderText="Source_Store_ID" SortExpression="Source_Store_ID" />
          </Columns>
          <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
          <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
          <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
          <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
          <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
          <SortedAscendingCellStyle BackColor="#F1F1F1" />
          <SortedAscendingHeaderStyle BackColor="#0000A9" />
          <SortedDescendingCellStyle BackColor="#CAC9C9" />
          <SortedDescendingHeaderStyle BackColor="#000065" />
      </asp:GridView>
      <asp:Label ID="Label7" runat="server" Text="Label">Stock</asp:Label>
      <asp:GridView ID="GridView6" runat="server" AutoGenerateColumns="False" DataKeyNames="Stock_ID" DataSourceID="SqlDataSource7" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
          <AlternatingRowStyle BackColor="#DCDCDC" />
          <Columns>
              <asp:BoundField DataField="Stock_ID" HeaderText="Stock_ID" InsertVisible="False" ReadOnly="True" SortExpression="Stock_ID" />
              <asp:BoundField DataField="Store_ID" HeaderText="Store_ID" SortExpression="Store_ID" />
              <asp:BoundField DataField="Product_ID" HeaderText="Product_ID" SortExpression="Product_ID" />
              <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
          </Columns>
          <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
          <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
          <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
          <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
          <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
          <SortedAscendingCellStyle BackColor="#F1F1F1" />
          <SortedAscendingHeaderStyle BackColor="#0000A9" />
          <SortedDescendingCellStyle BackColor="#CAC9C9" />
          <SortedDescendingHeaderStyle BackColor="#000065" />
      </asp:GridView>
      <asp:Label ID="Label8" runat="server" Text="Label">Products...</asp:Label>
      <asp:GridView ID="GridView7" runat="server" AutoGenerateColumns="False" DataKeyNames="Product_ID" DataSourceID="SqlDataSource8" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None">
          <AlternatingRowStyle BackColor="PaleGoldenrod" />
          <Columns>
              <asp:BoundField DataField="Product_ID" HeaderText="Product_ID" InsertVisible="False" ReadOnly="True" SortExpression="Product_ID" />
              <asp:BoundField DataField="Product_Name" HeaderText="Product_Name" SortExpression="Product_Name" />
              <asp:BoundField DataField="Brand_ID" HeaderText="Brand_ID" SortExpression="Brand_ID" />
              <asp:BoundField DataField="Category_ID" HeaderText="Category_ID" SortExpression="Category_ID" />
              <asp:BoundField DataField="Model_Year" HeaderText="Model_Year" SortExpression="Model_Year" />
              <asp:BoundField DataField="List_Price" HeaderText="List_Price" SortExpression="List_Price" />
          </Columns>
          <FooterStyle BackColor="Tan" />
          <HeaderStyle BackColor="Tan" Font-Bold="True" />
          <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
          <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
          <SortedAscendingCellStyle BackColor="#FAFAE7" />
          <SortedAscendingHeaderStyle BackColor="#DAC09E" />
          <SortedDescendingCellStyle BackColor="#E1DB9C" />
          <SortedDescendingHeaderStyle BackColor="#C2A47B" />
      </asp:GridView>

         <asp:Label ID="Label11" runat="server" Text="Label">Bike Brands</asp:Label>
    <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2BikeShop2 %>" SelectCommand="SELECT * FROM [Bike_Brands]"></asp:SqlDataSource>
    <asp:GridView ID="GridView10" runat="server" AutoGenerateColumns="False" CellPadding="3" DataKeyNames="Brand_ID" DataSourceID="SqlDataSource11" ForeColor="Black" GridLines="Vertical" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:BoundField DataField="Brand_ID" HeaderText="Brand_ID" InsertVisible="False" ReadOnly="True" SortExpression="Brand_ID" />
            <asp:BoundField DataField="Brand_Name" HeaderText="Brand_Name" SortExpression="Brand_Name" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
     <asp:Label ID="Label10" runat="server" Text="Label">Bike Categories</asp:Label>
    <asp:SqlDataSource ID="SqlDataSource12" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2BikeShop2 %>" SelectCommand="SELECT * FROM [Bike_Categories]"></asp:SqlDataSource>
    <asp:GridView ID="GridView11" runat="server" AutoGenerateColumns="False" CellPadding="3" DataKeyNames="Category_ID" DataSourceID="SqlDataSource12" ForeColor="Black" GridLines="Vertical" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:BoundField DataField="Category_ID" HeaderText="Category_ID" InsertVisible="False" ReadOnly="True" SortExpression="Category_ID" />
            <asp:BoundField DataField="Category_Name" HeaderText="Category_Name" SortExpression="Category_Name" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>

        </ContentTemplate>
</asp:UpdatePanel>
</asp:Content>
