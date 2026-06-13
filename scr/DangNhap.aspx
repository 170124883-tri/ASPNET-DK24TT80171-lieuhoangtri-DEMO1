<%@ Page Language="C#"
AutoEventWireup="true"
CodeBehind="DangNhap.aspx.cs"
Inherits="ASPNET_da21tta_HoangTri_AppleStore.DangNhap" %>

<!DOCTYPE html>

<html>

<head runat="server">

<title>Đăng nhập hệ thống</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
rel="stylesheet" />

<style>

body{
    min-height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    background:linear-gradient(135deg,#0d6efd,#6610f2);
}

.login-box{
    width:450px;
    background:white;
    padding:40px;
    border-radius:25px;
    box-shadow:0 10px 30px rgba(0,0,0,.2);
}

.logo{
    font-size:70px;
    text-align:center;
}

.title{
    text-align:center;
    font-weight:700;
    margin-bottom:20px;
}

.form-control{
    height:50px;
    border-radius:12px;
}

.btn-login{
    height:50px;
    border-radius:12px;
    font-weight:700;
}

.footer{
    text-align:center;
    margin-top:20px;
    color:#777;
}

</style>

</head>

<body>

<form id="form1" runat="server">

<div class="login-box">

<div class="logo">
🍎
</div>

<h2 class="title">
APPLE STORE
</h2>

<div class="mb-3">

<label>Tên đăng nhập</label>

<asp:TextBox
ID="txtUser"
runat="server"
CssClass="form-control">
</asp:TextBox>

</div>

<div class="mb-3">

<label>Mật khẩu</label>

<asp:TextBox
ID="txtPass"
runat="server"
TextMode="Password"
CssClass="form-control">
</asp:TextBox>

</div>

<div class="text-center mb-3">

<asp:Label
ID="lblTB"
runat="server"
ForeColor="Red">
</asp:Label>

</div>

<div class="d-grid">

<asp:Button
ID="btnLogin"
runat="server"
Text="🔐 Đăng nhập"
CssClass="btn btn-primary btn-login"
OnClick="btnLogin_Click" />

</div>

<div class="footer">

Apple Store Management System

<br />

Liêu Hoàng Trí

</div>

</div>

</form>

</body>

</html>
