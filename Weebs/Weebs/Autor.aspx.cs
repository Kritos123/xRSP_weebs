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
    private void Bind()
    {
        string constr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "select Id, Jmeno, Nazev, Verze from Clanky";
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
        int i = 0;
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

                    string query = "insert into Clanky (Nazev, Typ, Data, Jmeno) values (@Nazev, @Typ, @Data, @Jmeno)";
                    using (SqlCommand cmd = new SqlCommand(query))
                    {

                       

                        string number = "0";
                        int numba = 0;
                        SqlCommand cm = new SqlCommand("select Nazev,Verze from Clanky ORDER BY id DESC", con);
                        con.Open();

                        try
                        {
                            SqlDataReader myReader = cm.ExecuteReader();

                            while (myReader.Read())
                            {
                                if (myReader.GetString(0) == soubor)
                                {
                                    numba = myReader.GetInt32(1);
                                    break;
                                }

                            }
                            numba++;
                            number = Convert.ToString(numba);
                            con.Close();
                        }
                        catch (Exception er)
                        {
                            numba = 1;
                        }


                        cmd.CommandText = "insert into Clanky (Nazev, Typ, Data, Verze, Jmeno) values (@Nazev, @Typ, @Data, @Verze, @Jmeno)";
                        cmd.Connection = con;
                        cmd.Parameters.AddWithValue("@Nazev", soubor);
                        cmd.Parameters.AddWithValue("@Typ", typ);
                        cmd.Parameters.AddWithValue("@Data", bytes);
                        cmd.Parameters.AddWithValue("@Verze", number);
                        cmd.Parameters.AddWithValue("@Jmeno", Session["name"]);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                        Session["zapis"] = ++i;
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
        string Name = (string)(Session["name"]);

        Session["name"] = null;
        Name = null;
        var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
        authenticationManager.SignOut();
        Response.Redirect("/Login.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        int c = 0;
        string constr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand cmd = new SqlCommand();
        SqlCommand cm = new SqlCommand("Select * from Clanky");
        SqlDataAdapter sqlda = new SqlDataAdapter(cm.CommandText, con);
        DataTable sqdt = new DataTable();
        sqlda.Fill(sqdt);
        for (int i = 0; i < sqdt.Rows.Count; i++)
        {
            if (sqdt.Rows[i]["Nazev"].ToString() == TextBox1.Text)
            {
                cmd.CommandText = "insert into Clanky_Stiznosti (Nazev_stiznosti, Stiznost, Nazev) values (@Nazev_stiznosti, @Stiznost, @Nazev)";
                cmd.Connection = con;
                cmd.Parameters.AddWithValue("@Nazev_stiznosti", TextBox2.Text);
                cmd.Parameters.AddWithValue("@Stiznost", TextBox3.Text);
                cmd.Parameters.AddWithValue("@Nazev", TextBox1.Text);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("Stiznost ulozena");
                c++;
                break;
            }
            else 
            {
                
            }
        }
        if(c==0)
        Response.Write("Neexistujici clanek");
    }
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {

    }
}  
