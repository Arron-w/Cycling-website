using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProject
{
    public partial class RemoveComments : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnRemoveCom_Click(object sender, EventArgs e)
        {
            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["dbaw16abnConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            foreach (ListItem li in CheckBoxList1.Items)
            {

                if (li.Selected)
                {

                    SqlCommand delSQL = new SqlCommand("DELETE FROM Comment Where Id= @Id", conn);
                    delSQL.Parameters.AddWithValue("@Id", li.Value);
                    delSQL.ExecuteNonQuery();

                           

                }
            }
            conn.Close();
            Response.Redirect("RemoveComments.aspx");
        }
    }
}