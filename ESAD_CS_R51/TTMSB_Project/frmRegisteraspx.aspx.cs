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
    public partial class frmRegisteraspx : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var store = new RoleStore<IdentityRole>();
            var roleManager = new RoleManager<IdentityRole>(store);


            string[] roleNames = { "admin", "member" };

            foreach (var roleName in roleNames)
            {
                if (!roleManager.RoleExists(roleName))
                {
                    var role = new IdentityRole();
                    role.Name = roleName;
                    roleManager.Create(role);
                }
            }
            
        }

        protected void register_Click(object sender, EventArgs e)
        {
            var store = new UserStore<IdentityUser>();
            var manager = new UserManager<IdentityUser>(store);
            var user = new IdentityUser { UserName = this.userName.Text };
            var created = manager.Create(user, this.password.Text);
            
            if (created.Succeeded)
            {
                manager.AddToRole(user.Id,"member");
                var authManager = HttpContext.Current.GetOwinContext().Authentication;
                authManager.SignIn(new Microsoft.Owin.Security.AuthenticationProperties(),
                    manager.CreateIdentity(user, DefaultAuthenticationTypes.ApplicationCookie));
                Response.Redirect("~/default.aspx");
            }
            else
            {
                this.Panel1.Visible = true;
            }
        }
    }
}