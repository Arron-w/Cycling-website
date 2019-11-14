using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProject
{
    public partial class PhotosByTag : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (IsPostBack && SelectTagFilter.SelectedItem != null)
            {
                String thing = SelectTagFilter.SelectedItem.ToString();

            }
        }

        protected void btnFilterTags_Click(object sender, EventArgs e)
        {
            if (IsPostBack && SelectTagFilter.SelectedItem != null)
            {
                String thing = SelectTagFilter.SelectedItem.ToString();
                Response.Redirect("PhotosByTag.aspx?Tag=" + thing);
            }
        }
    }
}