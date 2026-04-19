using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;                 // Tables aur DataSets use karne ke liye
using System.Data.SqlClient;       // SQL Server connection aur commands ke liye
using System.Web.Configuration;

namespace Corporate
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string strcon = WebConfigurationManager.ConnectionStrings["corpDb"].ConnectionString;
            SqlConnection con = new SqlConnection(strcon);

            SqlDataAdapter da = new SqlDataAdapter("select * from admin_users", con);
            DataSet ds = new DataSet();
            da.Fill(ds, "Users");

            bool visibility = false;

            foreach (DataRow r1 in ds.Tables["Users"].Rows)
            {
                if (r1["username"].ToString() == txtuserName.Text && r1["password"].ToString() == txtPassword.Text)
                {
                    visibility = true;

                    break;
                }
            }
            lblError.Text = "";
            if (visibility == true)
            {
                Response.Redirect("Home1.aspx");
            }
            else
            {
                lblError.Text = "Invalid Id or Password";
            }
        }
    }
}