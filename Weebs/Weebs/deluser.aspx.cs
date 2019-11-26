using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class deluser : System.Web.UI.Page
{
    private SqlConnection _connection;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["role"] != "admin")
        {
            Response.Redirect("/Login.aspx");
        }
        
        if (Request.QueryString["name"] == null)
            Response.Redirect("/Admin.aspx");

        Label1.Text = "A you sure want delete the user with name: " + Request.QueryString["name"];

        string connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        _connection = new SqlConnection(connectionString);
        _connection.Open();
    }

    protected void Page_Unload(object sender, EventArgs e)
    {
        if (_connection != null && _connection.State != ConnectionState.Closed)
        {
            _connection.Close();
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            string query = "DELETE FROM AspNetUsers WHERE UserName = " + "'" + Request.QueryString["name"] + "'";
            SqlCommand command = new SqlCommand(query, _connection);
            object result = command.ExecuteScalar();
            Response.Redirect("/Admin.aspx");

        }
        catch (Exception exception)
        {
            Label1.Text = "Error:<br>" + exception.Message;
            Label1.ForeColor = Color.Red;

        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Admin.aspx");
    }
}