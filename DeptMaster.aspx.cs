using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


using System.Data;                 // For using Tables and DataSets
using System.Data.SqlClient;       // For SQL Server connection and commands
using System.Web.Configuration;    // To read the Connection String from Web.config
using System.Web.DynamicData;

namespace Corporate
{
    public partial class DeptMaster : System.Web.UI.Page
    {
        // Runs when the page loads
        protected void Page_Load(object sender, EventArgs e)
        {
            // Only run the inner code if it's the first time loading the page
            if (!IsPostBack)
            {
                FillGridView(); // Load the table data into the GridView
            }
        }

        // Runs when the 'Submit' button is clicked to add a new department
        protected void submitbtn_Click(object sender, EventArgs e)
        {
            // Get connection details from Web.config
            string strcon = WebConfigurationManager.ConnectionStrings["corpDb"].ConnectionString;
            // Create a new connection to SQL
            SqlConnection con = new SqlConnection(strcon);
            // Open the database connection
            con.Open();

            // Prepare the Insert command with placeholders (@dName, @dDetails)
            SqlCommand cmd = new SqlCommand("insert into deptMaster (dName, dDetails) values(@dName, @dDetails)", con);

            // Give the actual textbox values to the SQL placeholders
            cmd.Parameters.AddWithValue("@dName", txtdName.Text);
            cmd.Parameters.AddWithValue("@dDetails", txtdDetails.Text);

            // Execute the command to save data into the database
            cmd.ExecuteNonQuery();

            // Display success message
            lblMsg.Text = "Department Added Successfully...";
            // Close the database connection
            con.Close();

            // Refresh the GridView to show the newly added data
            FillGridView();
        }

        // Method to fetch data from database and show it in GridView
        protected void FillGridView()
        {
            // Get connection string
            string strcon = WebConfigurationManager.ConnectionStrings["corpDb"].ConnectionString;
            // Create connection
            SqlConnection con = new SqlConnection(strcon);
            // Open connection
            con.Open();

            // Query to get all departments, newest first
            SqlDataAdapter da = new SqlDataAdapter("select * from deptmaster order by deptId desc", con);

            // Create a dataset to hold the results
            DataSet ds = new DataSet();
            // Fill the dataset table named "t1"
            da.Fill(ds, "t1");

            // Attach the data to the GridView control
            GridView1.DataSource = ds.Tables["t1"];
            // Bind (render) the data to the UI
            GridView1.DataBind();
            // Store the data in ViewState so we don't have to hit DB again for paging
            ViewState["v1"] = ds;
            // Close the connection
            con.Close();
        }

        // Clears the input fields
        protected void resetbtn_Click(object sender, EventArgs e)
        {
            txtdName.Text = " "; // Clear Name textbox
            txtdDetails.Text = " "; // Clear Details textbox
        }

        // Runs when the 'Delete' button is clicked in a GridView row
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // Get the unique Department ID of the row being deleted from DataKeys
            string dept_from_DK = GridView1.DataKeys[e.RowIndex].Values["deptId"].ToString();
            // Get connection string
            string strcon = WebConfigurationManager.ConnectionStrings["corpDb"].ConnectionString;
            // Create connection
            SqlConnection con = new SqlConnection(strcon);
            // Open connection
            con.Open();
            // SQL command to delete a specific department
            SqlCommand cmd = new SqlCommand("delete from deptMaster where deptId=@deptId", con);

            // Provide the ID to the parameter
            cmd.Parameters.AddWithValue("@deptId", dept_from_DK);

            // Execute delete
            cmd.ExecuteNonQuery();

            // Show message and close connection
            lblMsg.Text = "Department Deleted Successfully...";
            con.Close();

            // Refresh the table display
            FillGridView();
        }

        // Runs when the 'Edit' button is clicked in GridView
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            // Set the GridView to edit mode for the selected row
            GridView1.EditIndex = e.NewEditIndex;
            // Refresh the GridView to show TextBoxes instead of Labels
            FillGridView();
        }

        // Runs when 'Cancel' is clicked during editing
        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            // Set the edit index to -1 (means no row is being edited)
            GridView1.EditIndex = -1;
            // Refresh to show normal view
            FillGridView();
        }

        // Runs when 'Update' is clicked after editing a row
        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            // Get the ID of the department being updated
            string dept_from_DK = GridView1.DataKeys[e.RowIndex].Values["deptId"].ToString();

            // Find the TextBoxes inside the GridView row using their IDs
            TextBox mdname = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txteditdname");
            TextBox mdetails = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txteditdetails");

            // Setup connection
            string strcon = WebConfigurationManager.ConnectionStrings["corpDb"].ConnectionString;
            SqlConnection con = new SqlConnection(strcon);
            con.Open();

            // SQL query to update the records
            SqlCommand cmd = new SqlCommand("update deptMaster set dName=@dName , dDetails=@dDetails where deptId=@deptId", con);

            // Assign updated values to parameters
            cmd.Parameters.AddWithValue("dName", mdname.Text);
            cmd.Parameters.AddWithValue("dDetails", mdetails.Text);
            cmd.Parameters.AddWithValue("deptId", dept_from_DK);

            // Execute the update
            cmd.ExecuteNonQuery();

            // Success message and close
            lblMsg.Text = "Department Upadted Successfully...";
            con.Close();
            // Switch back to normal view (exit edit mode)
            GridView1.EditIndex = -1;
            // Refresh data
            FillGridView();
        }

        // Runs when the user clicks a page number (1, 2, 3...) in the GridView
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            // Get the stored data from ViewState (to save a database trip)
            DataSet mydataset = (DataSet)ViewState["v1"];
            DataTable mydatatable = mydataset.Tables["t1"];
            // Set the GridView to the new page number
            GridView1.DataSource = mydatatable;
            GridView1.PageIndex = e.NewPageIndex;
            // Re-bind the data
            GridView1.DataBind();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}