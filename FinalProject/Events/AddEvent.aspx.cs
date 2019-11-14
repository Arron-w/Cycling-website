using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProject.Events
{
    public partial class AddEvent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void BtnSubmit_Click(object sender, EventArgs e)
        {

            string existingFileName = fupPDF.FileName;


            string filesFolder = Server.MapPath("~/Images");

            var path = Path.Combine(Directory.GetCurrentDirectory(), filesFolder, existingFileName);




            if (fupPDF.HasFile)
            {


                fupPDF.SaveAs(path);

            }


            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["dbaw16abnConnectionString"].ConnectionString;


            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand insert = new SqlCommand("insert into Event(Title, Description, EventDate, Image, Location, VenueOpen, RegistrationTime, StartTime, EndTime) values(@Title, @Description, @EventDate, @Image, @Location, @VenueOpen, @RegistrationTime, @StartTime, @EndTime)", conn);
            insert.Parameters.AddWithValue("@EventDate", tbEventDate.Text);
            insert.Parameters.AddWithValue("@Title", tbTitle.Text);
            insert.Parameters.AddWithValue("@Description", tbDesc.Text);
            insert.Parameters.AddWithValue("@Location", tbLocation.Text);
            insert.Parameters.AddWithValue("@VenueOpen", tbVenueOpenTime.Text);
            insert.Parameters.AddWithValue("@RegistrationTime", tbRegTime.Text);
            insert.Parameters.AddWithValue("@StartTime", tbStTime.Text);
            insert.Parameters.AddWithValue("@EndTime", tbFinTime.Text);
            insert.Parameters.AddWithValue("@Image", "~/Images" + "/" + fupPDF.FileName);


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

        }
    }
}