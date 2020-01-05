using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;

public partial class Recenzent : System.Web.UI.Page
{
    public string thisUserId = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        connect();
        MyArticles();
        ClankyRecenzent();
        //Response.Write("<script>alert('"+thisUserId+"')</script>");
        //  GridView1.;
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
                    thisUserId = sqdt.Rows[i]["id"].ToString();
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

    void MyArticles()
    {
        string constr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "select * from Clanky_recenzenti where Recenzent1Id ='" + thisUserId + "' OR Recenzent2Id='" + thisUserId + "'";
                cmd.Connection = con;
                con.Open();

                //DropDownList1.DataSource = cmd.ExecuteReader();
                //DropDownList1.DataTextField = "IdClanku";
                //DropDownList1.DataValueField = "IdClanku";
                //DropDownList1.DataBind();
                con.Close();
            }
        }
    }

    void ClankyRecenzent()
    {
        string constr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "select IdClanku, Termin from Clanky_recenzenti where Recenzent1Id ='" + thisUserId + "' OR Recenzent2Id='" + thisUserId + "'";
                cmd.Connection = con;
                con.Open();

                GridView1.DataSource = cmd.ExecuteReader();

                GridView1.DataBind();
                con.Close();
            }
        }
    }




    protected void Button1_Click(object sender, EventArgs e)
    {

    }

    protected void Button2_Click(object sender, EventArgs e)
    {

    }


    protected void DropDownList1_SelectedIndexChanged1(object sender, EventArgs e)
    {
        //int idClanku = Convert.ToInt32(DropDownList1.SelectedItem.Text);

        //string message = DropDownList1.SelectedItem.Text + " - " + DropDownList1.SelectedItem.Value;
        //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('" + message + "');", true);
    }

    protected void btn_odeslat_Click(object sender, EventArgs e)
    {
        string constr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "insert into Nazor_Recenzenta (Id_clanku, Id_recenzenta, Aktualnost, Originalita, Odbornost, Uroven, Komentar, Datum) values (@Id_clanku, @Id_recenzenta, @Aktualnost, @Originalita, @Odbornost, @Uroven, @Komentar, @Datum)";
                cmd.Connection = con;
                cmd.Parameters.AddWithValue("@Id_clanku", DropDownList1.SelectedValue);
                cmd.Parameters.AddWithValue("@Id_recenzenta", Session["name"]);
                cmd.Parameters.AddWithValue("@Aktualnost", ddl_udaj1.SelectedValue);
                cmd.Parameters.AddWithValue("@Originalita", ddl_udaj2.SelectedValue);
                cmd.Parameters.AddWithValue("@Odbornost", ddl_udaj3.SelectedValue);
                cmd.Parameters.AddWithValue("@Uroven", ddl_udaj4.SelectedValue);
                cmd.Parameters.AddWithValue("@Komentar", tb_komentar.Text); 
                cmd.Parameters.AddWithValue("@Datum", DateTime.Now);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close(); 
            }
        }
    }

    protected void btn_soubor_Click(object sender, EventArgs e)
    {

    }



    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

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