using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Casopis_read : System.Web.UI.Page
{



    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            connect();

        }
    }

    private void connect()
    {
        string Name = (string)(Session["name"]);
        Response.Write(Name);

        SqlConnection con = new SqlConnection(@"Data Source=SQL6007.site4now.net;Initial Catalog=DB_A503C7_weebs;User Id=DB_A503C7_weebs_admin;Password=Password1*;");
        con.Open();
        SqlCommand cm = new SqlCommand("Select * from AspNetUsers");
        SqlDataAdapter sqlda = new SqlDataAdapter(cm.CommandText, con);
        DataTable sqdt = new DataTable();
        sqlda.Fill(sqdt);

        for (int i = 0; i < sqdt.Rows.Count; i++)
        {


            Bind();

        }



    }
    private void Bind()
    {
        string constr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "select cl_nazev, cl_cislo, cl_datum from Casopis";
                cmd.Connection = con;
                con.Open();
                tabulka.DataSource = cmd.ExecuteReader();
                tabulka.DataBind();
                con.Close();
            }
        }
    }


    protected void DownloadFile(object sender, EventArgs e)
    {
        int id = int.Parse((sender as LinkButton).CommandArgument);
        byte[] bytes;
        string soubor;
        string constr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "select cl_data, cl_nazev from Casopis where cl_cislo=@cl_cislo";
                cmd.Parameters.AddWithValue("@cl_cislo", id);
                cmd.Connection = con;
                con.Open();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    sdr.Read();
                    bytes = (byte[])sdr["cl_data"];
                
                    soubor = sdr["cl_nazev"].ToString();
                }
                con.Close();
            }
        }
        Response.Clear();
        Response.Buffer = true;
        Response.Charset = "";
        Response.Cache.SetCacheability(HttpCacheability.NoCache);

        Response.AppendHeader("Content-Disposition", "attachment; filename=" + soubor); // ----------
        Response.BinaryWrite(bytes);
        Response.Flush();
        Response.End();
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("/default.aspx");
    }
}




