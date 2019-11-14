using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProject.Events
{
    public partial class saveEventRating : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            Single score = Convert.ToSingle(Request.Params["Score"]);
            int thing = Convert.ToInt16(Request.Params["Thing"]);
            String id = User.Identity.GetUserId();

            if (score == 0 || thing == 0 || id == "") return;
            {

            }

            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["dbaw16abnConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            SqlCommand deleteCmd = new SqlCommand("Delete From EventRatings Where fk_UserId=@fk_UserId AND fk_EventId=@thing ", conn);
            deleteCmd.Parameters.AddWithValue("@fk_UserId", id);
            deleteCmd.Parameters.AddWithValue("@thing", thing);
            deleteCmd.ExecuteNonQuery();


            SqlCommand insertCmd = new SqlCommand("Insert into EventRatings (fk_UserId, Score, fk_EventId) VALUES(@fk_UserId, @score, @fk_EventId) ", conn);
            insertCmd.Parameters.AddWithValue("@fk_UserId", id);
            insertCmd.Parameters.AddWithValue("@score", score);
            insertCmd.Parameters.AddWithValue("@fk_EventId", thing);
            insertCmd.ExecuteNonQuery();
            conn.Close();

        }
    }
}