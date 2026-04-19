<%@ Page Title="" Language="C#" MasterPageFile="~/Home1.Master" AutoEventWireup="true" CodeBehind="searchEmpId.aspx.cs" Inherits="Corporate.searchEmpId" %>
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

    <div class="container mt-4 mb-5">
        
        <div class="row mb-4">
            <div class="col-12 text-center">
                <div class="search-area p-4 shadow-sm bg-white rounded d-inline-block">
                    <h4 class="mb-3 text-primary">Search Employee By ID</h4>
                    <div class="d-flex justify-content-center align-items-center mt-3">
                        <span class="mr-3 font-weight-bold" style="font-size: 16px;">Enter Employee ID:</span>
                        <asp:TextBox ID="searchId" CssClass="form-control form-control-sm mr-3 shadow-sm" Width="180px" runat="server"></asp:TextBox>
                        <asp:Button ID="search" runat="server" CssClass="btn btn-primary btn-rounded px-4 shadow-sm" OnClick="search_Click" Text="Search" />
                    </div>
                </div>
            </div>
        </div>

        <div class="row justify-content-center">
            <div class="col-md-10">
                <asp:Panel ID="Panel1" runat="server" Visible="false" Width="100%">
                    
                    <div class="table-responsive bg-white p-3 rounded shadow-sm">
                        <table class="table table-striped table-bordered table-hover text-center w-100 mb-0">
                            <tr class="bg-dark text-white">
                                <th>First Name</th>
                                <th>Middle Name</th>
                                <th>Last Name</th>
                            </tr>
                            <tr>
                                <td><asp:Label ID="lblfName" runat="server"></asp:Label></td>
                                <td><asp:Label ID="lblmName" runat="server"></asp:Label></td>
                                <td><asp:Label ID="lbllName" runat="server"></asp:Label></td>
                            </tr>
                            
                            <tr><td colspan="3" class="border-0 p-2"></td></tr> <tr class="bg-dark text-white">
                                <th>Contact No.</th>
                                <th>Department Name</th>
                                <th>Role</th>
                            </tr>
                            <tr>
                                <td><asp:Label ID="lblcontact" runat="server"></asp:Label></td>
                                <td><asp:Label ID="lblDept" runat="server"></asp:Label></td>
                                <td><asp:Label ID="lblRole" runat="server"></asp:Label></td>
                            </tr>

                            <tr><td colspan="3" class="border-0 p-2"></td></tr>

                            <tr class="bg-dark text-white">
                                <th>Email</th>
                                <th>Date of Joining</th>
                                <th>Address</th>
                            </tr>
                            <tr>
                                <td><asp:Label ID="lblEmail" runat="server"></asp:Label></td>
                                <td><asp:Label ID="lblDoj" runat="server"></asp:Label></td>
                                <td><asp:Label ID="lblAddress" runat="server"></asp:Label></td>
                            </tr>

                            <tr><td colspan="3" class="border-0 p-2"></td></tr>

                            <tr class="bg-dark text-white">
                                <th>Pincode</th>
                                <th colspan="2">Status Message</th>
                            </tr>
                            <tr>
                                <td><asp:Label ID="lblPincode" runat="server"></asp:Label></td>
                                <td colspan="2">
                                    <asp:Label ID="lblMsg" runat="server" CssClass="text-success font-weight-bold d-block"></asp:Label>
                                    <asp:Label ID="lblError" runat="server" CssClass="text-danger font-weight-bold d-block"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </div>

                </asp:Panel>
            </div>
        </div>

    </div>

</asp:Content>
