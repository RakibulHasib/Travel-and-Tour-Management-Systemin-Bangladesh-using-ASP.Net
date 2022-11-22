using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TTMSB_Project.Items
{
    public partial class ClientView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            FileUpload fu = GridView1.Rows[e.RowIndex].FindControl("fuPicture") as FileUpload;
            if (fu != null)
            {
                if (fu.PostedFile.ContentLength > 0)
                {
                    e.NewValues["picture"] = fu.FileBytes;
                }
            }
        }
    }
}