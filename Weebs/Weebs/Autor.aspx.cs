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

public partial class Autor : System.Web.UI.Page
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
                    if (sqdt.Rows[i]["Role"].ToString() == "Autor")
                    {
                        Bind();
                    break;
                    }
                    else if (sqdt.Rows[i]["Role"].ToString() != "Autor")
                    {
                        Response.Redirect("/Login.aspx");
                    }
                }
                else if ((sqdt.Rows[i]["UserName"].ToString() != Name) &&(i== sqdt.Rows.Count))
                {
                    Response.Redirect("/Login.aspx");
                }
                
            }
        Session["name"] = null;
        Name = null;


    }
    private void Bind()
    {
        string constr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "select Id, Nazev from Clanky";
                cmd.Connection = con;
                con.Open();
                GridView1.DataSource = cmd.ExecuteReader();
                GridView1.DataBind();
                con.Close();
            }
        }
    }
    protected void Upload(object sender, EventArgs e)
    {
        string soubor = Path.GetFileName(FileUpload1.PostedFile.FileName);
        string typ = FileUpload1.PostedFile.ContentType;
        using (Stream f_s = FileUpload1.PostedFile.InputStream)
        {
            using (BinaryReader b_r = new BinaryReader(f_s))
            {
                byte[] bytes = b_r.ReadBytes((Int32)f_s.Length);
                string constr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    string query = "insert into Clanky values (@Nazev, @Typ, @Data)";
                    using (SqlCommand cmd = new SqlCommand(query))
                    {
                        cmd.Connection = con;
                        cmd.Parameters.AddWithValue("@Nazev", soubor);
                        cmd.Parameters.AddWithValue("@Typ", typ);
                        cmd.Parameters.AddWithValue("@Data", bytes);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }
            }
        }
        Response.Redirect(Request.Url.AbsoluteUri);
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

    protected void Button1_Click(object sender, EventArgs e)
    {
        var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
        authenticationManager.SignOut();
        Response.Redirect("/Login.aspx");
    }
}  
