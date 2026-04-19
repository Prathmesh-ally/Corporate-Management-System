using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Sockets;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;


using System.Data;
using System.Data.SqlClient;       // Namespace for database operations
using System.Web.Configuration;
namespace Corporate
{
    public partial class searchRole : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) { 
              FillRoles();
            }
        }

        protected void FillRoles()
        {
            string strcon = WebConfigurationManager.ConnectionStrings["corpDb"].ConnectionString;
            SqlConnection con = new SqlConnection(strcon);
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter("select * from roleMaster order by roleId desc", con);
            DataSet ds = new DataSet();
            da.Fill(ds, "t1");
            selectRole.DataSource = ds.Tables["t1"];
            selectRole.DataTextField = "roleName";
            selectRole.DataValueField = "roleId";
            selectRole.DataBind();
            con.Close();
        }

        protected void selectRole_SelectedIndexChanged(object sender, EventArgs e)
        {
            string strcon = WebConfigurationManager.ConnectionStrings["corpDb"].ConnectionString;
            SqlConnection con = new SqlConnection(strcon);
            con.Open();

            SqlDataAdapter da = new SqlDataAdapter("select empId, fname, mname, lname, emailId, contact, address, pincode, dName, roleName, doj from empMaster a, deptMaster b, roleMaster c where a.deptId=b.deptId and a.roleId=c.roleId and a.roleId=" + selectRole.SelectedValue, con);
            DataSet ds = new DataSet();
            da.Fill(ds, "Employees");

            GridView1.DataSource = ds.Tables["Employees"];
            GridView1.DataBind();

            con.Close();
        }



    }
}