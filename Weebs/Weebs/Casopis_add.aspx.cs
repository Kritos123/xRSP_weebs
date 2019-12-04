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

public partial class Casopis_add : System.Web.UI.Page
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

                if (sqdt.Rows[i]["Role"].ToString() == "Redaktor")
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
                cmd.CommandText = "select cl_nazev, cl_cislo, cl_datum, cl_data, from Casopis";
                cmd.Connection = con;
                con.Open();

                con.Close();
            }
        }
    }
    protected void Upload(object sender, EventArgs e)
    {
        string soubor = Path.GetFileName(FileUpload1.PostedFile.FileName);

        string constr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand cmd = new SqlCommand();
        SqlCommand cm = new SqlCommand("Select * from Casopis");
        SqlDataAdapter sqlda = new SqlDataAdapter(cm.CommandText, con);
        DataTable sqdt = new DataTable();
        sqlda.Fill(sqdt);


        using (Stream f_s = FileUpload1.PostedFile.InputStream)
        {
            using (BinaryReader b_r = new BinaryReader(f_s))
            {
                byte[] bytes = b_r.ReadBytes((Int32)f_s.Length);
 
                {



                        cmd.CommandText = "insert into Casopis (cl_nazev, cl_cislo, cl_datum, cl_data) values (@cl_nazev, @cl_cislo, @cl_datum, @cl_data)";
                        cmd.Connection = con;
                        cmd.Parameters.AddWithValue("@cl_nazev", soubor);
                        cmd.Parameters.AddWithValue("@cl_cislo", cilslo_txt.Text);
                        cmd.Parameters.AddWithValue("@cl_datum", DateTime.Now.ToString("yyyy-MM-dd"));
                        cmd.Parameters.AddWithValue("@cl_data", bytes);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }
            }
        }



    protected void back_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Redaktor.aspx");
    }
}



                