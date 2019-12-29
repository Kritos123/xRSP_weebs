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

public partial class edituser : System.Web.UI.Page
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

        if (Session["role"] != "admin")
        {
            Response.Redirect("/Login.aspx");
        }

        if (!IsPostBack)
        {
            if (Request.QueryString["name"] == null)
                Response.Redirect("/Admin.aspx");

            connect();

            Label3.Text = Request.QueryString["name"];
            Label3.ForeColor = Color.Green;

            SqlDataReader reader = null;
            string query = "SELECT * FROM AspNetUsers WHERE UserName = " + "'" + Request.QueryString["name"] + "'";

            try
            {
                SqlCommand command = new SqlCommand(query, _connection);
                reader = command.ExecuteReader();
                if (reader.Read())
                {
                    Label1.Text = "Ready for editing.";
                    TextBox2.Text = Convert.ToString(reader["Email"]);
                    Label2.Text = Convert.ToString(reader["Role"]);
                }
                reader.Close();
            }
            catch (Exception exception)
            {
                Label1.Text = "Error:<br>" + exception.Message;
                Label1.ForeColor = Color.Red;

            }
        }
       
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
        connect();
        string query = "UPDATE AspNetUsers SET ";
       
        if (CheckBox1.Checked)
        {
            query += String.Format("Role = '{1}', Email = '{2}' WHERE UserName = '{0}'",
                Label3.Text, DropDownList1.SelectedValue, TextBox2.Text);
        }
        else
        {
            query += String.Format("Email = '{1}' WHERE UserName = '{0}'",
                Label3.Text, TextBox2.Text);
        }
        

        SqlCommand command = new SqlCommand(query, _connection);
        object result = command.ExecuteScalar();
        Response.Redirect("/Admin.aspx");

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Admin.aspx");
    }


}