<%@ Page Title="Admin Dashboard"
Language="C#"
MasterPageFile="~/Site.Master"
AutoEventWireup="true"
CodeBehind="Admin.aspx.cs"
Inherits="ASPNET_da21tta_HoangTri_AppleStore.Admin" %>

<asp:Content ID="Content1"
ContentPlaceHolderID="MainContent"
runat="server">

<div class="container-fluid">


<!-- HEADER -->

<div class="dashboard-header">

    <div class="welcome-box">

        <h1>
            🍎 APPLE STORE DASHBOARD
        </h1>

        <p>
            Xin chào,
            <strong>
                <asp:Label ID="lblUser" runat="server"></asp:Label>
            </strong>
        </p>

    </div>

</div>

<!-- THỐNG KÊ -->

<div class="row g-4 mb-4">

    <div class="col-md-3">

        <div class="card stat-card bg-primary">

            <div class="card-body text-center">

                <div class="icon">📦</div>

                <h2>
                    <asp:Label ID="lblSP" runat="server"></asp:Label>
                </h2>

                <p>Sản phẩm</p>

            </div>

        </div>

    </div>

    <div class="col-md-3">

        <div class="card stat-card bg-success">

            <div class="card-body text-center">

                <div class="icon">📂</div>

                <h2>
                    <asp:Label ID="lblDM" runat="server"></asp:Label>
                </h2>

                <p>Danh mục</p>

            </div>

        </div>

    </div>

    <div class="col-md-3">

        <div class="card stat-card bg-warning text-dark">

            <div class="card-body text-center">

                <div class="icon">👤</div>

                <h2>
                    <asp:Label ID="lblKH" runat="server"></asp:Label>
                </h2>

                <p>Khách hàng</p>

            </div>

        </div>

    </div>

    <div class="col-md-3">

        <div class="card stat-card bg-danger">

            <div class="card-body text-center">

                <div class="icon">🛒</div>

                <h2>
                    <asp:Label ID="lblDH" runat="server"></asp:Label>
                </h2>

                <p>Đơn hàng</p>

            </div>

        </div>

    </div>

</div>

<!-- DOANH THU -->

<div class="card revenue-card shadow-lg mb-4">

    <div class="card-body text-center">

        <h1>
            💰
        </h1>

        <h2>

            <asp:Label
                ID="lblDoanhThu"
                runat="server">
            </asp:Label>

            VNĐ

        </h2>

        <p class="mb-0">
            Tổng doanh thu hệ thống
        </p>

    </div>

</div>

<!-- CHỨC NĂNG -->

<div class="card shadow-lg border-0">

    <div class="card-header bg-dark text-white">

        <h5 class="mb-0">
            ⚙️ Chức năng quản trị
        </h5>

    </div>

    <div class="card-body">

        <div class="row g-4">

            <div class="col-md-3">

                <asp:Button
                    ID="btnSP"
                    runat="server"
                    Text="📦 Quản lý sản phẩm"
                    CssClass="btn btn-primary dashboard-btn"
                    OnClick="btnSP_Click" />

            </div>

            <div class="col-md-3">

                <asp:Button
                    ID="btnDM"
                    runat="server"
                    Text="📂 Quản lý danh mục"
                    CssClass="btn btn-success dashboard-btn"
                    OnClick="btnDM_Click" />

            </div>

            <div class="col-md-3">

                <asp:Button
                    ID="btnKH"
                    runat="server"
                    Text="👤 Quản lý khách hàng"
                    CssClass="btn btn-warning dashboard-btn"
                    OnClick="btnKH_Click" />

            </div>

            <div class="col-md-3">

                <asp:Button
                    ID="btnDH"
                    runat="server"
                    Text="🛒 Quản lý đơn hàng"
                    CssClass="btn btn-danger dashboard-btn"
                    OnClick="btnDH_Click" />

            </div>

        </div>

    </div>

</div>


</div>

<style>

.dashboard-header{
    margin-bottom:35px;
}

.welcome-box{
    background:linear-gradient(135deg,#0d6efd,#6610f2);
    color:white;
    padding:35px;
    border-radius:25px;
    box-shadow:0 10px 25px rgba(0,0,0,.15);
}

.welcome-box h1{
    font-size:50px;
    font-weight:800;
    margin-bottom:10px;
}

.welcome-box p{
    font-size:22px;
    margin:0;
}

.stat-card{
    color:white;
    border:none;
    border-radius:20px;
    transition:.3s;
    box-shadow:0 8px 20px rgba(0,0,0,.15);
}

.stat-card:hover{
    transform:translateY(-8px);
}

.stat-card .card-body{
    padding:30px;
}

.icon{
    font-size:50px;
    margin-bottom:10px;
}

.stat-card h2{
    font-size:40px;
    font-weight:700;
}

.stat-card p{
    margin-bottom:0;
    font-size:18px;
}

.revenue-card{
    border:none;
    border-radius:25px;
    background:white;
}

.revenue-card h2{
    color:#198754;
    font-size:42px;
    font-weight:800;
}

.revenue-card p{
    font-size:18px;
    color:#666;
}

.card{
    border-radius:20px;
}

.card-header{
    font-size:22px;
    font-weight:600;
    padding:16px 24px;
}

.dashboard-btn{
    width:100%;
    height:70px;
    font-size:18px;
    font-weight:600;
    border-radius:15px;
    transition:.3s;
}

.dashboard-btn:hover{
    transform:translateY(-3px);
}

</style>

</asp:Content>
