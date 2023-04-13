<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BikeShopTest.aspx.cs" Inherits="BikeShop_Working.BikeShopTest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <table id="table1" style="width: 100%; border: 1px solid #800000">
        <tr>
            <td colspan="4"><strong>Bike Form</strong></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">&nbsp;</td>
            <td class="w-50"><strong>Store Pulldown:</strong></td>
            <td style="width: 15%">
                Choose by Store ID:</td>
            <td style="width: 13%">
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource9" DataTextField="Store_Name" DataValueField="Store_Name">
                </asp:DropDownList>
            </td>
            <td style="width: 23%">
                &nbsp;</td>
            <td style="width: 23%">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">&nbsp;</td>
            <td class="w-50"><strong>Staff Pulldown:</strong></td>
            <td style="width: 15%">
                Choose by Staff ID:</td>
            <td style="width: 13%">
                <asp:DropDownList ID="DropDownList2" runat="server" Width="85px">
                </asp:DropDownList>
            </td>
            <td style="width: 23%">
                &nbsp;</td>
            <td style="width: 23%">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%; height: 27px">&nbsp;</td>
            <td style="width: 50%; height: 27px">
                <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Store_Name] FROM [Store]"></asp:SqlDataSource>
            </td>
            <td style="width: 15%; height: 27px"></td>
            <td style="width: 13%; height: 27px">
                &nbsp;</td>
            <td style="width: 23%; height: 27px">
                &nbsp;</td>
            <td style="width: 23%; height: 27px">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">&nbsp;</td>
            <td class="w-50">
                <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Staff_FirstName], [Staff_LastName] FROM [Staff]"></asp:SqlDataSource>
            </td>
            <td style="width: 15%">&nbsp;</td>
            <td style="width: 13%">
                &nbsp;</td>
            <td style="width: 23%">
                &nbsp;</td>
            <td style="width: 23%">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%; height: 21px">&nbsp;</td>
            <td style="width: 50%; height: 21px"></td>
            <td style="width: 15%; height: 21px"></td>
            <td style="width: 13%; height: 21px">
            </td>
            <td style="width: 23%; height: 21px">
                &nbsp;</td>
            <td style="width: 23%; height: 21px">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%; height: 21px">&nbsp;</td>
            <td style="width: 50%; height: 21px"></td>
            <td style="width: 15%; height: 21px"></td>
            <td style="width: 13%; height: 21px">
            </td>
            <td style="width: 23%; height: 21px">
                &nbsp;</td>
            <td style="width: 23%; height: 21px">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">&nbsp;</td>
            <td class="w-50"><strong>Discount:</strong></td>
            <td style="width: 15%">&nbsp;</td>
            <td style="width: 13%">
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            </td>
            <td style="width: 23%">
                &nbsp;</td>
            <td style="width: 23%">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">&nbsp;</td>
            <td class="w-50"><strong>First Name:</strong></td>
            <td style="width: 15%">&nbsp;</td>
            <td style="width: 13%">
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </td>
            <td style="width: 23%">
                &nbsp;</td>
            <td style="width: 23%">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">&nbsp;</td>
            <td class="w-50"><strong>Last Name:</strong></td>
            <td style="width: 15%">&nbsp;</td>
            <td style="width: 13%">
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            </td>
            <td style="width: 23%">
                &nbsp;</td>
            <td style="width: 23%">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">&nbsp;</td>
            <td class="w-50"><strong>Full Name:</strong></td>
            <td style="width: 15%">&nbsp;</td>
            <td style="width: 13%">
                <asp:TextBox ID="TextBox20" runat="server"></asp:TextBox>
            </td>
            <td style="width: 23%">
                &nbsp;</td>
            <td style="width: 23%">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">&nbsp;</td>
            <td class="w-50"><strong>Bike Name:</strong></td>
            <td style="width: 15%">
                <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Bike_Name] FROM [Bike_Name]"></asp:SqlDataSource>
            </td>
            <td style="width: 13%">
                <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource11" DataTextField="Bike_Name" DataValueField="Bike_Name">
                </asp:DropDownList>
            </td>
            <td style="width: 23%">
                &nbsp;</td>
            <td style="width: 23%">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">&nbsp;</td>
            <td class="w-50"><strong>Qty:</strong></td>
            <td style="width: 15%">&nbsp;</td>
            <td style="width: 13%">
                <asp:DropDownList ID="DropDownList4" runat="server">
                </asp:DropDownList>
            </td>
            <td style="width: 23%">
                &nbsp;</td>
            <td style="width: 23%">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">&nbsp;</td>
            <td class="w-50"><strong>Store Name:</strong></td>
            <td style="width: 15%">
                <asp:SqlDataSource ID="SqlDataSource12" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Store_Name] FROM [Store]"></asp:SqlDataSource>
            </td>
            <td style="width: 13%">
                <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="SqlDataSource12" DataTextField="Store_Name" DataValueField="Store_Name">
                </asp:DropDownList>
            </td>
            <td style="width: 23%">
                &nbsp;</td>
            <td style="width: 23%">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%; height: 33px;" class="w-25">
            </td>
            <td style="width: 50%; height: 33px;">
                &nbsp;</td>
            <td style="width: 15%; height: 33px;">
                <asp:Button ID="Button1" runat="server" Text="Submit Bike Form" OnClick="Button1_Click" />
                </td>
            <td style="width: 13%; height: 33px;"></td>
            <td style="width: 23%; height: 33px;"></td>
            <td style="width: 23%; height: 33px;"></td>
        </tr>
        <tr>
            <td colspan="4"><strong>Business Page / Inventory Page</strong></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">&nbsp;</td>
            <td class="w-50"><strong>Staff:</strong></td>
            <td style="width: 15%">First Name:</td>
            <td style="width: 13%">
                <asp:TextBox ID="TextBox4" runat="server" CssClass="accordion-header" ></asp:TextBox>
            </td>
            <td style="width: 23%">
                &nbsp;</td>
            <td style="width: 23%">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">&nbsp;</td>
            <td class="w-50">&nbsp;</td>
            <td style="width: 15%">Last Name:</td>
            <td style="width: 13%">
                <asp:TextBox ID="TextBox12" runat="server"></asp:TextBox>
            </td>
            <td style="width: 23%">
                &nbsp;</td>
            <td style="width: 23%">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">
                &nbsp;</td>
            <td class="w-50">
                &nbsp;</td>
            <td style="width: 15%">
                <asp:Button ID="Button_Staff" runat="server" Text="Insert" OnClick="Button_Staff_Click" />
            </td>
            <td style="width: 13%">&nbsp;</td>
            <td style="width: 23%">&nbsp;</td>
            <td style="width: 23%">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">
                &nbsp;</td>
            <td class="w-50">
                &nbsp;</td>
            <td style="width: 15%">
                &nbsp;</td>
            <td style="width: 13%">&nbsp;</td>
            <td style="width: 23%">&nbsp;</td>
            <td style="width: 23%">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">&nbsp;</td>
            <td class="w-50"><strong>Manager Switch:</strong></td>
            <td style="width: 15%">Staff ID:</td>
            <td style="width: 13%">
                <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
            </td>
            <td style="width: 23%">
                &nbsp;</td>
            <td style="width: 23%">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">
                &nbsp;</td>
            <td class="w-50">
                //needs boolean column in staff table<br />
                //isManager bit 0=false 1 = true<br />
                //needs demote button promote and demote just switch true and false</td>
            <td style="width: 15%">
                <asp:Button ID="Button3" runat="server" Text="Promote" />
            </td>
            <td style="width: 13%">
                <asp:Button ID="Button12" runat="server" Text="Demote" />
            </td>
            <td style="width: 23%">&nbsp;</td>
            <td style="width: 23%">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">
                &nbsp;</td>
            <td class="w-50">
                &nbsp;</td>
            <td style="width: 15%">
                &nbsp;</td>
            <td style="width: 13%">&nbsp;</td>
            <td style="width: 23%">&nbsp;</td>
            <td style="width: 23%">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">&nbsp;</td>
            <td class="w-50"><strong>Customer:</strong></td>
            <td style="width: 15%">First Name:</td>
            <td style="width: 13%">
                <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
            </td>
            <td style="width: 23%">
                &nbsp;</td>
            <td style="width: 23%">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">&nbsp;</td>
            <td class="w-50">//needs update delete</td>
            <td style="width: 15%">Last Name:</td>
            <td style="width: 13%">
                <asp:TextBox ID="TextBox13" runat="server"></asp:TextBox>
            </td>
            <td style="width: 23%">
                &nbsp;</td>
            <td style="width: 23%">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">&nbsp;</td>
            <td class="w-50">&nbsp;</td>
            <td style="width: 15%">Credit Card</td>
            <td style="width: 13%">
                <asp:TextBox ID="TextBox14" runat="server"></asp:TextBox>
            </td>
            <td style="width: 23%">
                &nbsp;</td>
            <td style="width: 23%">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">&nbsp;</td>
            <td class="w-50">&nbsp;</td>
            <td style="width: 15%">Pin</td>
            <td style="width: 13%">
                <asp:TextBox ID="TextBox15" runat="server"></asp:TextBox>
            </td>
            <td style="width: 23%">
                &nbsp;</td>
            <td style="width: 23%">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">&nbsp;</td>
            <td class="w-50">&nbsp;</td>
            <td style="width: 15%">
                <asp:Button ID="Button_Customer" runat="server" Text="Insert" OnClick="Button_Customer_Click" />
            </td>
            <td style="width: 13%">
                &nbsp;</td>
            <td style="width: 23%">
                &nbsp;</td>
            <td style="width: 23%">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">&nbsp;</td>
            <td class="w-50">&nbsp;</td>
            <td style="width: 15%">&nbsp;</td>
            <td style="width: 13%">
                &nbsp;</td>
            <td style="width: 23%">
                &nbsp;</td>
            <td style="width: 23%">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">
                &nbsp;</td>
            <td class="w-50">
                &nbsp;</td>
            <td style="width: 15%">
                &nbsp;</td>
            <td style="width: 13%">&nbsp;</td>
            <td style="width: 23%">&nbsp;</td>
            <td style="width: 23%">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%; height: 22px;">&nbsp;</td>
            <td style="width: 50%; height: 22px;"><strong>Inventory:</strong></td>
            <td style="width: 15%; height: 22px;">Store ID:</td>
            <td style="width: 13%; height: 22px;">
                &lt;DropDown&gt;</td>
            <td style="width: 23%; height: 22px;">
            </td>
            <td style="width: 23%; height: 22px;">
            </td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">
                &nbsp;</td>
            <td class="w-50">
                //need to fix inventory at database level, Store table needs Bike_Name_ID foriegn key and a Quantity column<br />
                //needs update delete and insert</td>
            <td style="width: 15%">
                Bike_ID:</td>
            <td style="width: 13%">&lt;DropDown&gt;</td>
            <td style="width: 23%">&nbsp;</td>
            <td style="width: 23%">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">
                &nbsp;</td>
            <td class="w-50">
                &nbsp;</td>
            <td style="width: 15%">
                Qty:</td>
            <td style="width: 13%">
                <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
            </td>
            <td style="width: 23%">&nbsp;</td>
            <td style="width: 23%">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">
                &nbsp;</td>
            <td class="w-50">
                &nbsp;</td>
            <td style="width: 15%">
                <asp:Button ID="Button5" runat="server" Text="Insert" />
            </td>
            <td style="width: 13%">&nbsp;</td>
            <td style="width: 23%">&nbsp;</td>
            <td style="width: 23%">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">
                &nbsp;</td>
            <td class="w-50">
                &nbsp;</td>
            <td style="width: 15%">
                &nbsp;</td>
            <td style="width: 13%">&nbsp;</td>
            <td style="width: 23%">&nbsp;</td>
            <td style="width: 23%">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">&nbsp;</td>
            <td class="w-50"><strong>Store:</strong></td>
            <td style="width: 15%">Store Name:</td>
            <td style="width: 13%">
                <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
            </td>
            <td style="width: 23%">
                &nbsp;</td>
            <td style="width: 23%">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">&nbsp;</td>
            <td class="w-50">//Needs to add address column to store table</td>
            <td style="width: 15%">Store Phone:</td>
            <td style="width: 13%">
                <asp:TextBox ID="TextBox16" runat="server"></asp:TextBox>
            </td>
            <td style="width: 23%">
                &nbsp;</td>
            <td style="width: 23%">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">&nbsp;</td>
            <td class="w-50">&nbsp;</td>
            <td style="width: 15%">Store ID:</td>
            <td style="width: 13%">
                <asp:TextBox ID="TextBox19" runat="server"></asp:TextBox>
            </td>
            <td style="width: 23%">
                &nbsp;</td>
            <td style="width: 23%">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">&nbsp;</td>
            <td class="w-50">&nbsp;</td>
            <td style="width: 15%">Store Address:</td>
            <td style="width: 13%">
                &lt;Text Box&gt;</td>
            <td style="width: 23%">
                &nbsp;</td>
            <td style="width: 23%">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">&nbsp;</td>
            <td class="w-50">&nbsp;</td>
            <td style="width: 15%">&nbsp;</td>
            <td style="width: 13%">
                &nbsp;</td>
            <td style="width: 23%">
                &nbsp;</td>
            <td style="width: 23%">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">&nbsp;</td>
            <td class="w-50">&nbsp;</td>
            <td style="width: 15%">&nbsp;</td>
            <td style="width: 13%">
                &nbsp;</td>
            <td style="width: 23%">
                &nbsp;</td>
            <td style="width: 23%">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">&nbsp;</td>
            <td class="w-50">&nbsp;</td>
            <td style="width: 15%">&nbsp;</td>
            <td style="width: 13%">
                &nbsp;</td>
            <td style="width: 23%">
                &nbsp;</td>
            <td style="width: 23%">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">&nbsp;</td>
            <td class="w-50">&nbsp;</td>
            <td style="width: 15%">&nbsp;</td>
            <td style="width: 13%">
                &nbsp;</td>
            <td style="width: 23%">
                &nbsp;</td>
            <td style="width: 23%">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">&nbsp;</td>
            <td class="w-50">&nbsp;</td>
            <td style="width: 15%">&nbsp;</td>
            <td style="width: 13%">
                &nbsp;</td>
            <td style="width: 23%">
                &nbsp;</td>
            <td style="width: 23%">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">&nbsp;</td>
            <td class="w-50">&nbsp;</td>
            <td style="width: 15%">&nbsp;</td>
            <td style="width: 13%">
                &nbsp;</td>
            <td style="width: 23%">
                &nbsp;</td>
            <td style="width: 23%">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">&nbsp;</td>
            <td class="w-50">&nbsp;</td>
            <td style="width: 15%">&nbsp;</td>
            <td style="width: 13%">
                &nbsp;</td>
            <td style="width: 23%">
                &nbsp;</td>
            <td style="width: 23%">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">&nbsp;</td>
            <td class="w-50">&nbsp;</td>
            <td style="width: 15%">&nbsp;</td>
            <td style="width: 13%">
                &nbsp;</td>
            <td style="width: 23%">
                &nbsp;</td>
            <td style="width: 23%">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">&nbsp;</td>
            <td class="w-50">&nbsp;</td>
            <td style="width: 15%">&nbsp;</td>
            <td style="width: 13%">
                &nbsp;</td>
            <td style="width: 23%">
                &nbsp;</td>
            <td style="width: 23%">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">&nbsp;</td>
            <td class="w-50">&nbsp;</td>
            <td style="width: 15%">&nbsp;</td>
            <td style="width: 13%">
                &nbsp;</td>
            <td style="width: 23%">
                &nbsp;</td>
            <td style="width: 23%">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">&nbsp;</td>
            <td class="w-50">&nbsp;</td>
            <td style="width: 15%">&nbsp;</td>
            <td style="width: 13%">
                &nbsp;</td>
            <td style="width: 23%">
                &nbsp;</td>
            <td style="width: 23%">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">
                &nbsp;</td>
            <td class="w-50">
                &nbsp;</td>
            <td style="width: 15%">
                <asp:Button ID="Button6" runat="server" Text="Insert" OnClick="Button6_Click" />
            </td>
            <td style="width: 13%">
                <asp:Button ID="Button10" runat="server" OnClick="Button10_Click" Text="Update" />
            </td>
            <td style="width: 23%">
                <asp:Button ID="Button11" runat="server" OnClick="Button11_Click" Text="Delete" />
            </td>
            <td style="width: 23%">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">
                &nbsp;</td>
            <td class="w-50">
                &nbsp;</td>
            <td style="width: 15%">
                &nbsp;</td>
            <td style="width: 13%">&nbsp;</td>
            <td style="width: 23%">&nbsp;</td>
            <td style="width: 23%">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">&nbsp;</td>
            <td class="w-50"><strong>Bike Name:</strong></td>
            <td style="width: 15%">Bike Name:</td>
            <td style="width: 13%">
                <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
            </td>
            <td style="width: 23%">
                &nbsp;</td>
            <td style="width: 23%">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%; height: 27px;">&nbsp;</td>
            <td style="width: 50%; height: 27px;">
                //needs update delete</td>
            <td style="width: 15%; height: 27px;">Bike Brand ID:</td>
            <td style="width: 13%; height: 27px;">
                <asp:DropDownList ID="DropDownList6" runat="server" DataSourceID="SqlDataSource13" DataTextField="Bike_Brand_ID" DataValueField="Bike_Brand_ID">
                </asp:DropDownList>
            </td>
            <td style="width: 23%; height: 27px;">
                &nbsp;</td>
            <td style="width: 23%; height: 27px;">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">&nbsp;</td>
            <td class="w-50">
                <asp:SqlDataSource ID="SqlDataSource13" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Bike_Brand_ID] FROM [Bike_Brand]"></asp:SqlDataSource>
            </td>
            <td style="width: 15%">Bike Year:</td>
            <td style="width: 13%">
                <asp:TextBox ID="TextBox17" runat="server"></asp:TextBox>
            </td>
            <td style="width: 23%">
                &nbsp;</td>
            <td style="width: 23%">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">&nbsp;</td>
            <td class="w-50">&nbsp;</td>
            <td style="width: 15%">Bike Price:</td>
            <td style="width: 13%">
                <asp:TextBox ID="TextBox18" runat="server"></asp:TextBox>
            </td>
            <td style="width: 23%">
                &nbsp;</td>
            <td style="width: 23%">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">
                &nbsp;</td>
            <td class="w-50">
                &nbsp;</td>
            <td style="width: 15%">
                <asp:Button ID="Button7" runat="server" Text="Insert" OnClick="Button7_Click" />
            </td>
            <td style="width: 13%">
                &nbsp;</td>
            <td style="width: 23%">
                &nbsp;</td>
            <td style="width: 23%">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">&nbsp;</td>
            <td class="w-50">&nbsp;</td>
            <td style="width: 15%">&nbsp;</td>
            <td style="width: 13%">
                &nbsp;</td>
            <td style="width: 23%">
                &nbsp;</td>
            <td style="width: 23%">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">&nbsp;</td>
            <td class="w-50"><strong>Bike Catagory:</strong></td>
            <td style="width: 15%">Bike Catagory:</td>
            <td style="width: 13%">
                <asp:TextBox ID="TextBox10" runat="server"></asp:TextBox>
            </td>
            <td style="width: 23%">
                &nbsp;</td>
            <td style="width: 23%">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">
                &nbsp;</td>
            <td class="w-50">
                //needs update delete</td>
            <td style="width: 15%">
                <asp:Button ID="Button_Catagory" runat="server" Text="Insert" OnClick="Button_Catagory_Click" />
            </td>
            <td style="width: 13%">&nbsp;</td>
            <td style="width: 23%">&nbsp;</td>
            <td style="width: 23%">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">
                &nbsp;</td>
            <td class="w-50">
                &nbsp;</td>
            <td style="width: 15%">
                &nbsp;</td>
            <td style="width: 13%">&nbsp;</td>
            <td style="width: 23%">&nbsp;</td>
            <td style="width: 23%">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">&nbsp;</td>
            <td class="w-50"><strong>Bike Brand:</strong></td>
            <td style="width: 15%">Bike Brand</td>
            <td style="width: 13%">
                <asp:TextBox ID="TextBox11" runat="server"></asp:TextBox>
            </td>
            <td style="width: 23%">
                &nbsp;</td>
            <td style="width: 23%">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">
                &nbsp;</td>
            <td class="w-50">
                //needs update delete</td>
            <td style="width: 15%">
                <asp:Button ID="Button9" runat="server" Text="Insert" OnClick="Button9_Click" />
            </td>
            <td style="width: 13%">&nbsp;</td>
            <td style="width: 23%">&nbsp;</td>
            <td style="width: 23%">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">
                &nbsp;</td>
            <td class="w-50">
                &nbsp;</td>
            <td style="width: 15%">
                &nbsp;</td>
            <td style="width: 13%">&nbsp;</td>
            <td style="width: 23%">&nbsp;</td>
            <td style="width: 23%">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">
                &nbsp;</td>
            <td class="w-50">
                &nbsp;</td>
            <td style="width: 15%">
                Table:</td>
            <td style="width: 13%">Reseed Value:</td>
            <td style="width: 23%">&nbsp;</td>
            <td style="width: 23%">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">
                reseed identity</td>
            <td class="w-50">
                enter table and reseed value</td>
            <td style="width: 15%">
                <asp:TextBox ID="TextBox21" runat="server" Width="128px"></asp:TextBox>
            </td>
            <td style="width: 13%">
                <asp:TextBox ID="TextBox22" runat="server"></asp:TextBox>
            </td>
            <td style="width: 23%">&nbsp;</td>
            <td style="width: 23%">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">
                &nbsp;</td>
            <td class="w-50">
                &nbsp;</td>
            <td style="width: 15%">
                <asp:Button ID="Button13" runat="server" OnClick="Button13_Click" Text="Reseed" />
            </td>
            <td style="width: 13%">&nbsp;</td>
            <td style="width: 23%">&nbsp;</td>
            <td style="width: 23%">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">
                &nbsp;</td>
            <td class="w-50">
                &nbsp;</td>
            <td style="width: 15%">
                &nbsp;</td>
            <td style="width: 13%">&nbsp;</td>
            <td style="width: 23%">&nbsp;</td>
            <td style="width: 23%">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="6">
                Display Tables Live:</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">
                &nbsp;</td>
            <td class="w-50">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" OnSelecting="SqlDataSource1_Selecting" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Bike_Brand]"></asp:SqlDataSource>
            </td>
            <td style="width: 15%">
                &nbsp;</td>
            <td style="width: 13%">&nbsp;</td>
            <td style="width: 23%">&nbsp;</td>
            <td style="width: 23%">&nbsp;</td>
        </tr>
        <tr>
            <td style="height: 21px; width: 11%">
                &nbsp;</td>
            <td style="height: 21px; width: 50%">
                <asp:Label ID="Label1" runat="server" Text="Bike Brand"></asp:Label>
            </td>
            <td style="height: 21px; width: 15%">&nbsp;</td>
            <td style="height: 21px; width: 13%"></td>
            <td style="height: 21px; width: 23%">&nbsp;</td>
            <td style="height: 21px; width: 23%">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">
                &nbsp;</td>
            <td class="w-50">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Bike_Brand_ID" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="Bike_Brand_ID" HeaderText="Bike_Brand_ID" InsertVisible="False" ReadOnly="True" SortExpression="Bike_Brand_ID" />
                        <asp:BoundField DataField="Bike_Brand_Name" HeaderText="Bike_Brand_Name" SortExpression="Bike_Brand_Name" />
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
            </td>
            <td style="width: 15%">&nbsp;</td>
            <td style="width: 13%">&nbsp;</td>
            <td style="width: 23%">&nbsp;</td>
            <td style="width: 23%">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">
                &nbsp;</td>
            <td class="w-50">
                <asp:Label ID="Label2" runat="server" Text="Bike Catagory"></asp:Label>
            </td>
            <td style="width: 15%">&nbsp;</td>
            <td style="width: 13%">&nbsp;</td>
            <td style="width: 23%">&nbsp;</td>
            <td style="width: 23%">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">
                &nbsp;</td>
            <td class="w-50">
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Bike_Catagory]"></asp:SqlDataSource>
            </td>
            <td style="width: 15%">&nbsp;</td>
            <td style="width: 13%">&nbsp;</td>
            <td style="width: 23%">&nbsp;</td>
            <td style="width: 23%">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">
                &nbsp;</td>
            <td class="w-50">
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="Bike_Catagory_ID" DataSourceID="SqlDataSource2" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="Bike_Catagory_ID" HeaderText="Bike_Catagory_ID" InsertVisible="False" ReadOnly="True" SortExpression="Bike_Catagory_ID" />
                        <asp:BoundField DataField="Bike_Catagory_Name" HeaderText="Bike_Catagory_Name" SortExpression="Bike_Catagory_Name" />
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
            </td>
            <td style="width: 15%">&nbsp;</td>
            <td style="width: 13%">&nbsp;</td>
            <td style="width: 23%">&nbsp;</td>
            <td style="width: 23%">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">
                &nbsp;</td>
            <td class="w-50">
                <asp:Label ID="Label3" runat="server" Text="Bike Name"></asp:Label>
            </td>
            <td style="width: 15%">&nbsp;</td>
            <td style="width: 13%">&nbsp;</td>
            <td style="width: 23%">&nbsp;</td>
            <td style="width: 23%">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">
                &nbsp;</td>
            <td class="w-50">
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Bike_Name]"></asp:SqlDataSource>
            </td>
            <td style="width: 15%">&nbsp;</td>
            <td style="width: 13%">&nbsp;</td>
            <td style="width: 23%">&nbsp;</td>
            <td style="width: 23%">&nbsp;</td>
        </tr>
        <tr>
            <td style="height: 21px; width: 11%">
                &nbsp;</td>
            <td style="height: 21px; width: 50%">
                <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="Bike_Name_ID" DataSourceID="SqlDataSource3" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="Bike_Name_ID" HeaderText="Bike_Name_ID" InsertVisible="False" ReadOnly="True" SortExpression="Bike_Name_ID" />
                        <asp:BoundField DataField="Bike_Name" HeaderText="Bike_Name" SortExpression="Bike_Name" />
                        <asp:BoundField DataField="Bike_Brand_ID" HeaderText="Bike_Brand_ID" SortExpression="Bike_Brand_ID" />
                        <asp:BoundField DataField="Bike_Year" HeaderText="Bike_Year" SortExpression="Bike_Year" />
                        <asp:BoundField DataField="Bike_Price" HeaderText="Bike_Price" SortExpression="Bike_Price" />
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
            </td>
            <td style="height: 21px; width: 15%">&nbsp;</td>
            <td style="height: 21px; width: 13%"></td>
            <td style="height: 21px; width: 23%">&nbsp;</td>
            <td style="height: 21px; width: 23%">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">
                &nbsp;</td>
            <td class="w-50">
                <asp:Label ID="Label4" runat="server" Text="Customer"></asp:Label>
            </td>
            <td style="width: 15%">&nbsp;</td>
            <td style="width: 13%">&nbsp;</td>
            <td style="width: 23%">&nbsp;</td>
            <td style="width: 23%">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">
                &nbsp;</td>
            <td class="w-50">
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Customer]"></asp:SqlDataSource>
            </td>
            <td style="width: 15%">&nbsp;</td>
            <td style="width: 13%">&nbsp;</td>
            <td style="width: 23%">&nbsp;</td>
            <td style="width: 23%">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">
                &nbsp;</td>
            <td class="w-50">
                <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" DataKeyNames="Cust_ID" DataSourceID="SqlDataSource4" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="Cust_ID" HeaderText="Cust_ID" InsertVisible="False" ReadOnly="True" SortExpression="Cust_ID" />
                        <asp:BoundField DataField="Cust_FirstName" HeaderText="Cust_FirstName" SortExpression="Cust_FirstName" />
                        <asp:BoundField DataField="Cust_LastName" HeaderText="Cust_LastName" SortExpression="Cust_LastName" />
                        <asp:BoundField DataField="Cust_CreditCard" HeaderText="Cust_CreditCard" SortExpression="Cust_CreditCard" />
                        <asp:BoundField DataField="Cust_PIN" HeaderText="Cust_PIN" SortExpression="Cust_PIN" />
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
            </td>
            <td style="width: 15%">&nbsp;</td>
            <td style="width: 13%">&nbsp;</td>
            <td style="width: 23%">&nbsp;</td>
            <td style="width: 23%">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">
                &nbsp;</td>
            <td class="w-50">
                <asp:Label ID="Label5" runat="server" Text="Customer Item"></asp:Label>
            </td>
            <td style="width: 15%">&nbsp;</td>
            <td style="width: 13%">&nbsp;</td>
            <td style="width: 23%">&nbsp;</td>
            <td style="width: 23%">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">
                &nbsp;</td>
            <td class="w-50">
                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Customer_Item]"></asp:SqlDataSource>
            </td>
            <td style="width: 15%">&nbsp;</td>
            <td style="width: 13%">&nbsp;</td>
            <td style="width: 23%">&nbsp;</td>
            <td style="width: 23%">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">
                &nbsp;</td>
            <td class="w-50">
                <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" DataKeyNames="Cust_Item_ID" DataSourceID="SqlDataSource5" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4">
                    <Columns>
                        <asp:BoundField DataField="Cust_Item_ID" HeaderText="Cust_Item_ID" InsertVisible="False" ReadOnly="True" SortExpression="Cust_Item_ID" />
                        <asp:BoundField DataField="Bike_Name_ID" HeaderText="Bike_Name_ID" SortExpression="Bike_Name_ID" />
                        <asp:BoundField DataField="Bike_Quantity" HeaderText="Bike_Quantity" SortExpression="Bike_Quantity" />
                        <asp:BoundField DataField="Store_ID" HeaderText="Store_ID" SortExpression="Store_ID" />
                    </Columns>
                    <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                    <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                    <RowStyle BackColor="White" ForeColor="#330099" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                    <SortedAscendingCellStyle BackColor="#FEFCEB" />
                    <SortedAscendingHeaderStyle BackColor="#AF0101" />
                    <SortedDescendingCellStyle BackColor="#F6F0C0" />
                    <SortedDescendingHeaderStyle BackColor="#7E0000" />
                </asp:GridView>
            </td>
            <td style="width: 15%">&nbsp;</td>
            <td style="width: 13%">&nbsp;</td>
            <td style="width: 23%">&nbsp;</td>
            <td style="width: 23%">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">
                &nbsp;</td>
            <td class="w-50">
                <asp:Label ID="Label6" runat="server" Text="Customer Orders"></asp:Label>
            </td>
            <td style="width: 15%">&nbsp;</td>
            <td style="width: 13%">&nbsp;</td>
            <td style="width: 23%">&nbsp;</td>
            <td style="width: 23%">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">
                &nbsp;</td>
            <td class="w-50">
                <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Customer_Orders]"></asp:SqlDataSource>
            </td>
            <td style="width: 15%">&nbsp;</td>
            <td style="width: 13%">&nbsp;</td>
            <td style="width: 23%">&nbsp;</td>
            <td style="width: 23%">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">
                &nbsp;</td>
            <td class="w-50">
                <asp:GridView ID="GridView6" runat="server" AutoGenerateColumns="False" DataKeyNames="Cust_Order_ID" DataSourceID="SqlDataSource6" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4">
                    <Columns>
                        <asp:BoundField DataField="Cust_Order_ID" HeaderText="Cust_Order_ID" InsertVisible="False" ReadOnly="True" SortExpression="Cust_Order_ID" />
                        <asp:BoundField DataField="Cust_ID" HeaderText="Cust_ID" SortExpression="Cust_ID" />
                        <asp:BoundField DataField="Store_ID" HeaderText="Store_ID" SortExpression="Store_ID" />
                        <asp:BoundField DataField="Staff_ID" HeaderText="Staff_ID" SortExpression="Staff_ID" />
                        <asp:BoundField DataField="Sale_Date" HeaderText="Sale_Date" SortExpression="Sale_Date" />
                    </Columns>
                    <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                    <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                    <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" ForeColor="#003399" />
                    <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                    <SortedAscendingCellStyle BackColor="#EDF6F6" />
                    <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                    <SortedDescendingCellStyle BackColor="#D6DFDF" />
                    <SortedDescendingHeaderStyle BackColor="#002876" />
                </asp:GridView>
            </td>
            <td style="width: 15%">&nbsp;</td>
            <td style="width: 13%">&nbsp;</td>
            <td style="width: 23%">&nbsp;</td>
            <td style="width: 23%">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">
                &nbsp;</td>
            <td class="w-50">
                <asp:Label ID="Label7" runat="server" Text="Staff"></asp:Label>
            </td>
            <td style="width: 15%">&nbsp;</td>
            <td style="width: 13%">&nbsp;</td>
            <td style="width: 23%">&nbsp;</td>
            <td style="width: 23%">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">
                &nbsp;</td>
            <td class="w-50">
                <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Staff]"></asp:SqlDataSource>
            </td>
            <td style="width: 15%">&nbsp;</td>
            <td style="width: 13%">&nbsp;</td>
            <td style="width: 23%">&nbsp;</td>
            <td style="width: 23%">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">
                &nbsp;</td>
            <td class="w-50">
                <asp:GridView ID="GridView7" runat="server" AutoGenerateColumns="False" DataKeyNames="Staff_ID" DataSourceID="SqlDataSource7" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
                    <Columns>
                        <asp:BoundField DataField="Staff_ID" HeaderText="Staff_ID" InsertVisible="False" ReadOnly="True" SortExpression="Staff_ID" />
                        <asp:BoundField DataField="Staff_FirstName" HeaderText="Staff_FirstName" SortExpression="Staff_FirstName" />
                        <asp:BoundField DataField="Staff_LastName" HeaderText="Staff_LastName" SortExpression="Staff_LastName" />
                    </Columns>
                    <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                    <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                    <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#FFF1D4" />
                    <SortedAscendingHeaderStyle BackColor="#B95C30" />
                    <SortedDescendingCellStyle BackColor="#F1E5CE" />
                    <SortedDescendingHeaderStyle BackColor="#93451F" />
                </asp:GridView>
            </td>
            <td style="width: 15%">&nbsp;</td>
            <td style="width: 13%">&nbsp;</td>
            <td style="width: 23%">&nbsp;</td>
            <td style="width: 23%">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 11%" class="w-25">
                &nbsp;</td>
            <td class="w-50">
                <asp:Label ID="Label8" runat="server" Text="Store"></asp:Label>
            </td>
            <td style="width: 15%">&nbsp;</td>
            <td style="width: 13%">&nbsp;</td>
            <td style="width: 23%">&nbsp;</td>
            <td style="width: 23%">&nbsp;</td>
        </tr>
        <tr>
            <td style="height: 21px; width: 11%">
                &nbsp;</td>
            <td style="height: 21px; width: 50%">
                <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Store]"></asp:SqlDataSource>
            </td>
            <td style="height: 21px; width: 15%">&nbsp;</td>
            <td style="height: 21px; width: 13%"></td>
            <td style="height: 21px; width: 23%">&nbsp;</td>
            <td style="height: 21px; width: 23%">&nbsp;</td>
        </tr>
        <tr>
            <td style="height: 21px; width: 11%">
                &nbsp;</td>
            <td style="height: 21px; width: 50%">
                <asp:GridView ID="GridView8" runat="server" AutoGenerateColumns="False" DataKeyNames="Store_ID" DataSourceID="SqlDataSource8" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                    <Columns>
                        <asp:BoundField DataField="Store_ID" HeaderText="Store_ID" InsertVisible="False" ReadOnly="True" SortExpression="Store_ID" />
                        <asp:BoundField DataField="Store_Name" HeaderText="Store_Name" SortExpression="Store_Name" />
                        <asp:BoundField DataField="Store_Phone" HeaderText="Store_Phone" SortExpression="Store_Phone" />
                    </Columns>
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <SortedAscendingCellStyle BackColor="#F4F4FD" />
                    <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                    <SortedDescendingCellStyle BackColor="#D8D8F0" />
                    <SortedDescendingHeaderStyle BackColor="#3E3277" />
                </asp:GridView>
            </td>
            <td style="height: 21px; width: 15%">&nbsp;</td>
            <td style="height: 21px; width: 13%">&nbsp;</td>
            <td style="height: 21px; width: 23%">&nbsp;</td>
            <td style="height: 21px; width: 23%">&nbsp;</td>
        </tr>
        <tr>
            <td style="height: 21px; width: 11%">
                //Always lets you kno whats happening</td>
            <td style="height: 21px; width: 50%">
                <asp:Label ID="Label9" runat="server" Text="Label"></asp:Label>
            </td>
            <td style="height: 21px; width: 15%">&nbsp;</td>
            <td style="height: 21px; width: 13%">&nbsp;</td>
            <td style="height: 21px; width: 23%">&nbsp;</td>
            <td style="height: 21px; width: 23%">&nbsp;</td>
        </tr>
        <tr>
            <td style="height: 21px; width: 11%">&nbsp;</td>
            <td style="height: 21px; width: 50%">&nbsp;</td>
            <td style="height: 21px; width: 15%">&nbsp;</td>
            <td style="height: 21px; width: 13%">&nbsp;</td>
            <td style="height: 21px; width: 23%">&nbsp;</td>
            <td style="height: 21px; width: 23%">&nbsp;</td>
        </tr>
        <tr>
            <td style="height: 21px; width: 11%">&nbsp;</td>
            <td style="height: 21px; width: 50%">&nbsp;</td>
            <td style="height: 21px; width: 15%">&nbsp;</td>
            <td style="height: 21px; width: 13%">&nbsp;</td>
            <td style="height: 21px; width: 23%">&nbsp;</td>
            <td style="height: 21px; width: 23%">&nbsp;</td>
        </tr>
        <tr>
            <td style="height: 21px; width: 11%">&nbsp;</td>
            <td style="height: 21px; width: 50%">&nbsp;</td>
            <td style="height: 21px; width: 15%">&nbsp;</td>
            <td style="height: 21px; width: 13%">&nbsp;</td>
            <td style="height: 21px; width: 23%">&nbsp;</td>
            <td style="height: 21px; width: 23%">&nbsp;</td>
        </tr>
        <tr>
            <td style="height: 21px; width: 11%">&nbsp;</td>
            <td style="height: 21px; width: 50%">&nbsp;</td>
            <td style="height: 21px; width: 15%">&nbsp;</td>
            <td style="height: 21px; width: 13%">&nbsp;</td>
            <td style="height: 21px; width: 23%">&nbsp;</td>
            <td style="height: 21px; width: 23%">&nbsp;</td>
        </tr>
        <tr>
            <td style="height: 21px; width: 11%">&nbsp;</td>
            <td style="height: 21px; width: 50%">&nbsp;</td>
            <td style="height: 21px; width: 15%">&nbsp;</td>
            <td style="height: 21px; width: 13%">&nbsp;</td>
            <td style="height: 21px; width: 23%">&nbsp;</td>
            <td style="height: 21px; width: 23%">&nbsp;</td>
        </tr>
        <tr>
            <td style="height: 21px; width: 11%">&nbsp;</td>
            <td style="height: 21px; width: 50%">&nbsp;</td>
            <td style="height: 21px; width: 15%">&nbsp;</td>
            <td style="height: 21px; width: 13%">&nbsp;</td>
            <td style="height: 21px; width: 23%">&nbsp;</td>
            <td style="height: 21px; width: 23%">&nbsp;</td>
        </tr>
        <tr>
            <td style="height: 21px; width: 11%">&nbsp;</td>
            <td style="height: 21px; width: 50%">&nbsp;</td>
            <td style="height: 21px; width: 15%">&nbsp;</td>
            <td style="height: 21px; width: 13%">&nbsp;</td>
            <td style="height: 21px; width: 23%">&nbsp;</td>
            <td style="height: 21px; width: 23%">&nbsp;</td>
        </tr>
        <tr>
            <td style="height: 21px; width: 11%">&nbsp;</td>
            <td style="height: 21px; width: 50%">&nbsp;</td>
            <td style="height: 21px; width: 15%">&nbsp;</td>
            <td style="height: 21px; width: 13%">&nbsp;</td>
            <td style="height: 21px; width: 23%">&nbsp;</td>
            <td style="height: 21px; width: 23%">&nbsp;</td>
        </tr>
        <tr>
            <td style="height: 21px; width: 11%">&nbsp;</td>
            <td style="height: 21px; width: 50%">&nbsp;</td>
            <td style="height: 21px; width: 15%">&nbsp;</td>
            <td style="height: 21px; width: 13%">&nbsp;</td>
            <td style="height: 21px; width: 23%">&nbsp;</td>
            <td style="height: 21px; width: 23%">&nbsp;</td>
        </tr>
        <tr>
            <td style="height: 21px; width: 11%">&nbsp;</td>
            <td style="height: 21px; width: 50%">&nbsp;</td>
            <td style="height: 21px; width: 15%">&nbsp;</td>
            <td style="height: 21px; width: 13%">&nbsp;</td>
            <td style="height: 21px; width: 23%">&nbsp;</td>
            <td style="height: 21px; width: 23%">&nbsp;</td>
        </tr>
        <tr>
            <td style="height: 21px; width: 11%">&nbsp;</td>
            <td style="height: 21px; width: 50%">&nbsp;</td>
            <td style="height: 21px; width: 15%">&nbsp;</td>
            <td style="height: 21px; width: 13%">&nbsp;</td>
            <td style="height: 21px; width: 23%">&nbsp;</td>
            <td style="height: 21px; width: 23%">&nbsp;</td>
        </tr>
        <tr>
            <td style="height: 21px; width: 11%">&nbsp;</td>
            <td style="height: 21px; width: 50%">&nbsp;</td>
            <td style="height: 21px; width: 15%">&nbsp;</td>
            <td style="height: 21px; width: 13%">&nbsp;</td>
            <td style="height: 21px; width: 23%">&nbsp;</td>
            <td style="height: 21px; width: 23%">&nbsp;</td>
        </tr>
        <tr>
            <td style="height: 21px; width: 11%">&nbsp;</td>
            <td style="height: 21px; width: 50%">&nbsp;</td>
            <td style="height: 21px; width: 15%">&nbsp;</td>
            <td style="height: 21px; width: 13%">&nbsp;</td>
            <td style="height: 21px; width: 23%">&nbsp;</td>
            <td style="height: 21px; width: 23%">&nbsp;</td>
        </tr>
        <tr>
            <td style="height: 21px; width: 11%">&nbsp;</td>
            <td style="height: 21px; width: 50%">&nbsp;</td>
            <td style="height: 21px; width: 15%">&nbsp;</td>
            <td style="height: 21px; width: 13%">&nbsp;</td>
            <td style="height: 21px; width: 23%">&nbsp;</td>
            <td style="height: 21px; width: 23%">&nbsp;</td>
        </tr>
        <tr>
            <td style="height: 21px; width: 11%">&nbsp;</td>
            <td style="height: 21px; width: 50%">&nbsp;</td>
            <td style="height: 21px; width: 15%">&nbsp;</td>
            <td style="height: 21px; width: 13%">&nbsp;</td>
            <td style="height: 21px; width: 23%">&nbsp;</td>
            <td style="height: 21px; width: 23%">&nbsp;</td>
        </tr>
        <tr>
            <td style="height: 21px; width: 11%">&nbsp;</td>
            <td style="height: 21px; width: 50%">&nbsp;</td>
            <td style="height: 21px; width: 15%">&nbsp;</td>
            <td style="height: 21px; width: 13%">&nbsp;</td>
            <td style="height: 21px; width: 23%">&nbsp;</td>
            <td style="height: 21px; width: 23%">&nbsp;</td>
        </tr>
        <tr>
            <td style="height: 21px; width: 11%">&nbsp;</td>
            <td style="height: 21px; width: 50%">&nbsp;</td>
            <td style="height: 21px; width: 15%">&nbsp;</td>
            <td style="height: 21px; width: 13%">&nbsp;</td>
            <td style="height: 21px; width: 23%">&nbsp;</td>
            <td style="height: 21px; width: 23%">&nbsp;</td>
        </tr>
        <tr>
            <td style="height: 21px; width: 11%">&nbsp;</td>
            <td style="height: 21px; width: 50%">&nbsp;</td>
            <td style="height: 21px; width: 15%">&nbsp;</td>
            <td style="height: 21px; width: 13%">&nbsp;</td>
            <td style="height: 21px; width: 23%">&nbsp;</td>
            <td style="height: 21px; width: 23%">&nbsp;</td>
        </tr>
        <tr>
            <td style="height: 21px; width: 11%">&nbsp;</td>
            <td style="height: 21px; width: 50%">&nbsp;</td>
            <td style="height: 21px; width: 15%">&nbsp;</td>
            <td style="height: 21px; width: 13%">&nbsp;</td>
            <td style="height: 21px; width: 23%">&nbsp;</td>
            <td style="height: 21px; width: 23%">&nbsp;</td>
        </tr>
        <tr>
            <td style="height: 21px; width: 11%">&nbsp;</td>
            <td style="height: 21px; width: 50%">&nbsp;</td>
            <td style="height: 21px; width: 15%">&nbsp;</td>
            <td style="height: 21px; width: 13%">&nbsp;</td>
            <td style="height: 21px; width: 23%">&nbsp;</td>
            <td style="height: 21px; width: 23%">&nbsp;</td>
        </tr>
        <tr>
            <td style="height: 21px; width: 11%">&nbsp;</td>
            <td style="height: 21px; width: 50%">&nbsp;</td>
            <td style="height: 21px; width: 15%">&nbsp;</td>
            <td style="height: 21px; width: 13%">&nbsp;</td>
            <td style="height: 21px; width: 23%">&nbsp;</td>
            <td style="height: 21px; width: 23%">&nbsp;</td>
        </tr>
        <tr>
            <td style="height: 21px; width: 11%">&nbsp;</td>
            <td style="height: 21px; width: 50%">&nbsp;</td>
            <td style="height: 21px; width: 15%">&nbsp;</td>
            <td style="height: 21px; width: 13%">&nbsp;</td>
            <td style="height: 21px; width: 23%">&nbsp;</td>
            <td style="height: 21px; width: 23%">&nbsp;</td>
        </tr>
        <tr>
            <td style="height: 21px; width: 11%">&nbsp;</td>
            <td style="height: 21px; width: 50%">&nbsp;</td>
            <td style="height: 21px; width: 15%">&nbsp;</td>
            <td style="height: 21px; width: 13%">&nbsp;</td>
            <td style="height: 21px; width: 23%">&nbsp;</td>
            <td style="height: 21px; width: 23%">&nbsp;</td>
        </tr>
        <tr>
            <td style="height: 21px; width: 11%">&nbsp;</td>
            <td style="height: 21px; width: 50%">&nbsp;</td>
            <td style="height: 21px; width: 15%">&nbsp;</td>
            <td style="height: 21px; width: 13%">&nbsp;</td>
            <td style="height: 21px; width: 23%">&nbsp;</td>
            <td style="height: 21px; width: 23%">&nbsp;</td>
        </tr>
        <tr>
            <td style="height: 21px; width: 11%">&nbsp;</td>
            <td style="height: 21px; width: 50%">&nbsp;</td>
            <td style="height: 21px; width: 15%">&nbsp;</td>
            <td style="height: 21px; width: 13%">&nbsp;</td>
            <td style="height: 21px; width: 23%">&nbsp;</td>
            <td style="height: 21px; width: 23%">&nbsp;</td>
        </tr>
        <tr>
            <td style="height: 21px; width: 11%">&nbsp;</td>
            <td style="height: 21px; width: 50%">&nbsp;</td>
            <td style="height: 21px; width: 15%">&nbsp;</td>
            <td style="height: 21px; width: 13%">&nbsp;</td>
            <td style="height: 21px; width: 23%">&nbsp;</td>
            <td style="height: 21px; width: 23%">&nbsp;</td>
        </tr>
        <tr>
            <td style="height: 21px; width: 11%">&nbsp;</td>
            <td style="height: 21px; width: 50%">&nbsp;</td>
            <td style="height: 21px; width: 15%">&nbsp;</td>
            <td style="height: 21px; width: 13%">&nbsp;</td>
            <td style="height: 21px; width: 23%">&nbsp;</td>
            <td style="height: 21px; width: 23%">&nbsp;</td>
        </tr>
        <tr>
            <td style="height: 21px; width: 11%">&nbsp;</td>
            <td style="height: 21px; width: 50%">&nbsp;</td>
            <td style="height: 21px; width: 15%">&nbsp;</td>
            <td style="height: 21px; width: 13%">&nbsp;</td>
            <td style="height: 21px; width: 23%">&nbsp;</td>
            <td style="height: 21px; width: 23%">&nbsp;</td>
        </tr>
    </table>
</asp:Content>
