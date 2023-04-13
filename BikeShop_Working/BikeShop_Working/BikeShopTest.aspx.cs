using System;
using System.Web;
using System.Linq;
using System.Data;
using System.Web.UI;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Collections.Generic;

namespace BikeShop_Working
{
    public partial class BikeShopTest : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();
        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        //Add Bike Brand
        protected void Button9_Click(object sender, EventArgs e)
        {
           // con.Open();
            SqlCommand cmd9 = new SqlCommand("insert into Bike_Brand values('" + TextBox11.Text + "')",con);
            cmd9.ExecuteNonQuery();
            con.Close();
            Label9.Text = "Data has been inserted into Bike_Brand";
            GridView1.DataBind();
            TextBox11.Text = "";
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            //write the inserts for all of the 
        }
        //Add Staff
        protected void Button_Staff_Click(object sender, EventArgs e)
        {
           // con.Open();
            SqlCommand cmd_Staff = new SqlCommand("insert into Staff values('" + TextBox4.Text + "' , '" + TextBox12.Text + "')", con);
            cmd_Staff.ExecuteNonQuery();
            con.Close();
            Label9.Text = "Data has been inserted into Staff";
            GridView7.DataBind();
            TextBox4.Text = "";
            TextBox11.Text = "";
        }

        //Add Customer
        protected void Button_Customer_Click(object sender, EventArgs e)
        {
            //con.Open();
            SqlCommand cmd_Customer = new SqlCommand("insert into Customer values('" + TextBox6.Text + "' , '" + TextBox13.Text + "', '" + TextBox14.Text + "', '" + TextBox15.Text + "')", con);
            cmd_Customer.ExecuteNonQuery();
            con.Close();
            Label9.Text = "Data has been inserted into Customer";
            GridView6.DataBind();
            TextBox6.Text = "";
            TextBox13.Text = "";
            TextBox14.Text = "";
            TextBox15.Text = "";
        }
        // Add Bike Catagory
        protected void Button_Catagory_Click(object sender, EventArgs e)
        {
            // con.Open();
            SqlCommand cmd_Catagory = new SqlCommand("insert into Bike_Catagory values('" + TextBox10.Text + "')", con);
            cmd_Catagory.ExecuteNonQuery();
            con.Close();
            Label9.Text = "Data has been inserted into Bike_Catagory";
            GridView2.DataBind();
            TextBox10.Text = "";
        }
        // Add Bike Name
        protected void Button7_Click(object sender, EventArgs e)
        {
            //con.Open();
            SqlCommand cmd_Bike_Name = new SqlCommand("insert into Bike_Name values('" + TextBox9.Text + "' , '" + DropDownList6.SelectedValue + "', '" + TextBox17.Text + "', '" + TextBox18.Text + "')", con);
            cmd_Bike_Name.ExecuteNonQuery();
            con.Close();
            Label9.Text = "Data has been inserted into Bike Name";
            GridView3.DataBind();
            TextBox9.Text = "";
            TextBox17.Text = "";
            TextBox18.Text = "";
        }
        //Store Insert
        protected void Button6_Click(object sender, EventArgs e)
        {
            // con.Open();
            SqlCommand cmd_Store = new SqlCommand("insert into Store values('" + TextBox8.Text + "' , '" + TextBox16.Text + "')", con);
            cmd_Store.ExecuteNonQuery();
            con.Close();
            Label9.Text = "Data has been inserted in Store";
            GridView8.DataBind();
            TextBox8.Text = "";
            TextBox16.Text = "";
        }
        //Store Update
        protected void Button10_Click(object sender, EventArgs e)
        {
            SqlCommand cmd_Store = new SqlCommand("update Store set Store_Name='"+TextBox8.Text+"', Store_Phone='"+TextBox16.Text+"' where Store_ID='"+Convert.ToInt32(TextBox19.Text).ToString()+"'", con);
            cmd_Store.ExecuteNonQuery();
            con.Close();
            Label9.Text = "Data has been updated in Store";
            GridView8.DataBind();
            TextBox8.Text = "";
            TextBox16.Text = "";
        }
        //Store Delete
        protected void Button11_Click(object sender, EventArgs e)
        {
            SqlCommand cmd_Store = new SqlCommand("delete from Store where Store_Name='" + TextBox8.Text + "' and Store_Phone='" + TextBox16.Text + "' and Store_ID='"+Convert.ToInt32(TextBox19.Text).ToString()+"'", con);
            cmd_Store.ExecuteNonQuery();
            con.Close();
            Label9.Text = "Data has been deleted in Store";
            GridView8.DataBind();
            TextBox8.Text = "";
            TextBox16.Text = "";
        }

        protected void Button13_Click(object sender, EventArgs e)
        {
            /*
            *make resead button textbox for table and integer
            * reset primary key auto increment
            * DBCC CHECKIDENT('<Table Name>', RESEED, < integer to subtract, ie, 1 >)
            */
            SqlCommand cmd_Reseed = new SqlCommand("DBCC CHECKIDENT('" + TextBox21.Text + "', RESEED, '" + Convert.ToInt32(TextBox22.Text).ToString() + "')", con);
            cmd_Reseed.ExecuteNonQuery();
            con.Close();
            Label9.Text = "Identity has been reseeded";
            //GridView8.DataBind();
            TextBox21.Text = "";
            TextBox22.Text = "";
        }


        /* //Search by ID
         * protected void <button>_<event>(object sender, EventArgs e){
         *  string find = "select * from <table> where (<ID> like '%' +@<ID>+ '%')";
         *  SqlCommand cmd = new sqlCommand(find,con);
         *  cmd.Parameters.Add("@Id", SqlDbType.NVarChar).Value = <Textbox>.Text;
         *  cmd.ExecuteNonQuery();
         *  
         *  SqlAdapter da = new SqlAdapter();
         *  da.SelectCommand = cmd;
         *  DataSet ds = new DataSet();
         *  da.Fill(ds, "<ID>");
         *  
         *  GridView1.DataSourceID = null;
         *  GridView1.DataSource = ds;
         *  GridView1.DataBind();
         *  
         *  con.Close();
         * 
         * 
         * }
         * make resead button textbox for table and integer
         * reset primary key auto increment
         * DBCC CHECKIDENT ('<Table Name>', RESEED, <integer to subtract, ie, 1>)
         * 
         */
    }
}