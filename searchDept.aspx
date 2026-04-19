<%@ Page Title="" Language="C#" MasterPageFile="~/Home1.Master" AutoEventWireup="true" CodeBehind="searchDept.aspx.cs" Inherits="Corporate.searchDept" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="container mt-4">
        
        <div class="row mb-4">
            <div class="col-12 text-center">
                <div class="search-area p-4 shadow-sm bg-white rounded d-inline-block">
                    <h4 class="mb-3 text-primary">Search Employee By Department</h4>
                    
                    <div class="d-flex justify-content-center align-items-center mt-3">
                        <span class="mr-3 font-weight-bold" style="font-size: 16px;">Select Department:</span>
                        
                        <asp:DropDownList ID="selectDept" runat="server" AutoPostBack="True" 
                            OnSelectedIndexChanged="selectDept_SelectedIndexChanged" 
                            AppendDataBoundItems="True" 
                            CssClass="form-control form-select shadow-sm" Width="250px">
                            
                            <asp:ListItem Selected="True" Value="0">-- Select Department --</asp:ListItem>
                            
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
        </div>

        <div class="row justify-content-center mt-3">
            <div class="col-md-11">
                
                <div class="table-responsive bg-white shadow-sm p-3 rounded">
                    
                    <asp:GridView ID="GridView1" CssClass="table table-striped table-bordered table-hover text-center w-100" 
                        runat="server" AutoGenerateColumns="False">
                        
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
                            
                            <asp:TemplateField HeaderText="Email">
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("emailId") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            
                            <asp:TemplateField HeaderText="Contact No">
                                <ItemTemplate>
                                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("contact") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            
                            <asp:TemplateField HeaderText="Date of Joining">
                                <ItemTemplate>
                                    <asp:Label ID="Label8" runat="server" Text='<%# Eval("doj", "{0:dd-MM-yyyy}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    
                </div>
            </div>
        </div>
        
    </div>

</asp:Content>
