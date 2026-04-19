<%@ Page Title="" Language="C#" MasterPageFile="~/Home1.Master" AutoEventWireup="true" CodeBehind="employeeMaster.aspx.cs" Inherits="Corporate.employeeMaster" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            height: 32px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="container-fluid mt-4 mb-5 px-md-5">
        
        <div class="row justify-content-center mb-4">
            <div class="col-lg-10">
                <div class="card shadow-sm border-0">
                    <div class="card-header bg-primary text-white text-center py-3">
                        <h4 class="mb-0">Add Employee Master Details</h4>
                    </div>
                    
                    <div class="card-body p-4 bg-light">
                        
                        <h5 class="text-secondary border-bottom pb-2 mb-3">Personal Information</h5>
                        <div class="row mb-3">
                            <div class="col-md-4">
                                <label class="font-weight-bold">First Name <span class="text-danger">*</span></label>
                                <asp:TextBox ID="txtfName" CssClass="form-control" runat="server" placeholder="Enter First Name"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtfName" Display="Dynamic" ErrorMessage="First Name required" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtfName" Display="Dynamic" ErrorMessage="Invalid Name" ForeColor="Red" SetFocusOnError="True" ValidationExpression="^[a-zA-z]+([\s][a-zA-Z]+)*$"></asp:RegularExpressionValidator>
                            </div>
                            <div class="col-md-4 mt-3 mt-md-0">
                                <label class="font-weight-bold">Middle Name <span class="text-danger">*</span></label>
                                <asp:TextBox ID="txtmName" CssClass="form-control" runat="server" placeholder="Enter Middle Name"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtmName" Display="Dynamic" ErrorMessage="Middle Name required" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtmName" Display="Dynamic" ErrorMessage="Invalid Name" ForeColor="Red" SetFocusOnError="True" ValidationExpression="^[a-zA-z]+([\s][a-zA-Z]+)*$"></asp:RegularExpressionValidator>
                            </div>
                            <div class="col-md-4 mt-3 mt-md-0">
                                <label class="font-weight-bold">Last Name <span class="text-danger">*</span></label>
                                <asp:TextBox ID="txtlName" CssClass="form-control" runat="server" placeholder="Enter Last Name"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtlName" Display="Dynamic" ErrorMessage="Last Name required" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="txtlName" Display="Dynamic" ErrorMessage="Invalid Name" ForeColor="Red" SetFocusOnError="True" ValidationExpression="^[a-zA-z]+([\s][a-zA-Z]+)*$"></asp:RegularExpressionValidator>
                            </div>
                        </div>

                        <h5 class="text-secondary border-bottom pb-2 mb-3 mt-4">Contact Details</h5>
                        <div class="row mb-3">
                            <div class="col-md-4">
                                <label class="font-weight-bold">Contact Number <span class="text-danger">*</span></label>
                                <asp:TextBox ID="contactNo" CssClass="form-control" runat="server" placeholder="10-digit Number"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="contactNo" Display="Dynamic" ErrorMessage="Contact required" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="contactNo" Display="Dynamic" ErrorMessage="Invalid Number" ForeColor="Red" SetFocusOnError="True" ValidationExpression="^[789]\d{9}$"></asp:RegularExpressionValidator>
                            </div>
                            <div class="col-md-5 mt-3 mt-md-0">
                                <label class="font-weight-bold">Email Address <span class="text-danger">*</span></label>
                                <asp:TextBox ID="txtemail" CssClass="form-control" runat="server" placeholder="name@example.com"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtemail" Display="Dynamic" ErrorMessage="Email required" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtemail" Display="Dynamic" ErrorMessage="Invalid Email format" ForeColor="Red" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            </div>
                            <div class="col-md-3 mt-3 mt-md-0">
                                <label class="font-weight-bold">Pincode <span class="text-danger">*</span></label>
                                <asp:TextBox ID="txtpinCode" CssClass="form-control" runat="server" placeholder="6-digit Pincode"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtpinCode" Display="Dynamic" ErrorMessage="Pincode required" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtpinCode" Display="Dynamic" ErrorMessage="Invalid Pincode" ForeColor="Red" SetFocusOnError="True" ValidationExpression="^[1-9][0-9]{5}$"></asp:RegularExpressionValidator>
                            </div>
                        </div>

                        <div class="row mb-3">
                            <div class="col-12">
                                <label class="font-weight-bold">Full Address <span class="text-danger">*</span></label>
                                <asp:TextBox ID="txtaddress" CssClass="form-control" runat="server" TextMode="MultiLine" Rows="2" placeholder="Enter complete address"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtaddress" Display="Dynamic" ErrorMessage="Address required" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <h5 class="text-secondary border-bottom pb-2 mb-3 mt-4">Corporate Assignment</h5>
                        <div class="row mb-3 align-items-end">
                            <div class="col-md-4">
                                <label class="font-weight-bold">Department <span class="text-danger">*</span></label>
                                <asp:DropDownList ID="selectDept" CssClass="form-control form-select shadow-sm" runat="server"></asp:DropDownList>
                            </div>
                            <div class="col-md-4 mt-3 mt-md-0">
                                <label class="font-weight-bold">Role <span class="text-danger">*</span></label>
                                <asp:DropDownList ID="selectRole" CssClass="form-control form-select shadow-sm" runat="server"></asp:DropDownList>
                            </div>
                            <div class="col-md-4 mt-3 mt-md-0">
                                <label class="font-weight-bold">Date of Joining <span class="text-danger">*</span></label>
                                <div class="input-group">
                                    <asp:TextBox ID="txtdoj" CssClass="form-control" runat="server" placeholder="Select Date"></asp:TextBox>
                                    <div class="input-group-append">
                                        <asp:Button ID="btnCalender" runat="server" CssClass="btn btn-outline-secondary" OnClick="btnCalender_Click" Text="📅" CausesValidation="False" />
                                    </div>
                                </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtdoj" Display="Dynamic" ErrorMessage="DOJ required" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <div class="row mb-3 justify-content-end">
                             <div class="col-md-4">
                                <asp:Calendar ID="Calendar1" runat="server" OnSelectionChanged="Calendar1_SelectionChanged" CssClass="bg-white border rounded shadow-sm" Visible="false"></asp:Calendar>
                             </div>
                        </div>

                        <div class="row mb-4">
                            <div class="col-md-6">
                                <label class="font-weight-bold">Upload Profile Image <span class="text-danger">*</span></label>
                                <asp:FileUpload ID="FileUpload1" CssClass="form-control-file border p-2 rounded bg-white w-100" runat="server" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="FileUpload1" Display="Dynamic" ErrorMessage="Profile Image required" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <hr />
                        <div class="text-center mt-4">
                            <asp:Button ID="submitbtn" CssClass="btn btn-success btn-lg px-5 mx-2 shadow-sm rounded-pill" runat="server" Text="Submit" OnClick="submitbtn_Click" />
                            <asp:Button ID="resetbtn" CssClass="btn btn-secondary btn-lg px-5 mx-2 shadow-sm rounded-pill" runat="server" Text="Reset" OnClick="resetbtn_Click" CausesValidation="False" />
                        </div>

                        <div class="text-center mt-3">
                            <asp:Label ID="lblMsg" runat="server" CssClass="font-weight-bold d-block text-success"></asp:Label>
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" CssClass="mt-2 text-left d-inline-block" DisplayMode="BulletList" />
                        </div>

                    </div>
                </div>
            </div>
        </div>

        <div class="row justify-content-center">
            <div class="col-12"> <div class="table-responsive shadow-sm p-3 bg-white rounded border">
                    
                    <asp:GridView ID="GridView1" runat="server" 
                        CssClass="table table-striped table-bordered table-hover text-center mb-0 align-middle" 
                        AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="empId" 
                        OnPageIndexChanging="GridView1_PageIndexChanging" OnRowDeleting="GridView1_RowDeleting" 
                        OnRowUpdating="GridView1_RowUpdating" PageSize="5" ShowFooter="True">
                        
                        <HeaderStyle CssClass="bg-dark text-white" />
                        
                        <Columns>
                            <asp:TemplateField HeaderText="First Name">
                                <ItemTemplate><asp:Label ID="Label1" runat="server" Text='<%# Eval("fName") %>'></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Middle Name">
                                <ItemTemplate><asp:Label ID="Label2" runat="server" Text='<%# Eval("mName") %>'></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Last Name">
                                <ItemTemplate><asp:Label ID="Label3" runat="server" Text='<%# Eval("lName") %>'></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Contact No">
                                <ItemTemplate><asp:Label ID="Label4" runat="server" Text='<%# Eval("contact") %>'></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Dept">
                                <ItemTemplate><asp:Label ID="Label5" runat="server" Text='<%# Eval("dName") %>'></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Role">
                                <ItemTemplate><asp:Label ID="Label6" runat="server" Text='<%# Eval("roleName") %>'></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Email">
                                <ItemTemplate><asp:Label ID="Label7" runat="server" Text='<%# Eval("emailId") %>'></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Action">
                                <ItemTemplate>
                                    <asp:Button ID="Button1" runat="server" CssClass="btn btn-info btn-sm text-white m-1" CausesValidation="False" CommandName="Update" Text="Edit" />
                                    <asp:Button ID="Button2" runat="server" CssClass="btn btn-danger btn-sm m-1" CausesValidation="False" CommandName="Delete" Text="Delete" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        
                        <PagerStyle CssClass="pagination-ys bg-light text-center" />
                    </asp:GridView>
                    
                </div>
            </div>
        </div>

    </div>

</asp:Content>
