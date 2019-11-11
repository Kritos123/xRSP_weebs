using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        var useruloz = new UserStore<IdentityUser>();
        var manager = new UserManager<IdentityUser>(useruloz);

        var uzivatel = new IdentityUser() { UserName = TextBox1.Text };
        IdentityResult vysledek = manager.Create(uzivatel, TextBox2.Text);

        if (vysledek.Succeeded)
        {
            var authneticationManager = HttpContext.Current.GetOwinContext().Authentication;
            var useridetity = manager.CreateIdentity(uzivatel, DefaultAuthenticationTypes.ApplicationCookie);
            authneticationManager.SignIn(new AuthenticationProperties() { }, useridetity);
            Response.Redirect("Login.aspx");
        }
        else
        {
            StatusMessage.Text = vysledek.Errors.FirstOrDefault();
        }
    }
}