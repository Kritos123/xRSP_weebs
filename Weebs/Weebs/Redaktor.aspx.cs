using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Redaktor : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
        
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            connect();
        }
        Calendar1.TodaysDate = DateTime.Now.Date;
        Calendar1.SelectedDate = DateTime.Now.Date; ;


    }
    private void connect()
    {
        string Name = (string)(Session["name"]);
        //Response.Write(Name);
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
        protected void Bind()
    {
     
        
        //zap = 0;
       // Session["zapis"] = 0;
        string constr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "select Id,Nazev,Zkontroloval, Zkontroloval_2,Status,Vyjadreni from Clanky";
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
        int idClanku = -1;
          idClanku = Convert.ToInt32((DropDownList1.SelectedValue));
        if (idClanku == -1 || idClanku == 0)
        {
            Label_clanek_check.Text = "Není žádný článek k přiřazení!";

            int totalItems = DropDownList1.Items.Count;
            if (totalItems == 0)
                Button2.Enabled = false;
        }

        string idRecenzent1 = DropDownList2.SelectedValue;
        string idRecenzent2 = DropDownList3.SelectedValue;
        ;
        DateTime Termin = Calendar1.SelectedDate;


        if (idClanku != -1)
        {
            insertRecenzentyClanku(idClanku, idRecenzent1, idRecenzent2, Termin);
            Page.Response.Redirect(Page.Request.Url.ToString(), true);  
        }
    }



    private void insertRecenzentyClanku(int idClanku ,string idRecenzent1, string idRecenzent2, DateTime? Termin )
    {
        using (SqlCommand cmd = new SqlCommand())
        { 
            cmd.CommandText = "insert into Clanky_recenzenti (IdClanku, Recenzent1Id, Recenzent2Id, Termin) values (@IdClanku, @Recenzent1Id, @Recenzent2Id, @Termin)";
            cmd.Connection = con;
            cmd.Parameters.AddWithValue("@IdClanku", idClanku);
            cmd.Parameters.AddWithValue("@Recenzent1Id", idRecenzent1);
            cmd.Parameters.AddWithValue("@Recenzent2Id", idRecenzent2);
            cmd.Parameters.AddWithValue("@Termin", Termin);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }




    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Casopis_add.aspx");
    }
}  
