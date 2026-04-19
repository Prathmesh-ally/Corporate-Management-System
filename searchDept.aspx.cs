using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;       // Namespace for database operations
using System.Web.Configuration;
namespace Corporate
{
    public partial class searchDept : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) { 
                FillDepartments();
            }
        }


        protected void FillDepartments()
        {
            string strcon = WebConfigurationManager.ConnectionStrings["corpDb"].ConnectionString;
            SqlConnection con = new SqlConnection(strcon);
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter("select * from deptMaster order by deptId desc", con);
            DataSet ds = new DataSet();
            da.Fill(ds, "t1");
            selectDept.DataSource = ds.Tables["t1"];
            selectDept.DataTextField = "dName"; // User sees the name
            selectDept.DataValueField = "deptID"; // Code uses the ID
            selectDept.DataBind();
            con.Close();
        }

        protected void FillGridView()
        {
            string strcon = WebConfigurationManager.ConnectionStrings["corpDb"].ConnectionString;
            SqlConnection con = new SqlConnection(strcon);
            con.Open();
            // SQL Join query to fetch related data from 3 tables
            SqlDataAdapter da = new SqlDataAdapter("select empId ,fname, mname, lname, emailId, contact, address, pincode , dName,roleName, doj from empMaster a , deptMaster b , roleMaster c where a.deptId=b.deptId and a.roleId=c.roleId", con);
            DataSet ds = new DataSet();
            da.Fill(ds, "Employees");
            GridView1.DataSource = ds.Tables["Employees"];
            GridView1.DataBind();
            ViewState["v1"] = ds; 
            con.Close();
        }

        protected void selectDept_SelectedIndexChanged(object sender, EventArgs e)
        {
            string strcon = WebConfigurationManager.ConnectionStrings["corpDb"].ConnectionString;
            SqlConnection con = new SqlConnection(strcon);
            con.Open();

            // Simple format, lekin end mein 'a.deptId' isliye likha hai taaki SQL ko pata chale filter kahan lagana hai
            SqlDataAdapter da = new SqlDataAdapter("select empId, fname, mname, lname, emailId, contact, address, pincode, dName, roleName, doj from empMaster a, deptMaster b, roleMaster c where a.deptId=b.deptId and a.roleId=c.roleId and a.deptId=" + selectDept.SelectedValue, con);
            DataSet ds = new DataSet();
            da.Fill(ds, "Employees");

            GridView1.DataSource = ds.Tables["Employees"];
            GridView1.DataBind();

            con.Close();
        }
    }
}