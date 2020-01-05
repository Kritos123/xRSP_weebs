using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Threading;



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


        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand("update AspNetUsers set Role='Ctenar' where UserName ='"+ TextBox1.Text + "'", con);
        cmd.ExecuteNonQuery();
        con.Close();


        if (vysledek.Succeeded)
        {
            Response.Redirect("LogOut.aspx");
        }
        else
        {
            if(vysledek.Errors.FirstOrDefault()== "Passwords must be at least 6 characters.")
            StatusMessage.Text = ("Heslo musí být alespoň 6 znaků dlouhé");
            else if(vysledek.Errors.FirstOrDefault() == "Name "+ TextBox1.Text + " is already taken.")
                StatusMessage.Text = "Jméno "+ TextBox1.Text + " je již zabrané";
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