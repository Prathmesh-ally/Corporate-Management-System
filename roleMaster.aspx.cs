using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
    
using System.Data;
using System.Data.SqlClient;       // SqlConnection aur SqlCommand ke liye
using System.Web.Configuration;    // Web.config se Connection String lene ke liye

namespace Corporate
{
    public partial class roleMaster : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                FillGridView();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string strcon = WebConfigurationManager.ConnectionStrings["corpDb"].ConnectionString;
            SqlConnection con = new SqlConnection(strcon);
            con.Open();

            SqlCommand cmd = new SqlCommand("insert into RoleMaster (roleName,roleDetails) values(@roleName, @roleDetails)", con);

            cmd.Parameters.AddWithValue("@roleName", txtroleName.Text);
            cmd.Parameters.AddWithValue("@roleDetails",txtroleDetails.Text);

            cmd.ExecuteNonQuery();

            lblMsg.Text = "Role Added Successfully...";
            con.Close();
            FillGridView();
        }

        protected void FillGridView()
        {
            string strcon = WebConfigurationManager.ConnectionStrings["corpDb"].ConnectionString;
            SqlConnection con = new SqlConnection(strcon);
            con.Open();

            SqlDataAdapter da = new SqlDataAdapter("select * from rolemaster order by roleId desc", con);

            DataSet ds = new DataSet();
            da.Fill(ds, "t1");

            GridView2.DataSource = ds.Tables["t1"];
            GridView2.DataBind();
            ViewState["v1"] = ds;
            con.Close();


        }

        protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string dept_from_DK = GridView2.DataKeys[e.RowIndex].Values["roleId"].ToString();

            string strcon = WebConfigurationManager.ConnectionStrings["corpDb"].ConnectionString;
            SqlConnection con = new SqlConnection(strcon);
            con.Open();

            SqlCommand cmd = new SqlCommand("delete from roleMaster where roleId=@roleId", con);


            cmd.Parameters.AddWithValue("@roleId", dept_from_DK);

            cmd.ExecuteNonQuery();

            lblMsg.Text = "Role Deleted Successfully...";
            con.Close();

            FillGridView();
        }

        protected void GridView2_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView2.EditIndex = e.NewEditIndex;
            FillGridView();
        }

        protected void GridView2_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView2.EditIndex = -1;
            FillGridView();
        }

        protected void GridView2_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string dept_from_DK = GridView2.DataKeys[e.RowIndex].Values["roleId"].ToString();

            TextBox mrolename = (TextBox)GridView2.Rows[e.RowIndex].FindControl("txtroleName");
            TextBox mroledetails = (TextBox)GridView2.Rows[e.RowIndex].FindControl("txtroledetails");

            string strcon = WebConfigurationManager.ConnectionStrings["corpDb"].ConnectionString;
            SqlConnection con = new SqlConnection(strcon);
            con.Open();

            SqlCommand cmd = new SqlCommand("update roleMaster set roleName=@roleName , roleDetails=@roleDetails where roleId=@roleId", con);


            cmd.Parameters.AddWithValue("roleName", mrolename.Text);
            cmd.Parameters.AddWithValue("roleDetails", mroledetails.Text);
            cmd.Parameters.AddWithValue("roleId", dept_from_DK);

            cmd.ExecuteNonQuery();

            lblMsg.Text = "Role Upadted Successfully...";
            con.Close();
            GridView2.EditIndex = -1;
            FillGridView();
        }

        protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            DataSet mydataset = (DataSet)ViewState["v1"];
            DataTable mydatatable = mydataset.Tables["t1"];
            GridView2.DataSource = mydatatable;
            GridView2.PageIndex = e.NewPageIndex;
            GridView2.DataBind();
        }
    }
}