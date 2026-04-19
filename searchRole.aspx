<%@ Page Title="" Language="C#" MasterPageFile="~/Home1.Master" AutoEventWireup="true" CodeBehind="searchRole.aspx.cs" Inherits="Corporate.searchRole" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 6px;
        }
        .auto-style3 {
            width: 6px;
            height: 32px;
        }
        .auto-style4 {
            height: 32px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="container mt-4">
        
        <div class="row mb-4">
            <div class="col-12 text-center">
                <div class="search-area p-4 shadow-sm bg-white rounded d-inline-block">
                    <h4 class="mb-3 text-primary">Search Employee By Role</h4>
                    
                    <div class="d-flex justify-content-center align-items-center mt-3">
                        <span class="mr-3 font-weight-bold" style="font-size: 16px;">Select Role:</span>
                        
                        <asp:DropDownList ID="selectRole" runat="server" AutoPostBack="True" 
                            OnSelectedIndexChanged="selectRole_SelectedIndexChanged" 
                            AppendDataBoundItems="True" 
                            CssClass="form-control form-select shadow-sm" Width="250px">
                            
                            <asp:ListItem Selected="True" Value="0">-- Select Role --</asp:ListItem>
                            
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
        </div>

        <div class="row justify-content-center mt-3">
            <div class="col-md-11">
                
                <div class="table-responsive bg-white shadow-sm p-3 rounded">
                    
                    <asp:GridView ID="GridView1" CssClass="table table-striped table-bordered table-hover text-center w-100" 
                        runat="server" AutoGenerateColumns="False" 
                        OnSelectedIndexChanged="selectRole_SelectedIndexChanged">
                        
                        <HeaderStyle CssClass="bg-dark text-white" /> <Columns>
                            <asp:TemplateField HeaderText="First Name">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("fName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            
                            <asp:TemplateField HeaderText="Middle Name">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("mName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            
                            <asp:TemplateField HeaderText="Last Name">
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("lName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            
                            <asp:TemplateField HeaderText="Department Name">
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("dName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            
                            <asp:TemplateField HeaderText="Role Name">
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("roleName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            
                            <asp:TemplateField HeaderText="Contact Details">
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("contact") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            
                            <asp:TemplateField HeaderText="Email ID">
                                <ItemTemplate>
                                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("emailId") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    
                </div>
            </div>
        </div>
        
    </div>

</asp:Content>
