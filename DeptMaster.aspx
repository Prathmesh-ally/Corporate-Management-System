<%@ Page Title="" Language="C#" MasterPageFile="~/Home1.Master" AutoEventWireup="true" CodeBehind="DeptMaster.aspx.cs" Inherits="Corporate.DeptMaster" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="container mt-4 mb-5">
        
        <div class="row justify-content-center mb-4">
            <div class="col-md-8">
                <div class="card shadow-sm border-0">
                    <div class="card-header bg-primary text-white text-center py-3">
                        <h4 class="mb-0">ADD / Manage Department Details</h4>
                    </div>
                    <div class="card-body p-4 bg-light">
                        
                        <div class="form-group row align-items-center mb-3">
                            <label class="col-sm-4 col-form-label font-weight-bold text-md-right">Name of the Department:</label>
                            <div class="col-sm-7">
                                <asp:TextBox ID="txtdName" CssClass="form-control" runat="server" placeholder="Enter Department Name"></asp:TextBox>
                            </div>
                            <div class="col-sm-1">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtdName" Display="Dynamic" ErrorMessage="Department Name Should Not Empty" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <div class="form-group row align-items-center mb-4">
                            <label class="col-sm-4 col-form-label font-weight-bold text-md-right">Details of the Department:</label>
                            <div class="col-sm-7">
                                <asp:TextBox ID="txtdDetails" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" placeholder="Enter Department Details"></asp:TextBox>
                            </div>
                            <div class="col-sm-1">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtdDetails" Display="Dynamic" ErrorMessage="Department Details Should Not Be Empty" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <div class="text-center mt-4">
                            <asp:Button ID="submitbtn" runat="server" CssClass="btn btn-success btn-rounded px-4 mx-2 shadow-sm" Text="Submit" OnClick="submitbtn_Click" />
                            <asp:Button ID="resetbtn" runat="server" CssClass="btn btn-secondary btn-rounded px-4 mx-2 shadow-sm" Text="Reset" OnClick="resetbtn_Click" CausesValidation="False" />
                        </div>

                        <div class="text-center mt-3">
                            <asp:Label ID="lblMsg" runat="server" CssClass="font-weight-bold d-block"></asp:Label>
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" CssClass="mt-2" DisplayMode="BulletList" />
                        </div>

                    </div>
                </div>
            </div>
        </div>

        <div class="row justify-content-center">
            <div class="col-md-11">
                <div class="table-responsive shadow-sm p-3 bg-white rounded border">
                    
                    <asp:GridView ID="GridView1" runat="server" 
                        CssClass="table table-striped table-bordered table-hover text-center w-100 mb-0" 
                        AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="deptId" 
                        OnRowDeleting="GridView1_RowDeleting" PageSize="5" ShowFooter="True" 
                        OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" 
                        OnRowUpdating="GridView1_RowUpdating" OnPageIndexChanging="GridView1_PageIndexChanging" 
                        OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                        
                        <HeaderStyle CssClass="bg-dark text-white" />
                        
                        <Columns>
                            <asp:TemplateField HeaderText="Dept ID">
                                <EditItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("deptId") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("deptId") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            
                            <asp:TemplateField HeaderText="Department Name">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txteditdname" CssClass="form-control form-control-sm" runat="server" Text='<%# Eval("dName") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("dName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            
                            <asp:TemplateField HeaderText="Department Details">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txteditdetails" CssClass="form-control form-control-sm" runat="server" Text='<%# Eval("dDetails") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("dDetails") %>'></asp:Label>
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
