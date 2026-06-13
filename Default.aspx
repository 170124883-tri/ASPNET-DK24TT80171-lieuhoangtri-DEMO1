<%@ Page Title="Trang chủ"
Language="C#"
MasterPageFile="~/Site.Master"
AutoEventWireup="true"
CodeBehind="Default.aspx.cs"
Inherits="ASPNET_da21tta_HoangTri_AppleStore._Default" %>

<asp:Content ID="Content1"
ContentPlaceHolderID="MainContent"
runat="server">

<div class="hero-section">


<h1>
    🍎 APPLE STORE MANAGEMENT
</h1>

<p>
    Hệ thống quản lý bán hàng Apple Store bằng ASP.NET Web Forms
</p>


</div>

<div class="row g-4">


<div class="col-md-4">

    <div class="card stat-card bg-primary">

        <div class="card-body text-center">

            <h1>
                <asp:Label ID="lblTongSP"
                    runat="server">
                </asp:Label>
            </h1>

            <h5>
                📦 Sản phẩm
            </h5>

        </div>

    </div>

</div>

<div class="col-md-4">

    <div class="card stat-card bg-success">

        <div class="card-body text-center">

            <h1>
                <asp:Label ID="lblTongDM"
                    runat="server">
                </asp:Label>
            </h1>

            <h5>
                📂 Danh mục
            </h5>

        </div>

    </div>

</div>

<div class="col-md-4">

    <div class="card stat-card bg-warning text-dark">

        <div class="card-body text-center">

            <h1>
                <asp:Label ID="lblTongKH"
                    runat="server">
                </asp:Label>
            </h1>

            <h5>
                👤 Khách hàng
            </h5>

        </div>

    </div>

</div>


</div>

<div class="card shadow-lg mt-5">


<div class="card-body text-center">

    <h2>
        🚀 Chào mừng đến với Apple Store
    </h2>

    <p class="lead">

        Hệ thống quản lý sản phẩm, khách hàng,
        danh mục và đơn hàng.

    </p>

    <a href="Admin.aspx"
        class="btn btn-primary btn-lg">

        📊 Vào Dashboard

    </a>

</div>


</div>

<style>

.hero-section{
    text-align:center;
    padding:50px 20px;
    margin-bottom:40px;
    background:linear-gradient(135deg,#0d6efd,#6610f2);
    color:white;
    border-radius:25px;
}

.hero-section h1{
    font-size:55px;
    font-weight:800;
}

.hero-section p{
    font-size:22px;
}

.stat-card{
    color:white;
    border:none;
    border-radius:20px;
    transition:.3s;
}

.stat-card:hover{
    transform:translateY(-5px);
}

.stat-card h1{
    font-size:48px;
    font-weight:800;
}

.card{
    border:none;
    border-radius:20px;
}

</style>

</asp:Content>
