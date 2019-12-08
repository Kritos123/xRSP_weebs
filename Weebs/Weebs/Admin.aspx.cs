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

public partial class Admin : System.Web.UI.Page
{
    private SqlConnection _connection;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["role"] != "admin")
        {
            Response.Redirect("/Login.aspx");
        }
        string connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        _connection = new SqlConnection(connectionString);
        _connection.Open();

        Label2.Text = Session["name"].ToString();
        Label2.Font.Bold = true;
        Label2.Font.Italic = true;

        if (!IsPostBack)
        {
            Button1_Click(sender, e);
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
        SqlDataReader reader = null;
        try
        {
            SqlCommand command = new SqlCommand("SELECT * FROM AspNetUsers", _connection);
            reader = command.ExecuteReader();
            
            while (reader.Read())
            {
                TableRow row = new TableRow();
                TableCell cell1 = new TableCell();
                cell1.Text = Convert.ToString(reader["Id"]);
                row.Cells.Add(cell1);
                TableCell cell2 = new TableCell();
                cell2.Text = Convert.ToString(reader["UserName"]);
                row.Cells.Add(cell2);
                TableCell cell3 = new TableCell();
                cell3.Text = Convert.ToString(reader["Role"]);
                row.Cells.Add(cell3);
                TableCell cell4 = new TableCell();
                if (reader["Email"].ToString() == "")
                    cell4.Text = "not specified";
                else
                    cell4.Text = Convert.ToString(reader["Email"]);
                row.Cells.Add(cell4);
                HyperLink edit = new HyperLink();
                edit.Text = "Edit";
                edit.NavigateUrl = "/edituser.aspx?name="+ cell2.Text;
                TableCell cell5 = new TableCell();
                cell5.Controls.Add(edit);
                row.Cells.Add(cell5);
                HyperLink del = new HyperLink();
                del.Text = "Delete";
                del.NavigateUrl = "/deluser.aspx?name=" + cell2.Text;
                TableCell cell6 = new TableCell();
                cell6.Controls.Add(del);
                row.Cells.Add(cell6);
                tabel1.Rows.Add(row);
            }
        }
        catch (Exception exception)
        {
            Label1.Text = "Error:<br>" + exception.Message;
            Label1.ForeColor = Color.Red;
          
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        SqlDataReader reader = null;
        try
        {
            SqlCommand command = new SqlCommand("SELECT * FROM Clanky", _connection);
            reader = command.ExecuteReader();

            while (reader.Read())
            {
                TableRow row = new TableRow();
                TableCell cell1 = new TableCell();
                cell1.Text = Convert.ToString(reader["id"]);
                row.Cells.Add(cell1);
                TableCell cell2 = new TableCell();
                cell2.Text = Convert.ToString(reader["Nazev"]);
                row.Cells.Add(cell2);
                TableCell cell3 = new TableCell();
                cell3.Text = Convert.ToString(reader["Typ"]);
                row.Cells.Add(cell3);
                TableCell cell4 = new TableCell();
                cell4.Text = Convert.ToString(reader["Data"]);
                row.Cells.Add(cell4);
                TableCell cell7 = new TableCell();
                cell7.Text = Convert.ToString(reader["Zkontroloval"]);
                row.Cells.Add(cell7);
                TableCell cell8 = new TableCell();
                cell8.Text = Convert.ToString(reader["Status"]);
                row.Cells.Add(cell8);
                TableCell cell9 = new TableCell();
                cell9.Text = Convert.ToString(reader["Vyjadreni"]);
                row.Cells.Add(cell9);

                HyperLink edit = new HyperLink();
                edit.Text = "Edit";
                edit.NavigateUrl = "/editarticle.aspx?id=" + cell1.Text;
                TableCell cell5 = new TableCell();
                cell5.Controls.Add(edit);
                row.Cells.Add(cell5);
                HyperLink del = new HyperLink();
                del.Text = "Delete";
                del.NavigateUrl = "/delarticle.aspx?id=" + cell1.Text;
                TableCell cell6 = new TableCell();
                cell6.Controls.Add(del);
                row.Cells.Add(cell6);

                tabel1.Rows.Add(row);
            }

        }
        catch (Exception exception)
        {
            Label1.Text = "Error:<br>" + exception.Message;
            Label1.ForeColor = Color.Red;

        }
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("~/Login.aspx");
    }

    protected void odst_cl_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/clanek_delete.aspx");
    }
}