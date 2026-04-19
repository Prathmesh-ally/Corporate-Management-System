using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;                 // Tables aur DataSets use karne ke liye
using System.Data.SqlClient;       // SQL Server connection aur commands ke liye
using System.Web.Configuration;

namespace Corporate
{
    public partial class searchEmpId : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Page load logic yahan aayega
        }

        protected void search_Click(object sender, EventArgs e)
        {
            string strcon = WebConfigurationManager.ConnectionStrings["corpDb"].ConnectionString;
            SqlConnection con = new SqlConnection(strcon);
            con.Open();

            // SQL query: 3 tables ko join karke saara data ek saath nikaal rahe hain
            SqlDataAdapter da = new SqlDataAdapter("select empId ,fname, mname, lname, emailId, contact, address, pincode , dName,roleName, doj  from empMaster a , deptMaster b , roleMaster c where a.deptId=b.deptId and a.roleId=c.roleId", con);

            DataSet ds = new DataSet();
            da.Fill(ds, "Employees");

            lblMsg.Visible = false;
            lblError.Visible = false;

            bool visibility = false;

            // Loop: DataSet ki har ek row ko check kar rahe hain
            foreach (DataRow r1 in ds.Tables["Employees"].Rows)
            {
                // Agar row ki empId aur SearchBox ka text match ho gaya
                if (r1["empId"].ToString() == searchId.Text)
                {
                    lblfName.Text = r1["fName"].ToString();
                    lblmName.Text = r1["mName"].ToString();
                    lbllName.Text = r1["lName"].ToString();
                    lblEmail.Text = r1["emailId"].ToString();
                    lblcontact.Text = r1["contact"].ToString();
                    lblAddress.Text = r1["address"].ToString();
                    lblPincode.Text = r1["pincode"].ToString();
                    lblDept.Text = r1["dName"].ToString();
                    lblRole.Text = r1["roleName"].ToString();
                    lblDoj.Text = r1["doj"].ToString();

                    visibility = true;
                    break;
                }
            }
            if (visibility == false)
            {
                Panel1.Visible = false;
                lblError.Visible = true;
                lblError.Text = "Record Not Found. Please enter a valid Employee ID.";
            }
            else
            {
                Panel1.Visible = true;

                lblMsg.Visible = true;
                lblMsg.Text = "Employee Details Found Successfully!";
            }
        }
    }
}