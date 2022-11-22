using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TTMSB_Project
{
    public partial class ManagePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void changePassword_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                var store = new UserStore<IdentityUser>();
                var manager = new UserManager<IdentityUser>(store);

                var signInManager = HttpContext.Current.GetOwinContext().Authentication;
                IdentityResult result = manager.ChangePassword(User.Identity.GetUserId(), currentPassword.Text, newPassword.Text);
                if (result.Succeeded)
                {
                    var user = manager.FindById(User.Identity.GetUserId());
                    signInManager.SignIn(new Microsoft.Owin.Security.AuthenticationProperties(), manager.CreateIdentity(user, DefaultAuthenticationTypes.ApplicationCookie));
                    Response.Redirect("~/default.aspx");
                }
            }
            else Panel1.Visible = true;
        }
    }
}