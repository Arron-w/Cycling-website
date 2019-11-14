using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProject.Admin
{
    public partial class election : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["dbaw16abnConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();

            string addUserRole = "INSERT INTO AspNetUserRoles (UserId, RoleId) VALUES (@UserId, @RoleId)";
            SqlCommand sqlCmd = new SqlCommand(addUserRole, conn);
            sqlCmd.Parameters.AddWithValue("@UserId", ddl_User.SelectedValue);
            sqlCmd.Parameters.AddWithValue("@RoleId", ddl_Role.SelectedValue);
            sqlCmd.ExecuteNonQuery();
            conn.Close();
        }
    }
}