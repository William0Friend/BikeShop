using System;
using System.Web;
using System.Linq;
using System.Text;
using System.Web.UI;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Collections.Generic;
using System.Security.Cryptography;

namespace BikeShop_Working
{
    public partial class BikeShop2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
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

            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString2BikeShop2"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string insertQuery = @"
           INSERT INTO Customer
               (Cust_FirstName, Cust_LastName, Cust_CreditCard, Cust_PIN, Cust_Phone, Cust_Email, Cust_Street, Cust_City, Cust_State, Cust_Zip)
           VALUES
               (@FirstName, @LastName, @CreditCard, @PIN, @Phone, @Email, @Street, @City, @State, @Zip)";

                using (SqlCommand cmd = new SqlCommand(insertQuery, conn))
                {
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
                }
            }

            // Clear the input fields after adding the customer
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
    }
}