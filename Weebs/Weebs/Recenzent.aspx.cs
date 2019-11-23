using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Recenzent : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        connect();
    }
    private void connect()
    {
        string Name = (string)(Session["name"]);
        if (Name == null)
        {
            Response.Redirect("/Login.aspx");

        }
        if (Request.UrlReferrer == null)
        {
            Session["name"] = null;
            Name = null;
            Response.Redirect("/Login.aspx");
        }
        SqlConnection con = new SqlConnection(@"Data Source=SQL6007.site4now.net;Initial Catalog=DB_A503C7_weebs;User Id=DB_A503C7_weebs_admin;Password=Password1*;");
        con.Open();
        SqlCommand cm = new SqlCommand("Select * from AspNetUsers");
        SqlDataAdapter sqlda = new SqlDataAdapter(cm.CommandText, con);
        DataTable sqdt = new DataTable();
        sqlda.Fill(sqdt);
        for (int i = 0; i < sqdt.Rows.Count; i++)
        {
            if (sqdt.Rows[i]["UserName"].ToString() == Name)
            {
                if (sqdt.Rows[i]["Role"].ToString() == "Recenzent")
                {
                    
                    break;
                }
                else
                {
                    Response.Redirect("/Login.aspx");
                }
            }
            else if ((sqdt.Rows[i]["UserName"].ToString() != Name) && (i == sqdt.Rows.Count))
            {
                Response.Redirect("/Login.aspx");
            }

        }
    }
   

    protected void btn_logout_Click(object sender, EventArgs e)
    {
        string Name = (string)(Session["name"]);

        Session["name"] = null;
        Name = null;
        var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
        authenticationManager.SignOut();
        Response.Redirect("/Login.aspx");
    }





    protected void Button1_Click(object sender, EventArgs e)
    {

    }

    protected void Button2_Click(object sender, EventArgs e)
    {

    }
}