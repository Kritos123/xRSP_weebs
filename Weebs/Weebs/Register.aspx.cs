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
            Response.Redirect("LogOut.aspx");
        }
        else
        {
            StatusMessage.Text = vysledek.Errors.FirstOrDefault();
        }
    }

    protected void TextBox2_TextChanged(object sender, EventArgs e)
    {

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("default.aspx");
    }
}