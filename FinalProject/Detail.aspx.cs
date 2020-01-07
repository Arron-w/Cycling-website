using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;

namespace FinalProject
{
    public partial class Detail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
            

            if (!User.IsInRole("DiscussionParticipant")) DiscussionForm.Visible = false;

            if(User.Identity.Name == "") DiscussionForm.Visible = false;

            //if (!User.Identity.IsAuthenticated) rbRating.Visible = false;
            if (!User.Identity.IsAuthenticated) jsRaterArea.Visible = false;
            if (User.Identity.Name == "") PhotoTagForm.Visible = false;


            //if (IsPostBack && rbRating.SelectedItem != null)
            //{
            //    int score = Convert.ToInt16( rbRating.SelectedValue);
            //    int thing = Convert.ToInt16(Request["PhotoId"]);
            //    String id = User.Identity.GetUserId();


            //    string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["dbaw16abnConnectionString"].ConnectionString;
            //    SqlConnection conn = new SqlConnection(connStr);
            //    conn.Open();
            //    SqlCommand deleteCmd = new SqlCommand("Delete From Ratings Where fk_UserId=@fk_UserId AND fk_PhotoId=@thing ", conn);
            //    deleteCmd.Parameters.AddWithValue("@fk_UserId", id);
            //    deleteCmd.Parameters.AddWithValue("@thing", thing);
            //    deleteCmd.ExecuteNonQuery();


            //    SqlCommand insertCmd = new SqlCommand("Insert into Ratings (fk_UserId, Score, fk_PhotoId) VALUES(@fk_UserId, @score, @fk_PhotoId) ", conn);
            //    insertCmd.Parameters.AddWithValue("@fk_UserId" ,id);
            //    insertCmd.Parameters.AddWithValue("@score", score);
            //    insertCmd.Parameters.AddWithValue("@fk_PhotoId", thing);
            //    insertCmd.ExecuteNonQuery();
            //    conn.Close();

            //}

        }
        protected void BtnComSub_Click(object sender, EventArgs e)
        {

            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["dbaw16abnConnectionString"].ConnectionString;


            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand insert = new SqlCommand("insert into PhotoComment(Title, Body, Author, PostingTime, Photo_FKid) values(@Title, @Body, @Author, @PostingTime, @Photo_FKid)", conn);
            insert.Parameters.AddWithValue("@Title", tbCommentTitle.Text);
            insert.Parameters.AddWithValue("@Body", tbBody.Text);
            insert.Parameters.AddWithValue("@Author", User.Identity.Name);
            insert.Parameters.AddWithValue("@PostingTime", DateTime.Now);
            insert.Parameters.AddWithValue("@Photo_FKid", Request.QueryString["PhotoId"]);
            conn.Open();


            try
            {
                
                insert.ExecuteNonQuery();
                lbl_msg.Text = "Upload successful!";

            }
            catch (Exception ex)
            {
                lbl_msg.Text = "Error: " + ex.Message;
                

            }
            conn.Close();
            Response.Redirect("Detail.aspx?PhotoId=" + Request.QueryString["PhotoId"]);

        }

        protected void BtnAddTags_Click(object sender, EventArgs e)
        {
            /*
             * split the text un the textbox into an array of tags
             * for each new tag
             *      check that it does not already exist in the table
             *      if it doesnt 
             *          add the new tag to teh tags table
             *          find its primary key
             *      else if it does 
             *          find its primary key
             *      associate teh primary key of the tag with the primary key of the paper in the paper junction table.
             * 
             * 
             */
            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["dbaw16abnConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();

            for (int ct = 0; ct < CheckBoxList1.Items.Count; ct++)
            {
                // if (CheckBoxList1.Items[ct].Selected) Response.Write(CheckBoxList1.Items[ct].Value);
                if (CheckBoxList1.Items[ct].Selected) ConnectTagAndPhoto(Convert.ToInt16(CheckBoxList1.Items[ct].Value), Convert.ToInt16(Request.QueryString["PhotoId"]), conn);

            }


            string[] newTags = TbTags.Text.Split(',');




            if (TbTags.Text == "") return;

            foreach (string tag in newTags)
            {
                int id = GetIdforTag(tag, conn);
                int PhotoId = Convert.ToInt16(Request.QueryString["PhotoId"]);


                if (id > 0) //the tag is already in the database.
                {
                    // Response.Write(tag + " is in the database");

                    ConnectTagAndPhoto(id, PhotoId, conn);
                }

                else //the tag is not in the database
                {
                    int newTagId = AddTagToDb(tag, conn);
                    ConnectTagAndPhoto(newTagId, PhotoId, conn);
                }

            }


        }

        protected int AddTagToDb(String tag, SqlConnection conn)
        {
            string addTagSql = "INSERT INTO PhotoTag (TagName) VALUES (@TagName)";
            SqlCommand sqlCmd = new SqlCommand(addTagSql, conn);
            sqlCmd.Parameters.AddWithValue("@TagName", tag);
            sqlCmd.ExecuteNonQuery();

            String lastRecordAddedSql = "SELECT TOP 1 Id FROM PhotoTag ORDER BY Id desc";
            SqlCommand sqlCmd2 = new SqlCommand(lastRecordAddedSql, conn);
            SqlDataReader sqldr = sqlCmd2.ExecuteReader();
            sqldr.Read();
            int retVal = Convert.ToInt16(sqldr["Id"]);
            sqldr.Close();

            return retVal;

        }

        protected void ConnectTagAndPhoto(int tagId, int PhotoId, SqlConnection conn)
        {
            string addTagPhotoConnection = "INSERT INTO TagJunction (Tag_FKid, Photo_FKid) VALUES (@Tag_FKid, @Photo_FKid)";
            SqlCommand sqlCmd = new SqlCommand(addTagPhotoConnection, conn);
            sqlCmd.Parameters.AddWithValue("@Tag_FKid", tagId);
            sqlCmd.Parameters.AddWithValue("@Photo_FKid", PhotoId);

            sqlCmd.ExecuteNonQuery();


        }

        protected int GetIdforTag(String tagName, SqlConnection conn)
        {
            int retVal = -1;

            string findTagSql = "SELECT Id from PhotoTag WHERE TagName= @TagName";
            SqlCommand sqlCmd = new SqlCommand(findTagSql, conn);
            sqlCmd.Parameters.AddWithValue("@TagName", tagName);
            SqlDataReader sqldr = sqlCmd.ExecuteReader();

            if (sqldr.HasRows)
            {
                sqldr.Read();
                retVal = Convert.ToInt32(sqldr["Id"]);
            }


            sqldr.Close();
            return retVal;
        }

       
    }
}