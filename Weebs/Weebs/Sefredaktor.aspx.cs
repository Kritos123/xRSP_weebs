using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Sefredaktor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Bind();
    }
    protected void Bind()
    {

        string constr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "select Id,Jmeno,Verze,Nazev,Zkontroloval,Status,Vyjadreni from Clanky";
                cmd.Connection = con;
                con.Open();
                GridView1.DataSource = cmd.ExecuteReader();
                GridView1.DataBind();
                con.Close();
            }
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "select IdClanku,Recenzent1Id,Recenzent2Id,Termin from Clanky_recenzenti";
                cmd.Connection = con;
                con.Open();
                GridView2.DataSource = cmd.ExecuteReader();
                GridView2.DataBind();
                con.Close();
            }
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "select id,Nazev_stiznosti,Stiznost,Nazev from Clanky_Stiznosti";
                cmd.Connection = con;
                con.Open();
                GridView3.DataSource = cmd.ExecuteReader();
                GridView3.DataBind();
                con.Close();
            }
        }
    }


protected void DownloadFile(object sender, EventArgs e)
    {
        int id = int.Parse((sender as LinkButton).CommandArgument);
        byte[] bytes;
        string soubor, typ, autor, verze;
        string constr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "select Nazev, Data, Typ, Jmeno, Verze from Clanky where Id=@Id";
                cmd.Parameters.AddWithValue("@Id", id);
                cmd.Connection = con;
                con.Open();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    sdr.Read();
                    bytes = (byte[])sdr["Data"];
                    typ = sdr["Typ"].ToString();
                    soubor = sdr["Nazev"].ToString();
                    autor = sdr["Jmeno"].ToString(); // ----------
                    verze = sdr["Verze"].ToString(); // ----------
                }
                con.Close();
            }
        }
        Response.Clear();
        Response.Buffer = true;
        Response.Charset = "";
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.ContentType = typ;
        Response.AppendHeader("Content-Disposition", "attachment; filename=" + soubor ); // ----------
        Response.BinaryWrite(bytes);
        Response.Flush();
        Response.End();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        GridView1.Visible = true;
        Button1.Visible = false;
        Button2.Visible = true;
        Label1.Text = "Skrýj redaktora";
    }
    
    protected void Button2_Click(object sender, EventArgs e)
    {
        GridView1.Visible = false;
        Button1.Visible = true;
        Button2.Visible = false;
        Label1.Text = "Zobraz redaktora";
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        GridView2.Visible = true;
        Button3.Visible = false;
        Button4.Visible = true;
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        GridView2.Visible = false;
        Button3.Visible = true;
        Button4.Visible = false;
    }

    protected void Button6_Click(object sender, EventArgs e)
    {
        GridView3.Visible = false;
        Button5.Visible = true;
        Button6.Visible = false;

    }

    protected void Button5_Click(object sender, EventArgs e)
    {
      
        GridView3.Visible = true;
        Button5.Visible = false;
        Button6.Visible = true;
    }

    protected void Button7_Click(object sender, EventArgs e)
    {
        GridView1.Visible = true;
        GridView2.Visible = true;
        GridView3.Visible = true;
        Button7.Visible = false;
        Button8.Visible = true;
    }

    protected void Button8_Click(object sender, EventArgs e)
    {
        GridView1.Visible = false;
        GridView2.Visible = false;
        GridView3.Visible = false;
        Button7.Visible = true;
        Button8.Visible = false;
    }
}