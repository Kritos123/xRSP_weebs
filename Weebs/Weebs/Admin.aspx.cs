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
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);

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
        GridView1.Visible = false;
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
        GridView1.Visible = true;
        Bind();
//        SqlDataReader reader = null;
//        try
//        {
//            SqlCommand command = new SqlCommand("SELECT * FROM Clanky", _connection);
//            reader = command.ExecuteReader();
//
//            while (reader.Read())
//            {
//                TableRow row = new TableRow();
//                TableCell cell1 = new TableCell();
//                cell1.Text = Convert.ToString(reader["id"]);
//                row.Cells.Add(cell1);
//                TableCell cell2 = new TableCell();
//                cell2.Text = Convert.ToString(reader["Nazev"]);
//                row.Cells.Add(cell2);
//                TableCell cell3 = new TableCell();
//                cell3.Text = Convert.ToString(reader["Typ"]);
//                row.Cells.Add(cell3);
//                TableCell cell4 = new TableCell();
//                cell4.Text = Convert.ToString(reader["Data"]);
//                row.Cells.Add(cell4);
//                TableCell cell7 = new TableCell();
//                cell7.Text = Convert.ToString(reader["Zkontroloval"]);
//                row.Cells.Add(cell7);
//                TableCell cell8 = new TableCell();
//                cell8.Text = Convert.ToString(reader["Status"]);
//                row.Cells.Add(cell8);
//                TableCell cell9 = new TableCell();
//                cell9.Text = Convert.ToString(reader["Vyjadreni"]);
//                row.Cells.Add(cell9);
//
//                HyperLink edit = new HyperLink();
//                edit.Text = "Edit";
//                edit.NavigateUrl = "/editarticle.aspx?id=" + cell1.Text;
//                TableCell cell5 = new TableCell();
//                cell5.Controls.Add(edit);
//                row.Cells.Add(cell5);
//                HyperLink del = new HyperLink();
//                del.Text = "Delete";
//                del.NavigateUrl = "/delarticle.aspx?id=" + cell1.Text;
//                TableCell cell6 = new TableCell();
//                cell6.Controls.Add(del);
//                row.Cells.Add(cell6);
//
//                tabel1.Rows.Add(row);
//            }
//
//        }
//        catch (Exception exception)
//        {
//            Label1.Text = "Error:<br>" + exception.Message;
//            Label1.ForeColor = Color.Red;
//
//        }
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("~/Login.aspx");
    }

    // #########################################################################

    protected void Bind()
    {
        
        string constr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "select Id,Nazev,Zkontroloval,Status,Vyjadreni from Clanky";
                cmd.Connection = con;
                con.Open();
                GridView1.DataSource = cmd.ExecuteReader();
                GridView1.DataBind();
                con.Close();
            }
        }
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
        // Label lbldeleteid = (Label)row.FindControl("lblID");
        con.Open();
        SqlCommand cmd = new SqlCommand("delete FROM clanky where id='" + Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()) + "'", con);
        cmd.ExecuteNonQuery();
        con.Close();
        Bind();
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;


        Bind();
        //Set the TextBox as ReadOnly.
        (GridView1.Rows[e.NewEditIndex].Cells[0].Controls[0] as TextBox).ReadOnly = true;
        (GridView1.Rows[e.NewEditIndex].Cells[1].Controls[0] as TextBox).ReadOnly = true;

    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int userid = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
        GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
        // Label lblID = (Label)row.FindControl("lblID"); 

        TextBox zkontroloval = (TextBox)row.Cells[2].Controls[0];
        TextBox status = (TextBox)row.Cells[3].Controls[0];
        TextBox Vyjadril = (TextBox)row.Cells[4].Controls[0];
        GridView1.EditIndex = -1;
        con.Open();
        SqlCommand cmd = new SqlCommand("update Clanky set Zkontroloval='" + zkontroloval.Text + "',Status='" + status.Text + "',Vyjadreni='" + Vyjadril.Text + "'where id='" + userid + "'", con);
        cmd.ExecuteNonQuery();
        con.Close();
        Bind();

    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        Bind();
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        Bind();
    }
    protected void DownloadFile(object sender, EventArgs e)
    {
        int id = int.Parse((sender as LinkButton).CommandArgument);
        byte[] bytes;
        string soubor, typ;
        string constr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "select Nazev, Data, Typ from Clanky where Id=@Id";
                cmd.Parameters.AddWithValue("@Id", id);
                cmd.Connection = con;
                con.Open();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    sdr.Read();
                    bytes = (byte[])sdr["Data"];
                    typ = sdr["Typ"].ToString();
                    soubor = sdr["Nazev"].ToString();
                }
                con.Close();
            }
        }
        Response.Clear();
        Response.Buffer = true;
        Response.Charset = "";
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.ContentType = typ;
        Response.AppendHeader("Content-Disposition", "attachment; filename=" + soubor);
        Response.BinaryWrite(bytes);
        Response.Flush();
        Response.End();
    }


}