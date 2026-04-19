<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login1.aspx.cs" Inherits="Corporate.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <!-- Required meta tags -->
     <meta charset="utf-8">
     <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
     <title>PolluxUI Admin</title>
     <!-- base:css -->
     <link rel="stylesheet" href="../../vendors/typicons/typicons.css">
     <link rel="stylesheet" href="../../vendors/css/vendor.bundle.base.css">
     <!-- endinject -->
     <!-- plugin css for this page -->
     <!-- End plugin css for this page -->
     <!-- inject:css -->
     <link rel="stylesheet" href="../../css/vertical-layout-light/style.css">
     <!-- endinject -->
     <link rel="shortcut icon" href="../../images/favicon.png" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-scroller">
          <div class="container-fluid page-body-wrapper full-page-wrapper">
            <div class="content-wrapper d-flex align-items-center auth px-0">
              <div class="row w-100 mx-0">
                <div class="col-lg-4 mx-auto">
                  <div class="auth-form-light text-left py-5 px-4 px-sm-5">
                    <div class="brand-logo">
                      <img src="corpHive.png" alt="logo">
                    </div>
                    <h4>Hello! let's get started</h4>
                    <h6 class="font-weight-light">Sign in to continue.</h6>
                    </div>
                      <div class="form-group">
                          <asp:TextBox ID="txtuserName" class="form-control form-control-lg" placeholder="Username" runat="server"></asp:TextBox>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtuserName" Display="Dynamic" ErrorMessage="RequiredFieldValidator" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                      </div>
                      <div class="form-group">
                            <asp:TextBox ID="txtPassword" class="form-control form-control-lg" placeholder="Password" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPassword" ErrorMessage="RequiredFieldValidator" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                      </div>
                      <div class="mt-3">
                        <asp:Button ID="Button1" class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" runat="server" OnClick="Button1_Click" Text="Log In" />
                          <br />
                          <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
                      </div>
                      <div class="my-2 d-flex justify-content-between align-items-center">
                        <div class="form-check">
                        </div
                      </div
                    </form>
                  </div>
                </div>
              </div>
            </div>
            <!-- content-wrapper ends -->
          </div>
          <!-- page-body-wrapper ends -->
        </div>
        <!-- container-scroller -->
        <!-- base:js -->
        <script src="../../vendors/js/vendor.bundle.base.js"></script>
        <!-- endinject -->
        <!-- inject:js -->
        <script src="../../js/off-canvas.js"></script>
        <script src="../../js/hoverable-collapse.js"></script>
        <script src="../../js/template.js"></script>
        <script src="../../js/settings.js"></script>
        <script src="../../js/todolist.js"></script>
        <!-- endinject -->
    </form>
</body>
</html>
