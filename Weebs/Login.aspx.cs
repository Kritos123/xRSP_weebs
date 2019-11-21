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
        Session["name"] = null;
        var useruloz = new UserStore<IdentityUser>();
        var manager = new UserManager<IdentityUser>(useruloz);
        var uzivatel = manager.Find(Login_textbox.Text, Password_textbox.Text);

        if (uzivatel != null)
        {
            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
            var userIdentity = manager.CreateIdentity(uzivatel, DefaultAuthenticationTypes.ApplicationCookie);
            authenticationManager.SignIn(new AuthenticationProperties() { IsPersistent = false }, userIdentity);
            SqlConnection con = new SqlConnection(@"Data Source=SQL6007.site4now.net;Initial Catalog=DB_A503C7_weebs;User Id=DB_A503C7_weebs_admin;Password=Password1*;");
            con.Open();
            SqlCommand cm = new SqlCommand("Select * from AspNetUsers");
            SqlDataAdapter sqlda = new SqlDataAdapter(cm.CommandText, con);
            DataTable sqdt = new DataTable();
            sqlda.Fill(sqdt);
            for (int i = 0; i < sqdt.Rows.Count;i++)
            {
                if (sqdt.Rows[i]["UserName"].ToString()== Login_textbox.Text)
                {
                    if(sqdt.Rows[i]["Role"].ToString() == "Autor")
                    {

                        string name = Login_textbox.Text.Trim();
                        Session["name"] = name;
                        Response.Redirect("/Autor.aspx");
                    }

                }
            }
            
        }
        else
        {
            StatusText.Text = "Spatne jmeno nebo heslo";
           
        }

    }
    
    protected void SignOut(object sender, EventArgs e)
    {
        var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
        authenticationManager.SignOut();
        Response.Redirect("~/Login.aspx");
    }
}