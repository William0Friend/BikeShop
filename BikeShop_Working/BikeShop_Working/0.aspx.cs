using System;
using System.Web;
using System.Linq;
using System.Text;
using System.Data;
using System.Web.UI;
using System.Configuration;
using System.Data.SqlClient;
using System.Reflection.Emit;
using System.Drawing.Printing;
using System.Web.UI.WebControls;
using System.Collections.Generic;
using System.Security.Cryptography;
using static System.Net.Mime.MediaTypeNames;

namespace BikeShop_Working
{
    public partial class BikeShop : System.Web.UI.Page
    {
        // FIXED establish connection first thing
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString2BikeShop2"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
           if (!Page.IsPostBack)
            {
                conn.Open();
                Label8.Text = "Products";

                // Populate any DropDownLists or other controls with initial data
                PopulateStaffDropDown();

                // Populate the customers, stores, staff, and products DropDownList
                PopulateDropDownList(ddlCustomer, "SELECT Customer_ID, First_Name + ' ' + Last_Name AS FullName FROM Customers", "FullName", "Customer_ID");
                PopulateDropDownList(ddlStore, "SELECT Store_ID, Store_Name FROM Stores", "Store_Name", "Store_ID");
                PopulateDropDownList(ddlStaff, "SELECT Staff_ID, First_Name + ' ' + Last_Name AS FullName FROM Staff", "FullName", "Staff_ID");
                PopulateDropDownList(ddlProduct, "SELECT Product_ID, Product_Name FROM Products", "Product_Name", "Product_ID");
                PopulateDropDownList(ddlSourceStore, "SELECT Store_ID, Store_Name FROM Stores", "Store_Name", "Store_ID");
                PopulateQuantityDropDown();
                
                PopulateProductDropDown();

                //Product orders
                //BindFooterDropDowns();

            }

        }

        // Multiple Orders
        //.....................................................................................
        // FIXED ????
        
        

        // Populate Dropdowns
        //.....................................................................................
        // FIXED
        // 
        private void PopulateDropDownList(DropDownList ddl, string query, string textField, string valueField)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString2BikeShop2"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                ddl.DataSource = dt;
                ddl.DataTextField = textField;
                ddl.DataValueField = valueField;
                ddl.DataBind();
            }
        }
        // Add Customer
        //.....................................................................................
        // Not FIXED
        //
        protected void btnAddCustomer_Click(object sender, EventArgs e)
        {
            string firstName = txtFirstName.Text;
            string lastName = txtLastName.Text;
            string creditCard = txtCreditCard.Text;
            string pin = txtPIN.Text;
            string phone = txtPhone.Text;
            string email = txtEmail.Text;
            string street = txtStreet.Text;
            string city = txtCity.Text;
            string state = txtState.Text;
            string zipCode = txtZipCode.Text;

            string encryptedCreditCard = EncryptCreditCard(creditCard, pin);
            //SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
           //string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString2BikeShop2"].ConnectionString;

           SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString2BikeShop2"].ConnectionString);//(connectionString))
            
                conn.Open();
                string insertQuery = @"
                INSERT INTO Customers
                    (First_Name, Last_Name, Credit_Card_Encrypted, Credit_Card_PIN_Encrypted, Phone, Email, Street, City, State, Zip_Code)
                VALUES
                    (@FirstName, @LastName, @CreditCard, @PIN, @Phone, @Email, @Street, @City, @State, @Zip)";

                    SqlCommand cmd = new SqlCommand(insertQuery, conn);
                    cmd.Parameters.AddWithValue("@FirstName", firstName);
                    cmd.Parameters.AddWithValue("@LastName", lastName);
                    cmd.Parameters.AddWithValue("@CreditCard", EncryptCreditCard(encryptedCreditCard,pin));
                    cmd.Parameters.AddWithValue("@PIN", pin);
                    cmd.Parameters.AddWithValue("@Phone", phone);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Street", street);
                    cmd.Parameters.AddWithValue("@City", city);
                    cmd.Parameters.AddWithValue("@State", state);
                    cmd.Parameters.AddWithValue("@Zip", zipCode);

                    cmd.ExecuteNonQuery();
                conn.Close();
                // Clear the input fields after adding the staff member to correct gridview
                GridView1.DataBind();
                txtFirstName.Text = "";
                txtLastName.Text = "";
                txtCreditCard.Text = "";
                txtPIN.Text = "";
                txtPhone.Text = "";
                txtEmail.Text = "";
                txtStreet.Text = "";
                txtCity.Text = "";
                txtState.Text = "";
                txtZipCode.Text = "";
            
        }
        //Encrypt Credit Card
        private string EncryptCreditCard(string creditCard, string pin)
        {
            using (Aes aes = new AesManaged())
            {
                byte[] key = Encoding.UTF8.GetBytes(pin.PadRight(32, '0'));
                byte[] iv = new byte[16];
                aes.Key = key;
                aes.IV = iv;

                using (ICryptoTransform encryptor = aes.CreateEncryptor())
                {
                    byte[] creditCardBytes = Encoding.UTF8.GetBytes(creditCard);
                    byte[] encryptedCreditCardBytes = encryptor.TransformFinalBlock(creditCardBytes, 0, creditCardBytes.Length);
                    return Convert.ToBase64String(encryptedCreditCardBytes);
                }
            }
        }

        // Add Staff
        // .....................................................................................................
        // FIXED
        //event handler and helper methods

        protected void btnAddStaff_Click(object sender, EventArgs e)
        {
            string firstName = txtStaffFirstName.Text;
            string lastName = txtStaffLastName.Text;
            string email = txtStaffEmail.Text;
            string phone = txtStaffPhone.Text;
            bool isManager = chkIsManager.Checked;

           string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString2BikeShop2"].ConnectionString;

           using (SqlConnection conn = new SqlConnection(connectionString))
           {
                conn.Open();
                string insertQuery = @"
                INSERT INTO Staff
                    (First_Name, Last_Name, Email, Phone, IsManager)
                VALUES
                    (@FirstName, @LastName, @Email, @Phone, @IsManager)";

                using (SqlCommand cmd = new SqlCommand(insertQuery, conn))
                {
                    cmd.Parameters.AddWithValue("@FirstName", firstName);
                    cmd.Parameters.AddWithValue("@LastName", lastName);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Phone", phone);
                    cmd.Parameters.AddWithValue("@IsManager", isManager);

                    cmd.ExecuteNonQuery();
                    
                    conn.Close();
                // Clear the input fields after adding the staff member to correct gridview
                GridView3.DataBind();
                GridView2.DataBind();
                txtStaffFirstName.Text = "";
                txtStaffLastName.Text = "";
                txtStaffEmail.Text = "";
                txtStaffPhone.Text = "";
                chkIsManager.Checked = false;
            }
           }
        }
        //Populate Staff Dropdown
        private void PopulateStaffDropDown()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString2BikeShop2"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string selectQuery = "SELECT Staff_ID, First_Name + ' ' + Last_Name AS FullName FROM Staff";
                //string selectQuery = "SELECT First_Name + ' ' + Last_Name AS FullName FROM Staff";
                using (SqlCommand cmd = new SqlCommand(selectQuery, conn))
                {
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        Label2.Text = ddlManagerStaff.SelectedValue;
                        ddlManagerStaff.DataSource = reader;
                        ddlManagerStaff.DataTextField = "FullName";
                        ddlManagerStaff.DataValueField = "Staff_ID";
                        ddlManagerStaff.DataBind();
                    }
                }
            }
        }
        // Manage Staff - promote - demote
        // ...................................................................................................
        // FIXED
        //event handlers and helper methods

        protected void btnPromote_Click(object sender, EventArgs e)
        {
            UpdateManagerStatus(true);
        }
        
        protected void btnDemote_Click(object sender, EventArgs e)
        {
            UpdateManagerStatus(false);
        }
        // FIXED
        //update manager, used by promote & demote, basically flips a bit
        private void UpdateManagerStatus(bool isManager)
        {
          string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString2BikeShop2"].ConnectionString;

          using (SqlConnection conn = new SqlConnection(connectionString))
           {
               conn.Open();
                string updateQuery = @"
            UPDATE Staff
            SET IsManager = @IsManager
            WHERE Staff_ID = @StaffId
      ";

                using (SqlCommand cmd = new SqlCommand(updateQuery, conn))
              {
                    cmd.Parameters.AddWithValue("@IsManager", isManager);
                   cmd.Parameters.AddWithValue("@StaffId", ddlManagerStaff.SelectedValue);//

                    Label3.Text = ddlManagerStaff.SelectedItem.ToString();
                    cmd.ExecuteNonQuery();
               //we want to real time see manager change
                GridView3.DataBind();
                GridView2.DataBind();

                    conn.Close();
                }
            }
        }

      

        //Store Form
        ///....................................................................................
        // add store
        protected void addStore_Click(object sender, EventArgs e)
        {

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString2BikeShop2"].ConnectionString))
            {
                //tedious way
                conn.Open();
                SqlCommand cmd = new SqlCommand("insert into Stores values('" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "','" + TextBox5.Text + "','" + TextBox6.Text + "','" + TextBox7.Text + "')", conn);
                cmd.ExecuteNonQuery();
                //conn.Close();
                //Label1.Text = "Data has been inserted into db";
                GridView9.DataBind();
                TextBox1.Text = "";
                TextBox2.Text = "";
                TextBox3.Text = "";
                TextBox4.Text = "";
                TextBox5.Text = "";
                TextBox6.Text = "";
                TextBox7.Text = "";
                Label1.Text = "Congradulations, You added a store!";
            }
        }



        // Place order form 1 order works perfect
        //.........................................................................................
        // FIXED
        //    <!--<asp:GridView ID="gvOrderItems" runat="server" AutoGenerateColumns="false" ShowFooter="true">-->

    
        protected void btnPlaceOrder_Click(object sender, EventArgs e)
        {
            // Get the data from the input fields and DropDownLists
            int customerId = Convert.ToInt32(ddlCustomer.SelectedValue);
            int storeId = Convert.ToInt32(ddlStore.SelectedValue);
            int staffId = Convert.ToInt32(ddlStaff.SelectedValue);
            decimal discount = Convert.ToDecimal(txtDiscount.Text);
            DateTime orderDate = DateTime.Now;

           string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString2BikeShop2"].ConnectionString;

            //using (SqlConnection conn = new SqlConnection(connectionString))
            //{
            SqlConnection conn = new SqlConnection(connectionString);
               conn.Open();

                // Insert the order data into the Orders table
                string insertOrderQuery = "INSERT INTO Orders (Customer_ID, Staff_ID, Store_ID, Order_Date, Discount) OUTPUT INSERTED.Order_ID VALUES (@CustomerID, @StaffID, @StoreID, @OrderDate, @Discount)";
                int orderId;
            //using (SqlCommand cmd = new SqlCommand(insertOrderQuery, conn))
            //{
            SqlCommand cmd = new SqlCommand(insertOrderQuery, conn);
                    cmd.Parameters.AddWithValue("@CustomerID", customerId);
                    cmd.Parameters.AddWithValue("@StaffID", staffId);
                    cmd.Parameters.AddWithValue("@StoreID", storeId);
                    cmd.Parameters.AddWithValue("@OrderDate", orderDate);
                    cmd.Parameters.AddWithValue("@Discount", discount);

                    orderId = (int)cmd.ExecuteScalar();
            Label5.Text = "Insert into orders was successful, id auto incremented!";
                //}

                // Loop through the selected products and their quantities
                // In this example, I'm assuming you have only one product in the order
                int productId = Convert.ToInt32(ddlProduct.SelectedValue);
                int quantity = Convert.ToInt32(ddlQuantity.SelectedValue);
                int sourceStoreId = Convert.ToInt32(ddlSourceStore.SelectedValue);

                // Insert the order item data into the Order_Items table
                string insertOrderItemQuery = "INSERT INTO Order_Items (Order_ID, Product_ID, Quantity, Source_Store_ID) VALUES (@OrderID, @ProductID, @Quantity, @SourceStoreID)";
            // using (SqlCommand cmd = new SqlCommand(insertOrderItemQuery, conn))
            //  {
            SqlCommand cmd2 = new SqlCommand(insertOrderItemQuery, conn);
                    cmd2.Parameters.AddWithValue("@OrderID", orderId);
                    cmd2.Parameters.AddWithValue("@ProductID", productId);
                    cmd2.Parameters.AddWithValue("@Quantity", quantity);
                    cmd2.Parameters.AddWithValue("@SourceStoreID", sourceStoreId);
                    cmd2.ExecuteNonQuery();
                    Label6.Text = "Insert into items-orders was successful, id auto incremented!";
            
            // }
            // Update the Stock table to subtract the sold quantity from the corresponding store's inventory
            string updateStockQuery = "UPDATE Stock SET Quantity = Quantity - @Quantity WHERE Product_ID = @ProductID AND Store_ID = @SourceStoreID";
            //using (SqlCommand cmd = new SqlCommand(updateStockQuery, conn))
            // {
            SqlCommand cmd3 = new SqlCommand(updateStockQuery, conn);
                    cmd3.Parameters.AddWithValue("@Quantity", quantity);
                    cmd3.Parameters.AddWithValue("@ProductID", productId);
                    cmd3.Parameters.AddWithValue("@SourceStoreID", sourceStoreId);
                    cmd3.ExecuteNonQuery();
            Label7.Text = "Insert Quantity was successful, correct quantity should have been deducted";

            conn.Close();
                // Clear the input fields and DropDownLists after placing the order
                GridView4.DataBind();
                GridView5.DataBind();
                GridView6.DataBind();
                GridView7.DataBind();
                ddlCustomer.SelectedIndex = 0;
                ddlStore.SelectedIndex = 0;
                ddlStaff.SelectedIndex = 0;
                ddlProduct.SelectedIndex = 0;
                ddlQuantity.SelectedIndex = 0;
                ddlSourceStore.SelectedIndex = 0;
                txtDiscount.Text = string.Empty;
            // display a success message
            lblMessage.Text = "Order placed successfully!";
            PopulateQuantityDropDown();
            //PopulateQuantityDropDown();
            //}
        }



        //Brand Year Name etc
        //................................................
        private void PopulateProductDropDown()
        {
            // Get the connection string from the configuration
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString2BikeShop2"].ConnectionString;

            // Create a SqlConnection object within a using statement to ensure the connection is properly disposed of when it is no longer needed
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                // Open the connection to the database
                conn.Open();

                // The SQL query is constructed to fetch product information along with the related brand and category names
                // The INNER JOINs are used to connect the Products table to the Brands and Categories tables based on their respective IDs
                // This query combines data from multiple tables and creates a more comprehensive record for each product
                string selectProductQuery = "SELECT P.Product_ID, P.Product_Name, P.Model_Year, P.List_Price, B.Brand_Name, C.Category_Name FROM Products P INNER JOIN Bike_Brands B ON P.Brand_ID = B.Brand_ID INNER JOIN Bike_Categories C ON P.Category_ID = C.Category_ID";

                // Create a SqlDataAdapter object to execute the SQL query and fetch the data
                SqlDataAdapter daProducts = new SqlDataAdapter(selectProductQuery, conn);
                // Create a DataTable object to store the fetched data
                DataTable products = new DataTable();
                // Fill the DataTable object with the fetched data
                daProducts.Fill(products);

                // Add a new column "ProductInfo" to the DataTable, which will contain the concatenated product information
                // The expression in the third argument combines the various columns with proper separators and formatting
                // The concatenated information will be displayed in the dropdown list
                products.Columns.Add("ProductInfo", typeof(string), "Product_Name + ' | ' + Brand_Name + ' | ' + Category_Name + ' | ' + Model_Year + ' | $' + List_Price");

                // Bind the Product dropdown to the modified DataTable
                ddlProduct.DataSource = products;
                // Set the DataTextField property to the new "ProductInfo" column, which contains the concatenated product information
                ddlProduct.DataTextField = "ProductInfo";
                // Set the DataValueField property to the "Product_ID" column, which will be used to store the selected product's ID in the Order_Items table
                ddlProduct.DataValueField = "Product_ID";
                // Bind the data to the dropdown list
                ddlProduct.DataBind();
            }
        }
















        //failed quality dropdown
        /*private void PopulateQuantityDropDown()
     {
         if (!string.IsNullOrEmpty(ddlProduct.SelectedValue) && !string.IsNullOrEmpty(ddlSourceStore.SelectedValue))
         {
             string query = $"SELECT Stock_ID, Quantity FROM Stock WHERE Product_ID = {ddlProduct.SelectedValue} AND Store_ID = {ddlSourceStore.SelectedValue}";
             PopulateDropDownList(ddlQuantity, query, "Quantity", "Stock_ID");
         }
         else
         {
             ddlQuantity.Items.Clear();
         }
     }*/

        // Populate Quality Dropdown
        // ........................................
        // not FIXED
        // hopefully good quality dropdown
        protected void ddlProduct_SelectedIndexChanged(object sender, EventArgs e)
        {
            PopulateQuantityDropDown();
        }

        protected void ddlSourceStore_SelectedIndexChanged(object sender, EventArgs e)
        {
            PopulateQuantityDropDown();
        }

        private void PopulateQuantityDropDown()
        {
            int productId = Convert.ToInt32(ddlProduct.SelectedValue);
            int sourceStoreId = Convert.ToInt32(ddlSourceStore.SelectedValue);

            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString2BikeShop2"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string selectStockQuery = "SELECT Quantity FROM Stock WHERE Product_ID = @ProductID AND Store_ID = @SourceStoreID";
                using (SqlCommand cmd = new SqlCommand(selectStockQuery, conn))
                {
                    cmd.Parameters.AddWithValue("@ProductID", productId);
                    cmd.Parameters.AddWithValue("@SourceStoreID", sourceStoreId);

                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        int maxQuantity = reader.GetInt32(0);

                        ddlQuantity.Items.Clear();
                        for (int i = 1; i <= maxQuantity; i++)
                        {
                            ddlQuantity.Items.Add(i.ToString());
                        }
                    }
                }
            }
        }
      
        //// Clear the input fields and DropDownLists after placing the order
        //ddlCustomer.SelectedIndex = 0;
        //ddlStore.SelectedIndex = 0;
        //ddlStaff.SelectedIndex = 0;
        //ddlProduct.SelectedIndex = 0;
        //ddlQuantity.SelectedIndex = 0;
        //ddlSourceStore.SelectedIndex = 0;
        //txtDiscount.Text = string.Empty;

        //// Optionally, display a success message
        //lblMessage.Text = "Order placed successfully!";
        //}


    }
}

//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//Code for placing an order of more than one kind of bike, now you can only order 1 or more of a single kind of bike per order,
// this code is aiming to fix hat issue

/*
 private void BindFooterDropDowns(GridViewRow footerRow)
        {
            if (gvOrderItemsMultiple.FooterRow != null)
            {

                // Populate the Product and Source Store dropdowns in the GridView footer
                // DropDownList ddlProductFooter = (DropDownList)gvOrderItemsMultiple.FooterRow.FindControl("ddlProductFooter");
                // DropDownList ddlSourceStoreFooter = (DropDownList)gvOrderItemsMultiple.FooterRow.FindControl("ddlSourceStoreFooter");
                DropDownList ddlProductFooter = (DropDownList)footerRow.FindControl("ddlProductFooter");
                DropDownList ddlSourceStoreFooter = (DropDownList)footerRow.FindControl("ddlSourceStoreFooter");
                
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString2BikeShop2"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                // Select products and stores from the respective tables
                string selectProductsQuery = "SELECT * from Products";
                string selectStoresQuery = "SELECT * from Stores";

                SqlDataAdapter daProducts = new SqlDataAdapter(selectProductsQuery, conn);
                SqlDataAdapter daStores = new SqlDataAdapter(selectStoresQuery, conn);

                DataTable products = new DataTable();
                DataTable sourceStores = new DataTable();

                daProducts.Fill(products);
                daStores.Fill(sourceStores);

                // Bind the Product dropdown
                ddlProductFooter.DataSource = products;
                ddlProductFooter.DataTextField = "Product_Name"; // Replace "Product_Name" with the appropriate column name from your Products table
                ddlProductFooter.DataValueField = "Product_ID"; // Replace "Product_ID" with the appropriate column name from your Products table
                ddlProductFooter.DataBind();

                // Bind the Source Store dropdown
                ddlSourceStoreFooter.DataSource = sourceStores;
                ddlSourceStoreFooter.DataTextField = "StoreName"; // Replace "StoreName" with the appropriate column name from your Stores table
                ddlSourceStoreFooter.DataValueField = "Store_ID"; // Replace "Store_ID" with the appropriate column name from your Stores table
                ddlSourceStoreFooter.DataBind();
                }
            }
        }
        protected void gvOrderItemsMultiple_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                BindFooterDropDowns(e.Row);
            }
        }
        protected void gvOrderItemsMultiple_DataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                BindFooterDropDowns(e.Row);
            }
        }
        protected void btnAddItem_Click(object sender, EventArgs e)
        {
            // Get the selected product, quantity, and source store from the GridView footer
            DropDownList ddlProductFooter = (DropDownList)gvOrderItemsMultiple.FooterRow.FindControl("ddlProductFooter");
            TextBox txtQuantityFooter = (TextBox)gvOrderItemsMultiple.FooterRow.FindControl("txtQuantityFooter");
            DropDownList ddlSourceStoreFooter = (DropDownList)gvOrderItemsMultiple.FooterRow.FindControl("ddlSourceStoreFooter");
            // Create a new row with the selected values
            DataTable dt = new DataTable();
            if (ViewState["OrderItems"] != null)
            {
                dt = (DataTable)ViewState["OrderItems"];
            }
            else
            {
                dt.Columns.Add("Product");
                dt.Columns.Add("Quantity");
                dt.Columns.Add("SourceStore");
            }

            DataRow newRow = dt.NewRow();
            newRow["Product"] = ddlProductFooter.SelectedValue;
            newRow["Quantity"] = txtQuantityFooter.Text;
            newRow["SourceStore"] = ddlSourceStoreFooter.SelectedValue;
            dt.Rows.Add(newRow);

            // Save the DataTable to ViewState and bind it to the GridView
            ViewState["OrderItems"] = dt;
            gvOrderItemsMultiple.DataSource = dt;
            gvOrderItemsMultiple.DataBind();

            // Clear the footer input fields
            ddlProductFooter.SelectedIndex = 0;
            txtQuantityFooter.Text = string.Empty;
            ddlSourceStoreFooter.SelectedIndex = 0;
        }


        protected void btnPlaceOrder_Click(object sender, EventArgs e)
        {
            // Get the data from the input fields and DropDownLists
            int customerId = Convert.ToInt32(ddlCustomer.SelectedValue);
            int storeId = Convert.ToInt32(ddlStore.SelectedValue);
            int staffId = Convert.ToInt32(ddlStaff.SelectedValue);
            decimal discount = Convert.ToDecimal(txtDiscount.Text);
            DateTime orderDate = DateTime.Now;

            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString2BikeShop2"].ConnectionString;

            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();

            // Insert the order data into the Orders table
            string insertOrderQuery = "INSERT INTO Orders (Customer_ID, Staff_ID, Store_ID, Order_Date, Discount) OUTPUT INSERTED.Order_ID VALUES (@CustomerID, @StaffID, @StoreID, @OrderDate, @Discount)";
            int orderId;
            SqlCommand cmd = new SqlCommand(insertOrderQuery, conn);
            cmd.Parameters.AddWithValue("@CustomerID", customerId);
            cmd.Parameters.AddWithValue("@StaffID", staffId);
            cmd.Parameters.AddWithValue("@StoreID", storeId);
            cmd.Parameters.AddWithValue("@OrderDate", orderDate);
            cmd.Parameters.AddWithValue("@Discount", discount);

            orderId = (int)cmd.ExecuteScalar();
            Label5.Text = "Insert into orders was successful, id auto incremented!";

            // Loop through the GridView rows and insert each order item into the Order_Items table
            foreach (GridViewRow row in gvOrderItemsMultiple.Rows) // "gvOrderItems" is my GridView ID
            {
                int productId = Convert.ToInt32(((HiddenField)row.FindControl("hfProduct")).Value);
                int quantity = Convert.ToInt32(((HiddenField)row.FindControl("hfQuantity")).Value);
                int sourceStoreId = Convert.ToInt32(((HiddenField)row.FindControl("hfSourceStore")).Value);

                // Insert the order item data into the Order_Items table
                string insertOrderItemQuery = "INSERT INTO Order_Items (Order_ID, Product_ID, Quantity, Source_Store_ID) VALUES (@OrderID, @ProductID, @Quantity, @SourceStoreID)";
                SqlCommand cmd2 = new SqlCommand(insertOrderItemQuery, conn);
                cmd2.Parameters.AddWithValue("@OrderID", orderId);
                cmd2.Parameters.AddWithValue("@ProductID", productId);
                cmd2.Parameters.AddWithValue("@Quantity", quantity);
                cmd2.Parameters.AddWithValue("@SourceStoreID", sourceStoreId);
                cmd2.ExecuteNonQuery();
                Label6.Text = "Insert into items-orders was successful, id auto incremented!";

                // Update the Stock table to subtract the sold quantity from the corresponding store's inventory
                string updateStockQuery = "UPDATE Stock SET Quantity = Quantity - @Quantity WHERE Product_ID = @ProductID AND Store_ID = @SourceStoreID";
                SqlCommand cmd3 = new SqlCommand(updateStockQuery, conn);
                cmd3.Parameters.AddWithValue("@Quantity", quantity);
                cmd3.Parameters.AddWithValue("@ProductID", productId);
                cmd3.Parameters.AddWithValue("@SourceStoreID", sourceStoreId);
                cmd3.ExecuteNonQuery();
                Label7.Text = "Insert Quantity was successful, correct quantity should have been deducted";
            }

            conn.Close();

            // Clear the input fields and DropDownLists after placing the order
            GridView4.DataBind();
            GridView5.DataBind();
            GridView6.DataBind();
            GridView7.DataBind();
            ddlCustomer.SelectedIndex = 0;
            ddlStore.SelectedIndex = 0;
            ddlStaff.SelectedIndex = 0;
            ddlProduct.SelectedIndex = 0;
            ddlQuantity.SelectedIndex = 0;
            ddlSourceStore.SelectedIndex = 0;
            txtDiscount.Text = string.Empty;

            // Display a success message
            lblMessage.Text = "Order placed successfully!";
            // Populate the Quantity drop-down list
            PopulateQuantityDropDown();

            // Clear the GridView and ViewState
            gvOrderItemsMultiple.DataSource = null;
            gvOrderItemsMultiple.DataBind();
            ViewState["OrderItems"] = null;

        }
 
 */
/*.aspx
     * 
     * 
     * 
<asp:GridView ID="gvOrderItemsMultiple" runat="server" ShowFooter="true"   OnRowCreated="gvOrderItemsMultiple_RowCreated"> 
<Columns>
    <asp:TemplateField HeaderText="Product">
        <ItemTemplate>
            <asp:Label ID="lblProduct" runat="server" Text='<%# Eval("Product") %>'></asp:Label>
        </ItemTemplate>
        <FooterTemplate>
            <asp:DropDownList ID="ddlProductFooter" runat="server"></asp:DropDownList>
        </FooterTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Quantity">
        <ItemTemplate>
            <asp:Label ID="lblQuantity" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label>
        </ItemTemplate>
        <FooterTemplate>
            <asp:TextBox ID="txtQuantityFooter" runat="server"></asp:TextBox>
        </FooterTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Source Store">
        <ItemTemplate>
            <asp:Label ID="lblSourceStore" runat="server" Text='<%# Eval("SourceStore") %>'></asp:Label>
        </ItemTemplate>
        <FooterTemplate>
            <asp:DropDownList ID="ddlSourceStoreFooter" runat="server"></asp:DropDownList>
        </FooterTemplate>
    </asp:TemplateField>
</Columns>
</asp:GridView>
<asp:Button ID="btnAddItem" runat="server" Text="Add Item" OnClick="btnAddItem_Click" />
     * 
     * 
     * 
     * 
     * 
     * 
     * 
     * 
     * 
     * .aspx.cs
     */


///-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//oldest form v.1
//

//using System;
//using System.Web;
//using System.Linq;
//using System.Data;
//using System.Web.UI;
//using System.Configuration;
//using System.Data.SqlClient;
//using System.Web.UI.WebControls;
//using System.Collections.Generic;

//namespace BikeShop_Working
//{
//    public partial class BikeShopTest : System.Web.UI.Page
//    {
//        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
//        protected void Page_Load(object sender, EventArgs e)
//        {
//            con.Open();
//        }

//        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
//        {

//        }

//        //Add Bike Brand
//        protected void Button9_Click(object sender, EventArgs e)
//        {
//            // con.Open();
//            SqlCommand cmd9 = new SqlCommand("insert into Bike_Brand values('" + TextBox11.Text + "')", con);
//            cmd9.ExecuteNonQuery();
//            con.Close();
//            Label9.Text = "Data has been inserted into Bike_Brand";
//            GridView1.DataBind();
//            TextBox11.Text = "";
//        }


//        protected void Button1_Click(object sender, EventArgs e)
//        {
//            //write the inserts for all of the 
//        }
//        //Add Staff
//        protected void Button_Staff_Click(object sender, EventArgs e)
//        {
//            // con.Open();
//            SqlCommand cmd_Staff = new SqlCommand("insert into Staff values('" + TextBox4.Text + "' , '" + TextBox12.Text + "')", con);
//            cmd_Staff.ExecuteNonQuery();
//            con.Close();
//            Label9.Text = "Data has been inserted into Staff";
//            GridView7.DataBind();
//            TextBox4.Text = "";
//            TextBox11.Text = "";
//        }

//        //Add Customer
//        protected void Button_Customer_Click(object sender, EventArgs e)
//        {
//            //con.Open();
//            SqlCommand cmd_Customer = new SqlCommand("insert into Customer values('" + TextBox6.Text + "' , '" + TextBox13.Text + "', '" + TextBox14.Text + "', '" + TextBox15.Text + "')", con);
//            cmd_Customer.ExecuteNonQuery();
//            con.Close();
//            Label9.Text = "Data has been inserted into Customer";
//            GridView6.DataBind();
//            TextBox6.Text = "";
//            TextBox13.Text = "";
//            TextBox14.Text = "";
//            TextBox15.Text = "";
//        }
//        // Add Bike Catagory
//        protected void Button_Catagory_Click(object sender, EventArgs e)
//        {
//            // con.Open();
//            SqlCommand cmd_Catagory = new SqlCommand("insert into Bike_Catagory values('" + TextBox10.Text + "')", con);
//            cmd_Catagory.ExecuteNonQuery();
//            con.Close();
//            Label9.Text = "Data has been inserted into Bike_Catagory";
//            GridView2.DataBind();
//            TextBox10.Text = "";
//        }
//        // Add Bike Name
//        protected void Button7_Click(object sender, EventArgs e)
//        {
//            //con.Open();
//            SqlCommand cmd_Bike_Name = new SqlCommand("insert into Bike_Name values('" + TextBox9.Text + "' , '" + DropDownList6.SelectedValue + "', '" + TextBox17.Text + "', '" + TextBox18.Text + "')", con);
//            cmd_Bike_Name.ExecuteNonQuery();
//            con.Close();
//            Label9.Text = "Data has been inserted into Bike Name";
//            GridView3.DataBind();
//            TextBox9.Text = "";
//            TextBox17.Text = "";
//            TextBox18.Text = "";
//        }
//        //Store Insert
//        protected void Button6_Click(object sender, EventArgs e)
//        {
//            // con.Open();
//            SqlCommand cmd_Store = new SqlCommand("insert into Store values('" + TextBox8.Text + "' , '" + TextBox16.Text + "')", con);
//            cmd_Store.ExecuteNonQuery();
//            con.Close();
//            Label9.Text = "Data has been inserted in Store";
//            GridView8.DataBind();
//            TextBox8.Text = "";
//            TextBox16.Text = "";
//        }
//        //Store Update
//        protected void Button10_Click(object sender, EventArgs e)
//        {
//            SqlCommand cmd_Store = new SqlCommand("update Store set Store_Name='" + TextBox8.Text + "', Store_Phone='" + TextBox16.Text + "' where Store_ID='" + Convert.ToInt32(TextBox19.Text).ToString() + "'", con);
//            cmd_Store.ExecuteNonQuery();
//            con.Close();
//            Label9.Text = "Data has been updated in Store";
//            GridView8.DataBind();
//            TextBox8.Text = "";
//            TextBox16.Text = "";
//        }
//        //Store Delete
//        protected void Button11_Click(object sender, EventArgs e)
//        {
//            SqlCommand cmd_Store = new SqlCommand("delete from Store where Store_Name='" + TextBox8.Text + "' and Store_Phone='" + TextBox16.Text + "' and Store_ID='" + Convert.ToInt32(TextBox19.Text).ToString() + "'", con);
//            cmd_Store.ExecuteNonQuery();
//            con.Close();
//            Label9.Text = "Data has been deleted in Store";
//            GridView8.DataBind();
//            TextBox8.Text = "";
//            TextBox16.Text = "";
//        }

//        protected void Button13_Click(object sender, EventArgs e)
//        {
//            /*
//            *make resead button textbox for table and integer
//            * reset primary key auto increment
//            * DBCC CHECKIDENT('<Table Name>', RESEED, < integer to subtract, ie, 1 >)
//            */
//            SqlCommand cmd_Reseed = new SqlCommand("DBCC CHECKIDENT('" + TextBox21.Text + "', RESEED, '" + Convert.ToInt32(TextBox22.Text).ToString() + "')", con);
//            cmd_Reseed.ExecuteNonQuery();
//            con.Close();
//            Label9.Text = "Identity has been reseeded";
//            //GridView8.DataBind();
//            TextBox21.Text = "";
//            TextBox22.Text = "";
//        }


//        /* //Search by ID
//         * protected void <button>_<event>(object sender, EventArgs e){
//         *  string find = "select * from <table> where (<ID> like '%' +@<ID>+ '%')";
//         *  SqlCommand cmd = new sqlCommand(find,con);
//         *  cmd.Parameters.Add("@Id", SqlDbType.NVarChar).Value = <Textbox>.Text;
//         *  cmd.ExecuteNonQuery();
//         *  
//         *  SqlAdapter da = new SqlAdapter();
//         *  da.SelectCommand = cmd;
//         *  DataSet ds = new DataSet();
//         *  da.Fill(ds, "<ID>");
//         *  
//         *  GridView1.DataSourceID = null;
//         *  GridView1.DataSource = ds;
//         *  GridView1.DataBind();
//         *  
//         *  con.Close();
//         * 
//         * 
//         * }
//         * make resead button textbox for table and integer
//         * reset primary key auto increment
//         * DBCC CHECKIDENT ('<Table Name>', RESEED, <integer to subtract, ie, 1>)
//         * 
//         */
//    }
//}



//private void UpdateManagerStatus(bool isManager)
//{
//    string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString2BikeShop2"].ConnectionString;

//    using (SqlConnection conn = new SqlConnection(connectionString))
//    {
//        conn.Open();

//        // Split the selected value of the dropdown list into first and last names
//        string[] names = ddlManagerStaff.SelectedValue.Split(' ');
//        string firstName = names[0];
//        string lastName = names[1];

//        // Look up the corresponding Staff_ID in the Staff table
//        string selectQuery = @"
//    SELECT Staff_ID
//    FROM Staff
//    WHERE First_Name = @FirstName
//    AND Last_Name = @LastName
//";

//        using (SqlCommand selectCmd = new SqlCommand(selectQuery, conn))
//        {
//            selectCmd.Parameters.AddWithValue("@FirstName", firstName);
//            selectCmd.Parameters.AddWithValue("@LastName", lastName);

//            int staffId = (int)selectCmd.ExecuteScalar();

//            // Update the IsManager field in the Staff table
//            string updateQuery = @"
//        UPDATE Staff
//        SET IsManager = @IsManager
//        WHERE Staff_ID = @StaffId
//    ";

//            using (SqlCommand updateCmd = new SqlCommand(updateQuery, conn))
//            {
//                updateCmd.Parameters.AddWithValue("@IsManager", isManager);
//                updateCmd.Parameters.AddWithValue("@StaffId", staffId);

//                updateCmd.ExecuteNonQuery();

//                //we want to real time see manager change
//                GridView3.DataBind();
//                GridView2.DataBind();
//            }
//        }

//        conn.Close();
//    }
//}
//private void UpdateManagerStatus(bool isManager)
//{
//    string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString2BikeShop2"].ConnectionString;

//    using (SqlConnection conn = new SqlConnection(connectionString))
//    {
//        conn.Open();

//        // Split the selected value of the dropdown list into first and last names
//        //string selectedFullName = ddlManagerStaff.SelectedValue;
//        string selectedFullName = ddlManagerStaff.Text;

//        string[] names = selectedFullName.Split(' ');
//        string firstName = names[0];
//        string lastName = names[1];

//        // Look up the corresponding Staff_ID in the Staff table
//        string selectQuery = @"
//    SELECT Staff_ID
//    FROM Staff
//    WHERE First_Name = @FirstName
//    AND Last_Name = @LastName
//";

//        using (SqlCommand selectCmd = new SqlCommand(selectQuery, conn))
//        {
//            selectCmd.Parameters.AddWithValue("@FirstName", firstName);
//            selectCmd.Parameters.AddWithValue("@LastName", lastName);

//            int staffId = (int)selectCmd.ExecuteScalar();

//            // Update the IsManager field in the Staff table
//            string updateQuery = @"
//        UPDATE Staff
//        SET IsManager = @IsManager
//        WHERE Staff_ID = @StaffId
//    ";

//            using (SqlCommand updateCmd = new SqlCommand(updateQuery, conn))
//            {
//                updateCmd.Parameters.AddWithValue("@IsManager", isManager);
//                updateCmd.Parameters.AddWithValue("@StaffId", staffId);

//                updateCmd.ExecuteNonQuery();

//                //we want to real time see manager change
//                GridView3.DataBind();
//                GridView2.DataBind();
//            }
//        }

//        conn.Close();
//    }
//}
