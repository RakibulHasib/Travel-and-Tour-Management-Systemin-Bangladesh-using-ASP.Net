using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TTMSB_Project;

namespace TTMSB_Project.Items
{
    public partial class Client : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void DetailsView1_ItemInserting(object sender, DetailsViewInsertEventArgs e)
        {
            FileUpload fu = DetailsView1.FindControl("fuPicture") as FileUpload;
            if (fu.HasFile)
            {
                e.Values["picture"] = fu.FileBytes;
            }
        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            CheckBox cb = DetailsView1.FindControl("CheckBox1") as CheckBox;
            if(cb.Checked)
            {
                args.IsValid = true; ;
            }
            else
            {
                args.IsValid = false;
            }
        }
    }
}