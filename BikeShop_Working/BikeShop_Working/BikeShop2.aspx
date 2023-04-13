<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BikeShop2.aspx.cs" Inherits="BikeShop_Working.BikeShop2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Label ID="lblFirstName" runat="server" Text="First Name:"></asp:Label>
<asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox><br />

<asp:Label ID="lblLastName" runat="server" Text="Last Name:"></asp:Label>
<asp:TextBox ID="txtLastName" runat="server"></asp:TextBox><br />

<asp:Label ID="lblCreditCard" runat="server" Text="Credit Card:"></asp:Label>
<asp:TextBox ID="txtCreditCard" runat="server"></asp:TextBox><br />

<asp:Label ID="lblPIN" runat="server" Text="PIN:"></asp:Label>
<asp:TextBox ID="txtPIN" runat="server"></asp:TextBox><br />

<asp:Label ID="lblPhone" runat="server" Text="Phone:"></asp:Label>
<asp:TextBox ID="txtPhone" runat="server"></asp:TextBox><br />

<asp:Label ID="lblEmail" runat="server" Text="Email:"></asp:Label>
<asp:TextBox ID="txtEmail" runat="server"></asp:TextBox><br />

<asp:Label ID="lblStreet" runat="server" Text="Street:"></asp:Label>
<asp:TextBox ID="txtStreet" runat="server"></asp:TextBox><br />

<asp:Label ID="lblCity" runat="server" Text="City:"></asp:Label>
<asp:TextBox ID="txtCity" runat="server"></asp:TextBox><br />

<asp:Label ID="lblState" runat="server" Text="State:"></asp:Label>
<asp:TextBox ID="txtState" runat="server"></asp:TextBox><br />

<asp:Label ID="lblZipCode" runat="server" Text="Zip Code:"></asp:Label>
<asp:TextBox ID="txtZipCode" runat="server"></asp:TextBox><br />

<asp:Button ID="btnAddCustomer" runat="server" Text="Add Customer" OnClick="btnAddCustomer_Click" />

</asp:Content>
