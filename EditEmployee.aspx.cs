using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;       // Namespace for SQL Server database connectivity
using System.Linq;
using System.Net.Sockets;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Corporate
{
    public partial class EditEmployee : System.Web.UI.Page
    {
        String filetitle1;

        // This method runs whenever the page is loaded
        protected void Page_Load(object sender, EventArgs e)
        {
            // Only run this code the first time the page loads (not on button clicks)
            if (!IsPostBack)
            {
                search_employee();  // Load current employee details
                FillDepartments();  // Populate the department dropdown
                FillRoles();        // Populate the roles dropdown
                Calendar1.Visible = false;  // Keep the calendar hidden initially
            }
        }

        // Method to fetch and display existing employee data
        protected void search_employee()
        {
            // Get connection string from Web.config file
            string strcon = WebConfigurationManager.ConnectionStrings["corpDb"].ConnectionString;
            // Create a new SQL connection object
            SqlConnection con = new SqlConnection(strcon);
            // Open the database connection
            con.Open();

            // SQL query to join 3 tables and get employee, department, and role names
            SqlDataAdapter da = new SqlDataAdapter("select empId ,fname, mname, lname, emailId, contact, address, pincode , dName,roleName, doj , profileImage from empMaster a , deptMaster b , roleMaster c where a.deptId=b.deptId and a.roleId=c.roleId", con);
            // Create a temporary container for the data
            DataSet ds = new DataSet();

            // Fill the container with the results of the query
            da.Fill(ds, "Employees");

            // Loop through each row found in the database
            foreach (DataRow r1 in ds.Tables["Employees"].Rows)
            {
                // Check if this row matches the Employee ID stored in the Session
                if (r1["empId"].ToString() == Session["emp_from_DK"].ToString())
                {
                    // Fill the textboxes with data from the database row
                    txtfName.Text = r1["fName"].ToString();
                    txtmName.Text = r1["mName"].ToString();
                    txtlName.Text = r1["lName"].ToString();
                    txtEmail.Text = r1["emailid"].ToString();
                    txtDoj.Text = r1["doj"].ToString();
                    contact.Text = r1["contact"].ToString();
                    txtaddress.Text = r1["address"].ToString();
                    txtpinCode.Text = r1["pincode"].ToString();
                    txtDept.Text = r1["dName"].ToString();
                    txtRole.Text = r1["roleName"].ToString();
                    pastImage.ImageUrl = r1["profileImage"].ToString();
                }
            }

            // Store the dataset in ViewState to keep data during postbacks
            ViewState["v1"] = ds;
            // Close the database connection
            con.Close();
        }

        // This method runs when the "Submit" or "Update" button is clicked
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            uploadImage1();
            // Get connection string from Web.config
            string strcon = WebConfigurationManager.ConnectionStrings["corpDb"].ConnectionString;
            // Create connection object
            SqlConnection con = new SqlConnection(strcon);
            // Open connection
            con.Open();
            // Prepare the SQL Update command with parameters to prevent SQL Injection
            SqlCommand cmd = new SqlCommand("UPDATE empMaster SET fname=@fname, mName=@mName, lName=@lName, emailId=@emailId, contact=@contact, address=@address, pincode=@pincode, doj=@doj , deptId=@deptId , roleId=@roleId , profileImage=@profileImage WHERE empId=@empId", con);

            // Assign values from TextBoxes to the SQL parameters
            cmd.Parameters.AddWithValue("@fname", txtfName.Text);
            cmd.Parameters.AddWithValue("@mName", txtmName.Text);
            cmd.Parameters.AddWithValue("@lName", txtlName.Text);
            cmd.Parameters.AddWithValue("@emailId", txtEmail.Text);
            cmd.Parameters.AddWithValue("@contact", contact.Text);
            cmd.Parameters.AddWithValue("@address", txtaddress.Text);
            cmd.Parameters.AddWithValue("@pincode", txtpinCode.Text);

            // Convert date string to DateTime format and use Session ID for the WHERE clause
            cmd.Parameters.AddWithValue("@doj", Convert.ToDateTime(txtDoj.Text));
            cmd.Parameters.AddWithValue("@deptId", selectDept.SelectedValue); // ID from dropdown
            cmd.Parameters.AddWithValue("@roleId", selectRole.SelectedValue); // ID from dropdown
            cmd.Parameters.AddWithValue("@profileImage", "~/Styles/" + filetitle1); // Store the relative path of image
            cmd.Parameters.AddWithValue("@empId", Session["emp_from_DK"].ToString());

            // Run the update command against the database
            cmd.ExecuteNonQuery();
            // Close connection
            con.Close();

            // Show success message to the user
            lblmsg.Text = "Updated SuccessFully";
        }

        // Runs when a date is clicked on the calendar
        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            // Put selected date into the Date of Joining textbox
            txtDoj.Text = Calendar1.SelectedDate.ToShortDateString();
            // Hide the calendar again
            Calendar1.Visible = false;
        }

        // Runs when the button next to Date textbox is clicked
        protected void Button1_Click(object sender, EventArgs e)
        {
            // Show the calendar to the user
            Calendar1.Visible = true;
        }

        // Method to fill the Department DropDownList
        protected void FillDepartments()
        {
            string strcon = WebConfigurationManager.ConnectionStrings["corpDb"].ConnectionString;
            SqlConnection con = new SqlConnection(strcon);
            con.Open();

            // Select all departments from the master table
            SqlDataAdapter da = new SqlDataAdapter("select * from deptMaster order by deptId desc", con);
            DataSet ds = new DataSet();
            da.Fill(ds, "t1");

            // Bind the data to the dropdown list
            selectDept.DataSource = ds.Tables["t1"];
            selectDept.DataTextField = "dName"; // The name user sees
            selectDept.DataValueField = "deptID"; // The ID stored in DB 
            selectDept.DataBind();

            con.Close();
        }

        // Method to fill the Role DropDownList
        protected void FillRoles()
        {
            string strcon = WebConfigurationManager.ConnectionStrings["corpDb"].ConnectionString;
            SqlConnection con = new SqlConnection(strcon);
            con.Open();

            // Select all roles from the master table
            SqlDataAdapter da = new SqlDataAdapter("select * from roleMaster order by roleId desc", con);
            DataSet ds = new DataSet();
            da.Fill(ds, "t1");

            // Bind the data to the dropdown list
            selectRole.DataSource = ds.Tables["t1"];
            selectRole.DataTextField = "roleName"; // The name user sees
            selectRole.DataValueField = "roleID"; // The ID stored in DB 
            selectRole.DataBind();

            con.Close();
        }

        // Runs when a different department is chosen from the dropdown
        protected void selectDept_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Update the display textbox with the selected department name
            txtDept.Text = selectDept.SelectedItem.ToString();
        }

        // Runs when a different role is chosen from the dropdown
        protected void selectRole_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Update the display textbox with the selected role name
            txtRole.Text = selectRole.SelectedItem.ToString();
        }

        //File Upload Image Function 
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
    }
}