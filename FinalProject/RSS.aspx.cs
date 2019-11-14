using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Xml;
using System.Text;
using System.Configuration;

namespace FinalProject
{
    public partial class RSS : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Clear();
            Response.ContentType = "application/rss+xml";
            XmlTextWriter objX = new XmlTextWriter(Response.OutputStream, Encoding.UTF8);
            objX.WriteStartDocument();
            objX.WriteStartElement("rss");
            objX.WriteAttributeString("version", "2.0");
            objX.WriteStartElement("channel");

            SqlCommand cmd = new SqlCommand("Select [Title], [Description], [EventDate] From Event", new SqlConnection(ConfigurationManager.ConnectionStrings["dbaw16abnConnectionString"].ConnectionString));
            cmd.Connection.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            objX.WriteElementString("Title", "Event");
            objX.WriteElementString("Description", "A description of the cycling event.");
            objX.WriteElementString("language", "en-us");
            objX.WriteElementString("ttl", "60");



            while (dr.Read())
            {
                objX.WriteStartElement("Title");
                objX.WriteElementString("Title", dr["Title"].ToString());
                objX.WriteEndElement();
                objX.WriteStartElement("Description");
                objX.WriteElementString("Description", dr["Description"].ToString());
                objX.WriteEndElement();
                objX.WriteStartElement("EventDate");
                objX.WriteElementString("EventDate", dr["EventDate"].ToString());
                objX.WriteEndElement();




            }

            objX.WriteEndElement();
            objX.WriteEndElement();
            objX.WriteEndDocument();
            objX.Flush();
            objX.Close();
            Response.End();
        }
    }
}