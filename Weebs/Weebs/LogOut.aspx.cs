using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class LogOut : System.Web.UI.Page
{
    private SqlConnection _connection;

    private void connect()
    {
        string connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        _connection = new SqlConnection(connectionString);
        _connection.Open();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
 
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string Name = (string)(Session["name"]);
       

        Session["name"] = null;

       
        
        
        
        Name = null;
        var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
        authenticationManager.SignOut();
        Response.Redirect("/Login.aspx");
    }
}