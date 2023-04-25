using System;
using System.Data;
using System.Text;
using System.Web.UI;
using System.Drawing;
using System.Xml.Linq;
using System.Diagnostics;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Collections.Generic;
using System.Security.Cryptography;
using System.Data.Entity.Core.Common.CommandTrees.ExpressionBuilder;

namespace BikeShop_Working
{
    public partial class BikeShop : System.Web.UI.Page
    {
        // FIXED establish connection first thing
        private SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString2BikeShop2"].ConnectionString);



        protected void Page_Init(object sender, EventArgs e)
        {
           /* // Populate the customers, stores, staff, and products DropDownList
            PopulateDropDownList(ddlCustomer, "SELECT Customer_ID, First_Name + ' ' + Last_Name AS FullName FROM Customers", "FullName", "Customer_ID");
            PopulateDropDownList(ddlStore, "SELECT Store_ID, Store_Name FROM Stores", "Store_Name", "Store_ID");
            PopulateDropDownList(ddlStaff, "SELECT Staff_ID, First_Name + ' ' + Last_Name AS FullName FROM Staff", "FullName", "Staff_ID");
            PopulateDropDownList(ddlProduct, "SELECT Product_ID, Product_Name FROM Products", "Product_Name", "Product_ID");
            PopulateDropDownList(ddlSourceStore, "SELECT Store_ID, Store_Name FROM Stores", "Store_Name", "Store_ID");
            */
            
            /*PopulateStoresDropDown();
            PopulateProductNamesDropDown();
            PopulateCustomerDropDown();
            PopulateSourceStoreDropDown();*/
        }
        /*protected void Page_Load(object sender, EventArgs e)
        {
            //if it should be called only once
            if (!Page.IsPostBack)
            {
                conn.Open();
                Label8.Text = "Products";

                // Populate the customers, stores, staff, and products DropDownList
               *//* PopulateStoresDropDown();
                PopulateProductNamesDropDown();
                PopulateCustomerDropDown();
                PopulateSourceStoreDropDown();*//*
               
            }
            // Populate any DropDownLists or other controls with initial data
            PopulateStaffDropDown();
            PopulateQuantityDropDown();
            PopulateProductDropDown();

            //Inventory and Products(Bike Names)
            PopulateBikeBrandsDropDownList();
            PopulateBikeCategoriesDropDownList();
            PopulateStoresDropDownList();
            PopulateProductNamesDropDownList();
            BindProductsGrid();
            BindInventoryGrid();

            //
            PopulateDDLBikeNameDropDownList();
            PopulateDDLCustomerNameDropDownList();
            PopulateDDLStoreNameDropDownList();
            PopulateDDLStaffNameDropDownList();
        }
*/

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                conn.Open();
                Label8.Text = "Products";
                // Populate the customers, stores, staff, and products DropDownList
                PopulateDropDownList(ddlCustomer, "SELECT Customer_ID, First_Name + ' ' + Last_Name AS FullName FROM Customers", "FullName", "Customer_ID");
                PopulateDropDownList(ddlStore, "SELECT Store_ID, Store_Name FROM Stores", "Store_Name", "Store_ID");
                PopulateDropDownList(ddlStaff, "SELECT Staff_ID, First_Name + ' ' + Last_Name AS FullName FROM Staff", "FullName", "Staff_ID");
                PopulateDropDownList(ddlProduct, "SELECT Product_ID, Product_Name FROM Products", "Product_Name", "Product_ID");
                PopulateDropDownList(ddlSourceStore, "SELECT Store_ID, Store_Name FROM Stores", "Store_Name", "Store_ID");

                //Inventory and Products(Bike Names)
                PopulateBikeBrandsDropDownList();
                PopulateBikeCategoriesDropDownList();
                PopulateStoresDropDownList();
                PopulateProductNamesDropDownList();

                // Bind the products and inventory grids
                BindProductsGrid();
                BindInventoryGrid();


                PopulateDDLBikeNameDropDownList();
                PopulateDDLCustomerNameDropDownList();
                PopulateDDLStoreNameDropDownList();
                PopulateDDLStaffNameDropDownList();
                BindSalesByStoreChart();

            }

            // Populate any other controls that need to be populated on each load
            PopulateStaffDropDown();
            PopulateQuantityDropDown();
            PopulateProductDropDown();

            
        }

        // Populate Dropdowns
        //.....................................................................................
        // FIXED
        //
        private void PopulateStoresDropDown()
        {
            PopulateDropDown("SELECT Store_ID, Store_Name FROM Stores", ddlStores, "Store_Name", "Store_ID");
        }

        private void PopulateProductNamesDropDown()
        {
            PopulateDropDown("SELECT Product_ID, Product_Name FROM Products", ddlProductNames, "Product_Name", "Product_ID");
        }

        private void PopulateCustomerDropDown()
        {
            PopulateDropDown("SELECT Customer_ID, First_Name + ' ' + Last_Name AS FullName FROM Customers", ddlCustomer, "FullName", "Customer_ID");
        }

        private void PopulateSourceStoreDropDown()
        {
            PopulateDropDown("SELECT Store_ID, Store_Name FROM Stores", ddlSourceStore, "Store_Name", "Store_ID");
        }

        //indirect

        private void PopulateDropDown(string query, DropDownList ddl, string textField, string valueField)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString2BikeShop2"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        ddl.DataSource = reader;
                        ddl.DataTextField = textField;
                        ddl.DataValueField = valueField;
                        ddl.DataBind();
                    }
                }
            }
        }

       //direct
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
            cmd.Parameters.AddWithValue("@CreditCard", EncryptCreditCard(encryptedCreditCard, pin));
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

      

        protected void btnAddStaff_Click(object sender, EventArgs e)
        {
            string firstName = txtStaffFirstName.Text;
            string lastName = txtStaffLastName.Text;
            string email = txtStaffEmail.Text;
            string phone = txtStaffPhone.Text;
            bool isManager = chkIsManager.Checked;
            int selectedStoreId = int.Parse(ddlStaffStore.SelectedValue);

            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString2BikeShop2"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string insertQuery = @"
                        INSERT INTO Staff
                            (First_Name, Last_Name, Email, Phone, IsManager)
                        VALUES
                            (@FirstName, @LastName, @Email, @Phone, @IsManager);
                        SELECT SCOPE_IDENTITY();";

                int newStaffId;
                using (SqlCommand cmd = new SqlCommand(insertQuery, conn))
                {
                    cmd.Parameters.AddWithValue("@FirstName", firstName);
                    cmd.Parameters.AddWithValue("@LastName", lastName);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Phone", phone);
                    cmd.Parameters.AddWithValue("@IsManager", isManager);

                    newStaffId = Convert.ToInt32(cmd.ExecuteScalar());
                }

                // Assign the new staff member to the selected store
                string assignStaffToStoreQuery = @"
                        INSERT INTO Staff_Store
                            (Staff_ID, Store_ID)
                        VALUES
                            (@StaffID, @StoreID)";

                using (SqlCommand cmd = new SqlCommand(assignStaffToStoreQuery, conn))
                {
                    cmd.Parameters.AddWithValue("@StaffID", newStaffId);
                    cmd.Parameters.AddWithValue("@StoreID", selectedStoreId);
                    cmd.ExecuteNonQuery();
                }

                conn.Close();
                // Clear the input fields after adding the staff member to correct gridview
                GridView3.DataBind();
                GridView2.DataBind();
                GridView8.DataBind();
                txtStaffFirstName.Text = "";
                txtStaffLastName.Text = "";
                txtStaffEmail.Text = "";
                txtStaffPhone.Text = "";
                chkIsManager.Checked = false;
                ddlStaffStore.SelectedIndex = 0;
                PopulateStoresDropDown();
                PopulateProductNamesDropDown();
                PopulateCustomerDropDown();
                PopulateSourceStoreDropDown();
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
        // FIXEDbtn
        //event handlers and helper methods
        
        //promote btn
        protected void btnPromote_Click(object sender, EventArgs e)
        {
            UpdateManagerStatus(true);
        }

        //demote 
        protected void btnDemote_Click(object sender, EventArgs e)
        {
            UpdateManagerStatus(false);
        }

        // FIXED
        //update manager, used by promote & demote, basically flips a bit
        //update the manager 
        //called by promote and demote
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
        //Add store and auto assign inventory
        protected void addStore_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString2BikeShop2"].ConnectionString))
            {
                conn.Open();

                // Insert the new store into the Stores table
                SqlCommand cmd = new SqlCommand("INSERT INTO Stores OUTPUT INSERTED.Store_ID VALUES (@StoreName, @StorePhone, @StoreEmail, @StoreStreet, @StoreCity, @StoreState, @StoreZip)", conn);
                cmd.Parameters.AddWithValue("@StoreName", TextBox1.Text);
                cmd.Parameters.AddWithValue("@StorePhone", TextBox2.Text);
                cmd.Parameters.AddWithValue("@StoreEmail", TextBox3.Text);
                cmd.Parameters.AddWithValue("@StoreStreet", TextBox4.Text);
                cmd.Parameters.AddWithValue("@StoreCity", TextBox5.Text);
                cmd.Parameters.AddWithValue("@StoreState", TextBox6.Text);
                cmd.Parameters.AddWithValue("@StoreZip", TextBox7.Text);

                int newStoreId = (int)cmd.ExecuteScalar();

                // Get all the bike Product_IDs
                List<int> bikeProductIds = new List<int>();
                using (SqlCommand getBikeProductIdsCmd = new SqlCommand("SELECT Product_ID FROM Products", conn))
                {
                    using (SqlDataReader reader = getBikeProductIdsCmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            bikeProductIds.Add(reader.GetInt32(0));
                        }
                    }
                }

                // Insert entries into the Stock table with a quantity of 10 for each bike
                foreach (int productId in bikeProductIds)
                {
                    SqlCommand insertStockCmd = new SqlCommand("INSERT INTO Stock (Store_ID, Product_ID, Quantity) VALUES (@StoreID, @ProductID, @Quantity)", conn);
                    insertStockCmd.Parameters.AddWithValue("@StoreID", newStoreId);
                    insertStockCmd.Parameters.AddWithValue("@ProductID", productId);
                    insertStockCmd.Parameters.AddWithValue("@Quantity", 10);
                    insertStockCmd.ExecuteNonQuery();
                }

                GridView9.DataBind();
                GridView6.DataBind();
                GridView12.DataBind();

                TextBox1.Text = "";
                TextBox2.Text = "";
                TextBox3.Text = "";
                TextBox4.Text = "";
                TextBox5.Text = "";
                TextBox6.Text = "";
                TextBox7.Text = "";
                Label1.Text = "Congratulations, You added a store!";
                PopulateStoresDropDown();
               // PopulateProductNamesDropDown();
               // PopulateCustomerDropDown();
                PopulateSourceStoreDropDown();
            }
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

        //Multiple Shopping Cart
        // object, list, then loop through and put it in database
        // OrderItem, representative of a cart item
        public class OrderItem
        {
            public int CustomerId { get; set; }
            public int StoreId { get; set; }
            public int StaffId { get; set; }
            public decimal Discount { get; set; }
            public DateTime OrderDate { get; set; }
            public int ProductId { get; set; }
            public int Quantity { get; set; }
            public int SourceStoreId { get; set; }
        }

        // Add a new private field to store the list of order items
        // The list of OrderItems is the shopping cart
        private List<OrderItem> OrderItems
        {
            get
            {
                //if this session has no order list yet
                if (Session["OrderItems"] == null)
                {
                    //create the cart
                    Session["OrderItems"] = new List<OrderItem>();
                }
                //return the empty cart for filling
                return (List<OrderItem>)Session["OrderItems"];
            }
        }

        // Add item to order, or add item to cart
        // and display it in a GridView attached to the database
        //.....................................................................................
        // FIXED
        protected void btnAddToOrder_Click(object sender, EventArgs e)
        {
            //get form info
            int customerId = Convert.ToInt32(ddlCustomer.SelectedValue);
            int storeId = Convert.ToInt32(ddlStore.SelectedValue);
            int staffId = Convert.ToInt32(ddlStaff.SelectedValue);
            decimal discount = Convert.ToDecimal(txtDiscount.Text);
            DateTime orderDate = DateTime.Now;
            int productId = Convert.ToInt32(ddlProduct.SelectedValue);
            int quantity = Convert.ToInt32(ddlQuantity.SelectedValue);
            int sourceStoreId = Convert.ToInt32(ddlSourceStore.SelectedValue);

            //save form info to object
            OrderItems.Add(new OrderItem
            {
                CustomerId = customerId,
                StoreId = storeId,
                StaffId = staffId,
                Discount = discount,
                OrderDate = orderDate,
                ProductId = productId,
                Quantity = quantity,
                SourceStoreId = sourceStoreId
            });
            // Bind the GridView to the OrderItems list and update the display
            //display in the GridView
            gvOrderItems.DataSource = OrderItems;
            gvOrderItems.DataBind();
            lblMessage.Text = "Item added to order!";
        }

        // Multiple Orders
        //.....................................................................................
        
        protected void btnPlaceOrder_Click(object sender, EventArgs e)
        {
            //check to mke sure order isn't empty
            if (OrderItems.Count == 0)
            {
                lblMessage.Text = "Please add at least one item to your order.";
                return;
            }
            //get the first order item
            OrderItem firstOrderItem = OrderItems[0];

            //connect to database 
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString2BikeShop2"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                // open connection
                conn.Open();

                // Insert the order data into the Orders table
                string insertOrderQuery = "INSERT INTO Orders (Customer_ID, Staff_ID, Store_ID, Order_Date, Discount) OUTPUT INSERTED.Order_ID VALUES (@CustomerID, @StaffID, @StoreID, @OrderDate, @Discount)";
                int orderId;
                
                // make the sql command
                using (SqlCommand cmd = new SqlCommand(insertOrderQuery, conn))
                {
                    cmd.Parameters.AddWithValue("@CustomerID", firstOrderItem.CustomerId);
                    cmd.Parameters.AddWithValue("@StaffID", firstOrderItem.StaffId);
                    cmd.Parameters.AddWithValue("@StoreID", firstOrderItem.StoreId);
                    cmd.Parameters.AddWithValue("@OrderDate", firstOrderItem.OrderDate);
                    cmd.Parameters.AddWithValue("@Discount", firstOrderItem.Discount);
                    //get the first col, first row
                    orderId = (int)cmd.ExecuteScalar();
                }

                // Loop through the order items list and insert them into the Order_Items table
                foreach (OrderItem orderItem in OrderItems)
                {
                    // insert into order_items table
                    try
                    {
                        string insertOrderItemQuery = "INSERT INTO Order_Items (Order_ID, Product_ID, Quantity, Source_Store_ID) VALUES (@OrderID, @ProductID, @Quantity, @SourceStoreID)";
                        using (SqlCommand cmd2 = new SqlCommand(insertOrderItemQuery, conn))
                        {
                            cmd2.Parameters.AddWithValue("@OrderID", orderId);
                            cmd2.Parameters.AddWithValue("@ProductID", orderItem.ProductId);
                            cmd2.Parameters.AddWithValue("@Quantity", orderItem.Quantity);
                            cmd2.Parameters.AddWithValue("@SourceStoreID", orderItem.SourceStoreId);
                            cmd2.ExecuteNonQuery();
                        }
                    }
                    catch (Exception ex)
                    {
                        lblMessage.Text = $"Error inserting the Stock table: {ex.Message}";
                        return;
                    }

                    // update quantity in stock table
                    try
                    {
                        string updateStockQuery = "UPDATE Stock SET Quantity = Quantity - @Quantity WHERE Product_ID = @ProductID AND Store_ID = @SourceStoreID";
                        using (SqlCommand cmd3 = new SqlCommand(updateStockQuery, conn))
                        {
                            cmd3.Parameters.AddWithValue("@Quantity", orderItem.Quantity);
                            cmd3.Parameters.AddWithValue("@ProductID", orderItem.ProductId);
                            cmd3.Parameters.AddWithValue("@SourceStoreID", orderItem.SourceStoreId);
                            cmd3.ExecuteNonQuery();
                        }
                    }
                    catch (Exception ex)
                    {
                        lblMessage.Text = $"Error updating the Stock table: {ex.Message}";
                        return;
                    }
                }

                conn.Close();
            }

            // Clear the list of order items
            OrderItems.Clear();

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
            //remove the order gridview once it is placed
            pnlContainer.Controls.Remove(gvOrderItems);
        }

        ///
        //  untested
        ///

        /*
         *       -	(5 points) all items sold on all orders – display cust name, order id, store name, bike name, qty sold
                    o	(1 point) pick just name from pull down list
                    o	Select (cust_id), (order id), (store name) (bike name) (qty sold)—which is 10(starting amount) – qty per store
         *
         */

        protected void btnFetchSoldItems_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString2BikeShop2"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                string query = @"
            SELECT
                c.Last_Name AS CustomerName,
                o.Order_ID AS OrderId,
                s.Store_Name AS StoreName,
                p.Product_Name AS BikeName,
                oi.Quantity AS QuantitySold
            FROM Order_Items AS oi
            INNER JOIN Orders AS o ON oi.Order_ID = o.Order_ID
            INNER JOIN Customers AS c ON o.Customer_ID = c.Customer_ID
            INNER JOIN Stores AS s ON o.Store_ID = s.Store_ID
            INNER JOIN Products AS p ON oi.Product_ID = p.Product_ID
        ";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);
                    gvSoldItems.DataSource = dt;
                    gvSoldItems.DataBind();
                }

                conn.Close();
            }
        }

       

        protected void btnFetchAvailableBikes_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString2BikeShop2"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                string query = @"
            SELECT
                p.Product_Name AS BikeName,
                s.Store_Name AS StoreName,
                st.Quantity AS Quantity,
                bb.Brand_Name AS BrandName,
                bc.Category_Name AS CategoryName,
                ss.Store_Name AS SourceStoreName,
                stf.Last_Name AS StaffName,
                o.Discount AS Discount
            FROM Stock AS st
            INNER JOIN Products AS p ON st.Product_ID = p.Product_ID
            INNER JOIN Stores AS s ON st.Store_ID = s.Store_ID
            INNER JOIN Bike_Brands AS bb ON p.Brand_ID = bb.Brand_ID
            INNER JOIN Bike_Categories AS bc ON p.Category_ID = bc.Category_ID
            INNER JOIN Order_Items AS oi ON p.Product_ID = oi.Product_ID
            INNER JOIN Stores AS ss ON oi.Source_Store_ID = ss.Store_ID
            INNER JOIN Orders AS o ON oi.Order_ID = o.Order_ID
            INNER JOIN Staff AS stf ON o.Staff_ID = stf.Staff_ID
        ";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);
                    gvAvailableBikes.DataSource = dt;
                    gvAvailableBikes.DataBind();
                }

                conn.Close();
            }
        }

        //-	(5 points) Items Sold – list all items sold for each store by bike name and qty

        protected void btnFetchItemsSold_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString2BikeShop2"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                string query = @"
            SELECT
                s.Store_Name AS StoreName,
                p.Product_Name AS BikeName,
                SUM(oi.Quantity) AS QuantitySold
            FROM Order_Items AS oi
            INNER JOIN Orders AS o ON oi.Order_ID = o.Order_ID
            INNER JOIN Stores AS s ON o.Store_ID = s.Store_ID
            INNER JOIN Products AS p ON oi.Product_ID = p.Product_ID
            GROUP BY s.Store_Name, p.Product_Name
        ";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);
                    gvItemsSold.DataSource = dt;
                    gvItemsSold.DataBind();
                }

                conn.Close();
            }
        }

        //-	(5 points) Items sold by each staff members – list of items sold by each staff member name include bike name and qty sold
        protected void btnFetchStaffSales_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString2BikeShop2"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                string query = @"
            SELECT
                stf.Last_Name AS StaffName,
                p.Product_Name AS BikeName,
                SUM(oi.Quantity) AS QuantitySold
            FROM Order_Items AS oi
            INNER JOIN Orders AS o ON oi.Order_ID = o.Order_ID
            INNER JOIN Staff AS stf ON o.Staff_ID = stf.Staff_ID
            INNER JOIN Products AS p ON oi.Product_ID = p.Product_ID
            GROUP BY stf.Last_Name, p.Product_Name
        ";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);
                    gvStaffSales.DataSource = dt;
                    gvStaffSales.DataBind();
                }
                conn.Close();
            }
        }

        //Part 2
        
       

        private void PopulateBikeBrandsDropDownList()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString2BikeShop2"].ConnectionString;
            string query = "SELECT Brand_ID, Brand_Name FROM Bike_Brands";

            using (SqlConnection con = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                con.Open();

                SqlDataReader reader = cmd.ExecuteReader();
                ddlBikeBrands.DataSource = reader;
                ddlBikeBrands.DataTextField = "Brand_Name";
                ddlBikeBrands.DataValueField = "Brand_ID";
                ddlBikeBrands.DataBind();
            }
        }

        private void PopulateBikeCategoriesDropDownList()
        {
            // Similar to PopulateBikeBrandsDropDownList(), just change the query and DropDownList.
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString2BikeShop2"].ConnectionString;
            string query = "SELECT Category_ID, Category_Name FROM Bike_Categories";

            using (SqlConnection con = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                con.Open();

                SqlDataReader reader = cmd.ExecuteReader();
                ddlBikeCategories.DataSource = reader;
                ddlBikeCategories.DataTextField = "Category_Name";
                ddlBikeCategories.DataValueField = "Category_ID";
                ddlBikeCategories.DataBind();
            }
        }

        private void PopulateStoresDropDownList()
        {
            // Similar to PopulateBikeBrandsDropDownList(), just change the query and DropDownList.
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString2BikeShop2"].ConnectionString;
            string query = "SELECT Store_ID, Store_Name FROM Stores";

            using (SqlConnection con = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                con.Open();

                SqlDataReader reader = cmd.ExecuteReader();
                ddlStores.DataSource = reader;
                ddlStores.DataValueField = "Store_ID";
                ddlStores.DataTextField = "Store_Name";
                ddlStores.DataBind();
            }
        }

        private void PopulateProductNamesDropDownList()
        {
            // Similar to PopulateBikeBrandsDropDownList(), just change the query and DropDownList.
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString2BikeShop2"].ConnectionString;
            string query = "SELECT Product_ID, Product_Name FROM Products";

            using (SqlConnection con = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                con.Open();

                SqlDataReader reader = cmd.ExecuteReader();
                ddlProductNames.DataSource = reader;
                ddlProductNames.DataValueField = "Product_ID";
                ddlProductNames.DataTextField = "Product_Name";
                ddlProductNames.DataBind();
            }
        }

        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString2BikeShop2"].ConnectionString;
            string query = "INSERT INTO Products (Product_Name, Brand_ID, Category_ID, Model_Year, List_Price) OUTPUT INSERTED.Product_ID VALUES (@ProductName, @BrandID, @CategoryID, @ModelYear, @ListPrice)";

            
            using (SqlConnection con = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@ProductName", txtProductName.Text);
                cmd.Parameters.AddWithValue("@BrandID", ddlBikeBrands.SelectedValue);
                cmd.Parameters.AddWithValue("@CategoryID", ddlBikeCategories.SelectedValue);
                cmd.Parameters.AddWithValue("@ModelYear", txtModelYear.Text);
                cmd.Parameters.AddWithValue("@ListPrice", txtListPrice.Text);

                con.Open();

                try
                {
                    int productId = (int)cmd.ExecuteScalar();
                    lblMessage.Text = "Product added successfully! Product ID: " + productId;
                    ClearProductFields();
                    BindProductsGrid();
                }
                catch (Exception ex)
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = "Error: " + ex.Message;
                }
            }
            // After inserting a new product, update the dropdowns:
            //PopulateBikeBrandsDropDownList();
            //PopulateBikeCategoriesDropDownList();
            //PopulateStoresDropDownList();
            PopulateProductNamesDropDownList();
        }
        /*-	(10 points) Add inventory to stores - fill in row properly in stock table: auto gen stock id, bike name id, qty and store id
           o(2 point) Pull down bike names and store names
           o   Add bike name to stock table,
       */

        protected void btnAddInventory_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString2BikeShop2"].ConnectionString;
            string selectQuery = "SELECT Stock_ID, Quantity FROM Stock WHERE Store_ID = @StoreID AND Product_ID = @ProductID";
            string updateQuery = "UPDATE Stock SET Quantity = @NewQuantity WHERE Stock_ID = @StockID";
            string insertQuery = "INSERT INTO Stock (Store_ID, Product_ID, Quantity) OUTPUT INSERTED.Stock_ID VALUES (@StoreID, @ProductID, @Quantity)";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                using (SqlCommand cmd = new SqlCommand(selectQuery, con))
                {
                    cmd.Parameters.AddWithValue("@StoreID", int.Parse(ddlStores.SelectedValue));
                    cmd.Parameters.AddWithValue("@ProductID", int.Parse(ddlProductNames.SelectedValue));

                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.HasRows) // If a matching record exists, update the quantity
                    {
                        reader.Read();
                        int stockId = reader.GetInt32(0);
                        int currentQuantity = reader.GetInt32(1);
                        int newQuantity = currentQuantity + int.Parse(txtQuantity.Text);

                        reader.Close();

                        using (SqlCommand updateCmd = new SqlCommand(updateQuery, con))
                        {
                            updateCmd.Parameters.AddWithValue("@StockID", stockId);
                            updateCmd.Parameters.AddWithValue("@NewQuantity", newQuantity);

                            updateCmd.ExecuteNonQuery();

                            lblMessage.Text = "Inventory updated successfully! New quantity: " + newQuantity;
                        }
                    }
                    else // If no matching record exists, insert a new record
                    {
                        reader.Close();

                        using (SqlCommand insertCmd = new SqlCommand(insertQuery, con))
                        {
                            insertCmd.Parameters.AddWithValue("@StoreID", ddlStores.SelectedValue);
                            insertCmd.Parameters.AddWithValue("@ProductID", ddlProductNames.SelectedValue);
                            insertCmd.Parameters.AddWithValue("@Quantity", txtQuantity.Text);

                            try
                            {
                                int stockId = (int)insertCmd.ExecuteScalar();
                                lblMessage.Text = "Inventory added successfully! Stock ID: " + stockId;
                            }
                            catch (Exception ex)
                            {
                                lblMessage.ForeColor = System.Drawing.Color.Red;
                                lblMessage.Text = "Error: " + ex.Message;
                            }
                        }
                    }
                }
            }

            // After updating or inserting a new inventory, update the dropdowns:
            //PopulateBikeBrandsDropDownList();
            //PopulateBikeCategoriesDropDownList();
            //PopulateStoresDropDownList();
            //PopulateProductNamesDropDownList();
            PopulateQuantityDropDown();
            //Bind to page
            BindInventoryGrid();

        }

        private void BindProductsGrid()
        {
            // Similar to PopulateBikeBrandsDropDownList(), just change the query and bind data to GridView.
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString2BikeShop2"].ConnectionString;
            string query = "SELECT p.Product_ID, p.Product_Name, bb.Brand_Name, bc.Category_Name, p.Model_Year, p.List_Price FROM Products p INNER JOIN Bike_Brands bb ON p.Brand_ID = bb.Brand_ID INNER JOIN Bike_Categories bc ON p.Category_ID = bc.Category_ID";

            using (SqlConnection con = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                con.Open();

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvProducts.DataSource = dt;
                gvProducts.DataBind();
            }
        }

        private void BindInventoryGrid()
        {
            // Similar to BindProductsGrid(), just change the query and GridView.
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString2BikeShop2"].ConnectionString;
            string query = "SELECT s.Stock_ID, st.Store_Name, p.Product_Name, s.Quantity FROM Stock s INNER JOIN Stores st ON s.Store_ID = st.Store_ID INNER JOIN Products p ON s.Product_ID = p.Product_ID";

            using (SqlConnection con = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                con.Open();

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvInventory.DataSource = dt;
                gvInventory.DataBind();
            }

        }

        private void ClearProductFields()
        {
            txtProductName.Text = "";
            txtModelYear.Text = "";
            txtListPrice.Text = "";
        }

        //add and change staff stores
        private int GetStaffId(string firstName, string lastName)
        {
            int staffId = -1;
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString2BikeShop2"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "SELECT Staff_ID FROM dbo.Staff WHERE First_Name = @firstName AND Last_Name = @lastName";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@firstName", firstName);
                    command.Parameters.AddWithValue("@lastName", lastName);
                    object result = command.ExecuteScalar();
                    if (result != null)
                    {
                        staffId = Convert.ToInt32(result);
                    }
                }
            }

            return staffId;
        }

        protected void btnAddStore_Click(object sender, EventArgs e)
        {
            int staffId = GetStaffId(TextBox98.Text, TextBox99.Text);
            if (staffId != -1)
            {
                string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString2BikeShop2"].ConnectionString;
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "INSERT INTO dbo.Staff_Store (Staff_ID, Store_ID) VALUES (@staffId, @storeId)";
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@staffId", staffId);
                        command.Parameters.AddWithValue("@storeId", DropDownList91.SelectedValue);
                        command.ExecuteNonQuery();
                    }
                }
            }
            TextBox98.Text = "";
            TextBox99.Text = "";
            DropDownList91.SelectedIndex=0;
            GridView8.DataBind();
        }

        protected void btnChangeStore_Click(object sender, EventArgs e)
        {
            int staffId = GetStaffId(TextBox98.Text, TextBox99.Text);
            if (staffId != -1)
            {
                string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString2BikeShop2"].ConnectionString;
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    string deleteQuery = "DELETE FROM dbo.Staff_Store WHERE Staff_ID = @staffId";
                    using (SqlCommand deleteCommand = new SqlCommand(deleteQuery, connection))
                    {
                        deleteCommand.Parameters.AddWithValue("@staffId", staffId);
                        deleteCommand.ExecuteNonQuery();
                    }

                    string insertQuery = "INSERT INTO dbo.Staff_Store (Staff_ID, Store_ID) VALUES (@staffId, @storeId)";
                    using (SqlCommand insertCommand = new SqlCommand(insertQuery, connection))
                    {
                        insertCommand.Parameters.AddWithValue("@staffId", staffId);
                        insertCommand.Parameters.AddWithValue("@storeId", DropDownList91.SelectedValue);
                        insertCommand.ExecuteNonQuery();
                    }
                }
            }
            TextBox98.Text = "";
            TextBox99.Text = "";
            DropDownList91.SelectedIndex = 0;
            GridView8.DataBind();
        }

        private void BindDataToGridView(SqlCommand command, GridView gridView)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString2BikeShop2"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                command.Connection = connection;
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);
                gridView.DataSource = dataTable;
                gridView.DataBind();
            }
        }

        private void PopulateDDLCustomerNameDropDownList()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString2BikeShop2"].ConnectionString;
            string query = "SELECT Customer_ID, First_Name + ' ' + Last_Name as Customer_Name FROM Customers";

            using (SqlConnection con = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                con.Open();

                SqlDataReader reader = cmd.ExecuteReader();
                ddlCustomerName.DataSource = reader;
                ddlCustomerName.DataTextField = "Customer_Name";
                ddlCustomerName.DataValueField = "Customer_ID";
                ddlCustomerName.DataBind();
            }
        }
        protected void ddlCustomerName_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedCustomerID = ddlCustomerName.SelectedValue;
            string query = $@"SELECT Customers.First_Name, Customers.Last_Name, Orders.Order_ID, Stores.Store_Name, Products.Product_Name, Order_Items.Quantity
                     FROM Customers
                     JOIN Orders ON Customers.Customer_ID = Orders.Customer_ID
                     JOIN Stores ON Orders.Store_ID = Stores.Store_ID
                     JOIN Order_Items ON Orders.Order_ID = Order_Items.Order_ID
                     JOIN Products ON Order_Items.Product_ID = Products.Product_ID
                     WHERE Customers.Customer_ID = {selectedCustomerID}";
            /*string query = $@"SELECT Customers.First_Name, Customers.Last_Name, Orders.Order_ID, Stores.Store_Name, Products.Product_Name, Order_Items.Quantity
                  FROM Customers
                  JOIN Orders ON Customers.Customer_ID = Orders.Customer_ID
                  JOIN Stores ON Orders.Store_ID = Stores.Store_ID
                  JOIN Order_Items ON Orders.Order_ID = Order_Items.Order_ID
                  JOIN Products ON Order_Items.Product_ID = Products.Product_ID
                  WHERE Customers.Customer_ID = {selectedCustomerID}";*/
            SqlCommand command = new SqlCommand(query);
            //command.Parameters.AddWithValue("@CustomerName", ddlCustomerName.SelectedValue);

            BindDataToGridView(command, gvSoldItemsByCustomer);
        }
        
        /*-	(10 points) Add Bike Name(Products) – fill in row properly in Bike(Product) take(Auto gen bike name id, bike name, bike brand id, bike cat id, model year, price
          o   (2 points) Pull down bike brand and bike category
      */
        private void PopulateDDLBikeNameDropDownList()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString2BikeShop2"].ConnectionString;
            string query = "SELECT Product_ID, Product_Name FROM Products";

            using (SqlConnection con = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                ddlBikeName.DataSource = reader;
                ddlBikeName.DataTextField = "Product_Name";
                ddlBikeName.DataValueField = "Product_ID";
                ddlBikeName.DataBind();
            }
        }
       
        protected void ddlBikeName_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedBikeNameID = ddlBikeName.SelectedValue;
            string query = $@"SELECT Products.Product_Name, Stores.Store_Name, Order_Items.Quantity, Bike_Brands.Brand_Name, Bike_Categories.Category_Name, SourceStores.Store_Name AS Source_Store_Name, Staff.First_Name, Staff.Last_Name, Orders.Discount
                 FROM Order_Items
                 JOIN Products ON Order_Items.Product_ID = Products.Product_ID
                 JOIN Stores ON Order_Items.Source_Store_ID = Stores.Store_ID
                 JOIN Bike_Brands ON Products.Brand_ID = Bike_Brands.Brand_ID
                 JOIN Bike_Categories ON Products.Category_ID = Bike_Categories.Category_ID
                 JOIN Stores AS SourceStores ON Order_Items.Source_Store_ID = SourceStores.Store_ID
                 JOIN Orders ON Order_Items.Order_ID = Orders.Order_ID
                 JOIN Staff ON Orders.Staff_ID = Staff.Staff_ID
                 WHERE Products.Product_ID = {selectedBikeNameID}";

            SqlCommand command = new SqlCommand(query);
            //command.Parameters.AddWithValue("@BikeName", ddlBikeName.SelectedValue);

            BindDataToGridView(command, gvBikeQuantityByBikeName);
        }

        /*
        *
        * -	(5 points) Bike qty available at all stores – display bike name,
        * store name of sale, qty, bike brand name, bike category name, store name where bike is from,
        * staff name that placed the order, discount amount on the order
               o	(1 point) Pick from bike name pull down
        */
        private void PopulateDDLStoreNameDropDownList()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString2BikeShop2"].ConnectionString;
            string query = "SELECT Store_ID, Store_Name FROM Stores";

            using (SqlConnection con = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                ddlStoreName.DataSource = reader;
                ddlStoreName.DataTextField = "Store_Name";
                ddlStoreName.DataValueField = "Store_ID";
                ddlStoreName.DataBind();
            }
        }
        /* protected void ddlStoreName_SelectedIndexChanged(object sender, EventArgs e)
         {
             string selectedStoreID = ddlStoreName.SelectedValue;
             string query = $@"SELECT Products.Product_Name, SUM(Order_Items.Quantity) AS Total_Sold
                      FROM Order_Items
                      JOIN Orders ON Order_Items.Order_ID = Orders.Order_ID
                      JOIN Products ON Order_Items.Product_ID = Products.Product_ID
                      WHERE Orders.Store_ID = {selectedStoreID}
                      GROUP BY Products.Product_Name";
             SqlCommand command = new SqlCommand(query);
             //command.Parameters.AddWithValue("@StoreName", ddlStoreName.SelectedValue);

             BindDataToGridView(command, gvItemsSoldByStore);
         }*/
        protected void ddlStoreName_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedStoreID = ddlStoreName.SelectedValue;
            string query = $@"SELECT 
                        Products.Product_Name, 
                        Stores.Store_Name AS Store_Name_of_Sale, 
                        SUM(Order_Items.Quantity) AS Qty, 
                        Brands.Brand_Name,
                        Categories.Category_Name,
                        SourceStores.Store_Name AS Source_Store_Name, 
                        Staff.First_Name + ' ' + Staff.Last_Name AS Staff_Name,
                        Orders.Discount_Amount
                     FROM Order_Items
                     JOIN Orders ON Order_Items.Order_ID = Orders.Order_ID
                     JOIN Products ON Order_Items.Product_ID = Products.Product_ID
                     JOIN Stores ON Orders.Store_ID = Stores.Store_ID
                     JOIN Staff ON Orders.Staff_ID = Staff.Staff_ID
                     JOIN Stores AS SourceStores ON Products.Store_ID = SourceStores.Store_ID
                     JOIN Brands ON Products.Brand_ID = Brands.Brand_ID
                     JOIN Categories ON Products.Category_ID = Categories.Category_ID
                     WHERE Orders.Store_ID = {selectedStoreID}
                     GROUP BY Products.Product_Name, 
                              Stores.Store_Name, 
                              Brands.Brand_Name, 
                              Categories.Category_Name, 
                              SourceStores.Store_Name, 
                              Staff.First_Name, 
                              Staff.Last_Name, 
                              Orders.Discount_Amount";
            SqlCommand command = new SqlCommand(query);

            BindDataToGridView(command, gvItemsSoldByStore);
        }

        private void PopulateDDLStaffNameDropDownList()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString2BikeShop2"].ConnectionString;
/*            string query = "SELECT Staff_ID, Last_Name FROM Staff";
*/            string query = "SELECT Staff_ID, First_Name + ' ' + Last_Name as Staff_Name FROM Staff";

            using (SqlConnection con = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                ddlStaffName.DataSource = reader;
                ddlStaffName.DataTextField = "Staff_Name";
                ddlStaffName.DataValueField = "Staff_ID";
                ddlStaffName.DataBind();
            }
        }
        protected void ddlStaffName_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedStaffID = ddlStaffName.SelectedValue;
            string query = $@"SELECT Products.Product_Name, SUM(Order_Items.Quantity) AS Total_Sold
                     FROM Order_Items
                     JOIN Orders ON Order_Items.Order_ID = Orders.Order_ID
                     JOIN Products ON Order_Items.Product_ID = Products.Product_ID
                     WHERE Orders.Staff_ID = {selectedStaffID}
                     GROUP BY Products.Product_Name";


            SqlCommand command = new SqlCommand(query);
           // command.Parameters.AddWithValue("@StaffName", ddlStaffName.SelectedValue);

            BindDataToGridView(command, gvItemsSoldByStaff);
        }


        private void BindSalesByStoreChart()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString2BikeShop2"].ConnectionString;
            string query = @"SELECT Stores.Store_Name, SUM(Order_Items.Quantity * Products.List_Price) AS Total_Sales
                     FROM Order_Items
                     JOIN Orders ON Order_Items.Order_ID = Orders.Order_ID
                     JOIN Products ON Order_Items.Product_ID = Products.Product_ID
                     JOIN Stores ON Orders.Store_ID = Stores.Store_ID
                     GROUP BY Stores.Store_Name";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(query, connection);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);

                SalesByStoreChart.DataSource = dataTable;
                SalesByStoreChart.DataBind();
            }
        }

    }
}















/*
protected void btnAddInventory_Click(object sender, EventArgs e)
{
    using (SqlConnection conn = new SqlConnection(connectionString))
    {
        conn.Open();

        string query = "INSERT INTO Stock (Store_ID, Product_ID, Quantity) VALUES (@StoreID, @ProductID, @Quantity)";
        SqlCommand cmd = new SqlCommand(query, conn);
        cmd.Parameters.AddWithValue("@StoreID", ddlStores.SelectedValue);
        cmd.Parameters.AddWithValue("@ProductID", ddlProductNames.SelectedValue);
        cmd.Parameters.AddWithValue("@Quantity", txtQuantity.Text);

        cmd.ExecuteNonQuery();
        lblMessage.Text = "Inventory added to store successfully!";
    }
}






private void PopulateBikeBrandsDropDown()
{
    using (SqlConnection conn = new SqlConnection(connectionString))
    {
        string query = "SELECT Brand_ID, Brand_Name FROM Bike_Brands";
        SqlDataAdapter da = new SqlDataAdapter(query, conn);
        DataTable dt = new DataTable();
        da.Fill(dt);

        ddlBikeBrands.DataSource = dt;
        ddlBikeBrands.DataTextField = "Brand_Name";
        ddlBikeBrands.DataValueField = "Brand_ID";
        ddlBikeBrands.DataBind();
    }
}

protected void btnAddProduct_Click(object sender, EventArgs e)
{
    using (SqlConnection conn = new SqlConnection(connectionString))
    {
        conn.Open();

        string query = "INSERT INTO Products (Product_Name, Brand_ID, Category_ID, Model_Year, List_Price) VALUES (@ProductName, @BrandID, @CategoryID, @ModelYear, @ListPrice)";
        SqlCommand cmd = new SqlCommand(query, conn);
        cmd.Parameters.AddWithValue("@ProductName", txtProductName.Text);
        cmd.Parameters.AddWithValue("@BrandID", ddlBikeBrands.SelectedValue);
        cmd.Parameters.AddWithValue("@CategoryID", ddlBikeCategories.SelectedValue);
        cmd.Parameters.AddWithValue("@ModelYear", txtModelYear.Text);
        cmd.Parameters.AddWithValue("@ListPrice", txtListPrice.Text);

        cmd.ExecuteNonQuery();
        lblMessage.Text = "Product added successfully!";
    }
}


*//*      protected void ddlBikeName_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedBikeNameID = ddlBikeName.SelectedValue;
            string query = $@"SELECT Products.Product_Name, Stores.Store_Name, Order_Items.Quantity, Bike_Brands.Brand_Name, Bike_Categories.Category_Name, SourceStores.Store_Name AS Source_Store_Name, Staff.First_Name, Staff.Last_Name, Orders.Discount
                     FROM Order_Items
                     JOIN Products ON Order_Items.Product_ID = Products.Product_ID
                     JOIN Stores ON Order_Items.Source_Store_ID = Stores.Store_ID
                     JOIN Bike_Brands ON Products.Brand_ID = Bike_Brands.Brand_ID
                     JOIN Bike_Categories ON Products.Category_ID = Bike_Categories.Category_ID
                     JOIN Stores AS SourceStores ON Order_Items.Source_Store_ID = SourceStores.Store_ID
                     JOIN Orders ON Order_Items.Order_ID = Orders.Order_ID
                     JOIN Staff ON Orders.Staff_ID = Staff.Staff_ID
                     WHERE Products.Bike_Name_ID = {selectedBikeNameID}";


            SqlCommand command = new SqlCommand(query);
            command.Parameters.AddWithValue("@BikeName", ddlBikeName.SelectedValue);

            BindDataToGridView(command, gvBikeQuantityByBikeName);
        }
    */