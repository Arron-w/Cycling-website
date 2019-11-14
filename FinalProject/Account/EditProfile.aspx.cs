using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace FinalProject.Account
{
    public partial class EditProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["dbaw16abnConnectionString"].ConnectionString;


            SqlConnection conn = new SqlConnection(connStr);
            String sql = "SELECT Picture, Postcode, Description from UserProfile WHERE fkUsername =@fkUsername";
            SqlCommand sqlCmd = new SqlCommand(sql, conn);
            conn.Open();
            sqlCmd.Parameters.AddWithValue("@fkUsername", User.Identity.Name);
            SqlDataReader sqlDr = sqlCmd.ExecuteReader();
            sqlDr.Read();
            try
            {
                tbPostCode.Text = sqlDr["PostCode"].ToString();
            } catch
            {
                if (tbPostCode.Text == ""){
                    tbPostCode.Text= "Not provided";
                }
            }
            try { tbDescription.Text = sqlDr["Description"].ToString(); }
            catch
            {
                if (tbDescription.Text == "")
                {
                    tbDescription.Text = "Not provided";
                }
            }
            

        }

        protected void btnUpdateProfile_Click(object sender, EventArgs e)
        {
            string existingFileName = fuProfilePic.FileName;


            string filesFolder = Server.MapPath("~/Images");

            var path = Path.Combine(Directory.GetCurrentDirectory(), filesFolder, existingFileName);




            if (fuProfilePic.HasFile)
            {


                fuProfilePic.SaveAs(path);

            }


            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["dbaw16abnConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand insert;

            if (fuProfilePic.HasFile)
            {
                insert = new SqlCommand("UPDATE UserProfile SET Picture=@Picture, Postcode= @Postcode, Description=@Description WHERE fkUsername = @fkUsername", conn);
                insert.Parameters.AddWithValue("@Picture", fuProfilePic.FileName);
            }
            else
            {
                insert = new SqlCommand("UPDATE UserProfile SET Postcode= @Postcode, Description=@Description WHERE fkUsername = @fkUsername", conn);
            }

            
            insert.Parameters.AddWithValue("@Postcode", tbPostCode.Text);
            insert.Parameters.AddWithValue("@Description", tbDescription.Text);
            insert.Parameters.AddWithValue("@fkUsername", User.Identity.Name);
            


            try
            {
                conn.Open();
                insert.ExecuteNonQuery();
                lbl_msg.Text = "Upload successful!";
                
            }
            catch (Exception ex)
            {
                lbl_msg.Text = "Error: " + ex.Message;
                conn.Close();
            }
            conn.Close();

        }
    }
    }
