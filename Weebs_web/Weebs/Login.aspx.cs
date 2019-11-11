using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (User.Identity.IsAuthenticated)
            {
                StatusText.Text = string.Format("Ahoj {0}", User.Identity.GetUserName());
                LoginStatus.Visible = true;
                LogoutButton.Visible = true;
            }
            else
            {
                LoginForm.Visible = true;
            }
        }
    }

    protected void Login_textbox_TextChanged(object sender, EventArgs e)
    {

    }

    protected void Password_textbox_TextChanged(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        var useruloz = new UserStore<IdentityUser>();
        var manager = new UserManager<IdentityUser>(useruloz);
        var uzivatel = manager.Find(Login_textbox.Text, Password_textbox.Text);

        if (uzivatel != null)
        {
            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
            var userIdentity = manager.CreateIdentity(uzivatel, DefaultAuthenticationTypes.ApplicationCookie);
            authenticationManager.SignIn(new AuthenticationProperties() { IsPersistent = false }, userIdentity);
            SqlConnection con = new SqlConnection(@"Data Source=(localdb)\MSSQLLocalDB;AttachDbFilename=C:\Users\filip\Desktop\xRSP_weebs-master-1\xRSP_weebs-master\Weebs_web\Weebs\App_Data\WebFormsIdentity.mdf;Initial Catalog=WebFormsIdentity;Integrated Security=True");
            con.Open();
            SqlCommand cm = new SqlCommand("Select * from AspNetUsers");
            SqlDataAdapter sqlda = new SqlDataAdapter(cm.CommandText, con);
            DataTable sqdt = new DataTable();
            sqlda.Fill(sqdt);
            for (int i = 0; i < sqdt.Rows.Count;i++)
            {
                if (sqdt.Rows[i]["UserName"].ToString()== Login_textbox.Text)
                {
                    if(sqdt.Rows[i]["Role"].ToString() == "Admin")
                    {
                        Response.Redirect("/Admin.aspx");
                    }

                }
            }
            //Response.Redirect("~/Login.aspx");
        }
        else
        {
            StatusText.Text = "Spatne jmeno nebo heslo";
            LoginStatus.Visible = true;
        }

    }
    protected void SignOut(object sender, EventArgs e)
    {
        var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
        authenticationManager.SignOut();
        Response.Redirect("~/Login.aspx");
    }
}