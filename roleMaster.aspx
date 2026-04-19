<%@ Page Title="" Language="C#" MasterPageFile="~/Home1.Master" AutoEventWireup="true" CodeBehind="roleMaster.aspx.cs" Inherits="Corporate.roleMaster" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="container mt-4 mb-5">
        
        <div class="row justify-content-center mb-4">
            <div class="col-md-8">
                <div class="card shadow-sm border-0">
                    <div class="card-header bg-primary text-white text-center py-3">
                        <h4 class="mb-0">ADD / Manage Role Details</h4>
                    </div>
                    <div class="card-body p-4 bg-light">
                        
                        <div class="form-group row align-items-center mb-3">
                            <label class="col-sm-4 col-form-label font-weight-bold text-md-right">Name of the Role:</label>
                            <div class="col-sm-7">
                                <asp:TextBox ID="txtroleName" CssClass="form-control" runat="server" placeholder="Enter Role Name"></asp:TextBox>
                            </div>
                            <div class="col-sm-1">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtroleName" Display="Dynamic" ErrorMessage="Role Name Should Not Be Empty" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <div class="form-group row align-items-center mb-4">
                            <label class="col-sm-4 col-form-label font-weight-bold text-md-right">Role Details:</label>
                            <div class="col-sm-7">
                                <asp:TextBox ID="txtroleDetails" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" placeholder="Enter Role Description"></asp:TextBox>
                            </div>
                            <div class="col-sm-1">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtroleDetails" Display="Dynamic" ErrorMessage="Role Details Should Not Be Empty" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <div class="text-center mt-4">
                            <asp:Button ID="submitbtn" runat="server" CssClass="btn btn-success btn-rounded px-4 mx-2 shadow-sm" Text="Add The Role" OnClick="Button1_Click" />
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
            <div class="col-md-11">
                <div class="table-responsive shadow-sm p-3 bg-white rounded border">
                    
                    <asp:GridView ID="GridView2" runat="server" 
                        CssClass="table table-striped table-bordered table-hover text-center w-100 mb-0" 
                        AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="roleId" 
                        PageSize="5" ShowFooter="True" 
                        OnRowCancelingEdit="GridView2_RowCancelingEdit" OnRowDeleting="GridView2_RowDeleting" 
                        OnRowEditing="GridView2_RowEditing" OnRowUpdating="GridView2_RowUpdating" 
                        OnPageIndexChanging="GridView2_PageIndexChanging">
                        
                        <HeaderStyle CssClass="bg-dark text-white" />
                        
                        <Columns>
                            <asp:TemplateField HeaderText="Role ID">
                                <EditItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("roleId") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("roleId") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            
                            <asp:TemplateField HeaderText="Role Name">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtrolename" CssClass="form-control form-control-sm" runat="server" Text='<%# Eval("roleName") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("roleName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            
                            <asp:TemplateField HeaderText="Role Details">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtroledetails" CssClass="form-control form-control-sm" runat="server" Text='<%# Eval("roledetails") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("roleDetails") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            
                            <asp:TemplateField HeaderText="Operations">
                                <EditItemTemplate>
                                    <asp:Button ID="Button3" runat="server" CssClass="btn btn-success btn-sm mx-1" CommandName="Update" Text="Update" CausesValidation="False" />
                                    <asp:Button ID="Button4" runat="server" CssClass="btn btn-warning btn-sm mx-1" CommandName="Cancel" Text="Cancel" CausesValidation="False" />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Button ID="Button1" runat="server" CssClass="btn btn-info btn-sm text-white mx-1" CommandName="Edit" Text="Edit" CausesValidation="False" />
                                    <asp:Button ID="Button2" runat="server" CssClass="btn btn-danger btn-sm mx-1" CommandName="Delete" Text="Delete" CausesValidation="False" />
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