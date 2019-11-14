using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProject
{
    public partial class AddNewImage : System.Web.UI.Page
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
            SqlCommand insert = new SqlCommand("insert into Photos(DateOfPublication, Title, Description, Author, PDF) values(@DateOfPublication, @Title, @Description, @Author, @PDF)", conn);
            insert.Parameters.AddWithValue("@DateOfPublication", tbDate.Text);
            insert.Parameters.AddWithValue("@Title", tbTitle.Text);
            insert.Parameters.AddWithValue("@Description", tbDesc.Text);
            insert.Parameters.AddWithValue("@Author", tbAuthor.Text);
            insert.Parameters.AddWithValue("@PDF", "~/Images" + "/" + fupPDF.FileName);


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