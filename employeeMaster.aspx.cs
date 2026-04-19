using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


using System.Data;
using System.Data.SqlClient;       // Namespace for database operations
using System.Web.Configuration;    // Namespace to access Web.config
namespace Corporate
{
    public partial class employeeMaster : System.Web.UI.Page
    {
        string filetitle1; // Global variable to store the image filename

        protected void Page_Load(object sender, EventArgs e)
        {
            // Runs only on the first page load
            if (!IsPostBack)
            {
                FillRoles();        // Load roles into dropdown
                FillDepartments();  // Load departments into dropdown
                FillGridView();     // Show employee list in the table
                Calendar1.Visible = false; // Keep calendar hidden
            }
        }

        // Action when 'Submit' is clicked
        protected void submitbtn_Click(object sender, EventArgs e)
        {
            uploadImage1(); // First, upload the image to the server folder
            string strcon = WebConfigurationManager.ConnectionStrings["corpDb"].ConnectionString;
            SqlConnection con = new SqlConnection(strcon);
            con.Open();

            // SQL command to insert all employee details including the image path
            SqlCommand cmd = new SqlCommand("insert into empMaster (fname,mName,lName,emailId,contact,address,pincode,deptId,roleId,doj,profileImage) values(@fname,@mName,@lName,@emailId,@contact,@address,@pincode,@deptId,@roleId,@doj,@profileImage)", con);

            // Mapping form textboxes to SQL parameters
            cmd.Parameters.AddWithValue("@fName", txtfName.Text);
            cmd.Parameters.AddWithValue("@mName", txtmName.Text);
            cmd.Parameters.AddWithValue("@lName", txtlName.Text);
            cmd.Parameters.AddWithValue("@emailId", txtemail.Text);
            cmd.Parameters.AddWithValue("@contact", contactNo.Text);
            cmd.Parameters.AddWithValue("@address", txtaddress.Text);
            cmd.Parameters.AddWithValue("@pincode", txtpinCode.Text);
            cmd.Parameters.AddWithValue("@deptId", selectDept.SelectedValue); // Get ID from DropDown
            cmd.Parameters.AddWithValue("@roleId", selectRole.SelectedValue); // Get ID from DropDown
            cmd.Parameters.AddWithValue("@doj", Convert.ToDateTime(txtdoj.Text)); // Convert string to Date
            cmd.Parameters.AddWithValue("@profileImage", "~/Styles/" + filetitle1); // Store the relative path of image

            cmd.ExecuteNonQuery(); // Execute the insert

            lblMsg.Text = "Employee Added Successfully...";
            con.Close();
            FillGridView(); // Refresh the list
        }

        // Loads Department names and IDs into the DropDownList
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

        // Loads Role names and IDs into the DropDownList
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
            selectRole.DataValueField = "roleID";
            selectRole.DataBind();
            con.Close();
        }

        // Joins tables to show names instead of IDs in the GridView
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
            ViewState["v1"] = ds; // Save data for paging logic later
            con.Close();
        }

        // Show calendar when date button is clicked
        protected void btnCalender_Click(object sender, EventArgs e)
        {
            Calendar1.Visible = true;
        }

        // Put selected date into textbox and hide calendar
        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            txtdoj.Text = Calendar1.SelectedDate.ToShortDateString();
            Calendar1.Visible = false;
        }

        // Clear all input fields
        protected void resetbtn_Click(object sender, EventArgs e)
        {
            txtfName.Text = "";
            txtmName.Text = "";
            txtlName.Text = "";
            txtaddress.Text = "";
            txtemail.Text = "";
            txtdoj.Text = "";
            txtpinCode.Text = "";
        }

        // Logic to validate and save the uploaded image
        protected void uploadImage1()
        {
            string fileName = FileUpload1.PostedFile.FileName; // Original name
            string fileExtension = System.IO.Path.GetExtension(fileName); // e.g. .jpg
            string fileMimeType = FileUpload1.PostedFile.ContentType; // e.g. image/jpeg
            int fileSizeInKb = FileUpload1.PostedFile.ContentLength / 1024; // Calculate size
            filetitle1 = FileUpload1.FileName; // Store filename for DB entry

            // Arrays of allowed types
            string[] MatchExtension = { ".jpg", ".jpeg", ".png", ".gif" };
            string[] MatchMimeType = { "image/jpeg", "image/gif", "image/png" };

            if (FileUpload1.HasFile)
            {
                // Check if file extension or mime type is allowed
                if (MatchExtension.Contains(fileExtension) || MatchMimeType.Contains(fileMimeType))
                {
                    if (fileSizeInKb <= 1024) // Limit size to 1MB
                    {
                        // Save the physical file to the Styles folder on server
                        FileUpload1.SaveAs(Server.MapPath("~/Styles/" + filetitle1));
                    }
                    else
                    {
                        Response.Write("File size is greater than 1MB");
                    }
                }
                else
                {
                    Response.Write("Please upload and .jpg , .jpeg , .png or .gif image");
                }
            }
            else
            {
                Response.Write("Please Upload an image");
            }
        }

        // Deletes an employee using the ID from DataKeys
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string emp_from_DK = GridView1.DataKeys[e.RowIndex].Values["empId"].ToString();
            string strcon = WebConfigurationManager.ConnectionStrings["corpDb"].ConnectionString;
            SqlConnection con = new SqlConnection(strcon);
            con.Open();
            SqlCommand cmd = new SqlCommand("delete from empMaster where empId=@empId", con);
            cmd.Parameters.AddWithValue("@empId", emp_from_DK);
            cmd.ExecuteNonQuery();
            lblMsg.Text = "Employee Deleted Successfully...";
            con.Close();
            FillGridView();
        }

        // Handles switching between pages (1, 2, 3...) in the table
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            DataSet mydataset = (DataSet)ViewState["v1"]; // Retrieve data from ViewState
            DataTable mydatatable = mydataset.Tables["Employees"];
            GridView1.DataSource = mydatatable;
            GridView1.PageIndex = e.NewPageIndex; // Move to the new page
            GridView1.DataBind();
        }

        // Logic for the 'Edit' button in GridView
        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            // Get the ID of the row you want to edit
            string emp_from_DK = GridView1.DataKeys[e.RowIndex].Values["empId"].ToString();

            // Pass the ID to a Session so the next page knows who to edit
            Session["emp_from_DK"] = emp_from_DK;
            // Go to the Edit page
            Response.Redirect("EditEmployee.aspx");
        }
    }
}