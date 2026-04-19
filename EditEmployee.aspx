<%@ Page Title="" Language="C#" MasterPageFile="~/Home1.Master" AutoEventWireup="true" CodeBehind="EditEmployee.aspx.cs" Inherits="Corporate.EditEmployee" %>
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
        
        <div class="row justify-content-center">
            <div class="col-lg-10">
                <div class="card shadow-sm border-0">
                    <div class="card-header bg-info text-white text-center py-3">
                        <h4 class="mb-0">Edit Employee Details</h4>
                    </div>
                    
                    <div class="card-body p-4 bg-light">
                        
                        <h5 class="text-secondary border-bottom pb-2 mb-3">Personal Information</h5>
                        <div class="row mb-3">
                            <div class="col-md-4">
                                <label class="font-weight-bold">First Name</label>
                                <asp:TextBox ID="txtfName" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-4 mt-3 mt-md-0">
                                <label class="font-weight-bold">Middle Name</label>
                                <asp:TextBox ID="txtmName" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-4 mt-3 mt-md-0">
                                <label class="font-weight-bold">Last Name</label>
                                <asp:TextBox ID="txtlName" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>

                        <h5 class="text-secondary border-bottom pb-2 mb-3 mt-4">Contact Details</h5>
                        <div class="row mb-3">
                            <div class="col-md-4">
                                <label class="font-weight-bold">Contact Number</label>
                                <asp:TextBox ID="contact" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-5 mt-3 mt-md-0">
                                <label class="font-weight-bold">Email Address</label>
                                <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-3 mt-3 mt-md-0">
                                <label class="font-weight-bold">Pincode</label>
                                <asp:TextBox ID="txtpinCode" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>

                        <div class="row mb-3">
                            <div class="col-12">
                                <label class="font-weight-bold">Full Address</label>
                                <asp:TextBox ID="txtaddress" CssClass="form-control" runat="server" TextMode="MultiLine" Rows="2"></asp:TextBox>
                            </div>
                        </div>

                        <h5 class="text-secondary border-bottom pb-2 mb-3 mt-4">Corporate Assignment</h5>
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label class="font-weight-bold">Department</label>
                                <div class="d-flex align-items-center">
                                    <asp:DropDownList ID="selectDept" CssClass="form-control form-select shadow-sm mr-2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="selectDept_SelectedIndexChanged"></asp:DropDownList>
                                    <asp:TextBox ID="txtDept" CssClass="form-control bg-white text-muted" runat="server" placeholder="Current Dept"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6 mt-3 mt-md-0">
                                <label class="font-weight-bold">Role</label>
                                <div class="d-flex align-items-center">
                                    <asp:DropDownList ID="selectRole" CssClass="form-control form-select shadow-sm mr-2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="selectRole_SelectedIndexChanged"></asp:DropDownList>
                                    <asp:TextBox ID="txtRole" CssClass="form-control bg-white text-muted" runat="server" placeholder="Current Role"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row mb-3 align-items-end">
                            <div class="col-md-6">
                                <label class="font-weight-bold">Date of Joining</label>
                                <div class="input-group">
                                    <asp:TextBox ID="txtDoj" CssClass="form-control" runat="server"></asp:TextBox>
                                    <div class="input-group-append">
                                        <asp:Button ID="Button1" runat="server" CssClass="btn btn-outline-secondary" OnClick="Button1_Click" Text="📅" />
                                    </div>
                                </div>
                                <div class="mt-2">
                                    <asp:Calendar ID="Calendar1" runat="server" OnSelectionChanged="Calendar1_SelectionChanged" CssClass="bg-white border rounded shadow-sm"></asp:Calendar>
                                </div>
                            </div>

                            <div class="col-md-6 mt-3 mt-md-0">
                                <label class="font-weight-bold">Profile Image</label>
                                <div class="d-flex align-items-center p-2 border rounded bg-white">
                                    <asp:Image ID="pastImage" runat="server" Height="75px" Width="75px" CssClass="rounded border mr-3 shadow-sm object-fit-cover" />
                                    <div class="w-100">
                                        <span class="text-muted small d-block mb-1">Upload new image to replace</span>
                                        <asp:FileUpload ID="FileUpload1" CssClass="form-control-file w-100" runat="server" />
                                    </div>
                                </div>
                            </div>
                        </div>

                        <hr />
                        <div class="text-center mt-4">
                            <asp:Button ID="btnSubmit" CssClass="btn btn-success btn-lg px-5 mx-2 shadow-sm rounded-pill" runat="server" Text="Update Details" OnClick="btnSubmit_Click" />
                            <asp:Button ID="btnReset" CssClass="btn btn-secondary btn-lg px-5 mx-2 shadow-sm rounded-pill" runat="server" Text="Reset" />
                        </div>

                        <div class="text-center mt-3">
                            <asp:Label ID="lblmsg" runat="server" CssClass="font-weight-bold d-block text-primary"></asp:Label>
                        </div>

                    </div>
                </div>
            </div>
        </div>

    </div>

</asp:Content>