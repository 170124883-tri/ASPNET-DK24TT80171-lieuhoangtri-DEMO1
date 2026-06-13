<%@ Page Title="Quản lý khách hàng"
Language="C#"
MasterPageFile="~/Site.Master"
AutoEventWireup="true"
CodeBehind="QuanLyKhachHang.aspx.cs"
Inherits="ASPNET_da21tta_HoangTri_AppleStore.QuanLyKhachHang" %>

<asp:Content ID="Content1"
ContentPlaceHolderID="MainContent"
runat="server">

<div class="container-fluid">


<!-- TIÊU ĐỀ -->

<div class="page-header">

    <h1>
        👤 QUẢN LÝ KHÁCH HÀNG
    </h1>

    <p>
        Quản lý thông tin khách hàng của Apple Store
    </p>

</div>

<!-- THỐNG KÊ -->

<div class="row mb-4">

    <div class="col-md-4">

        <div class="card stat-card bg-primary">

            <div class="card-body text-center">

                <div class="icon">
                    👥
                </div>

                <h3>
                    DANH SÁCH KHÁCH HÀNG
                </h3>

                <p>
                    Quản lý toàn bộ khách hàng
                </p>

            </div>

        </div>

    </div>

    <div class="col-md-4">

        <div class="card stat-card bg-success">

            <div class="card-body text-center">

                <div class="icon">
                    📧
                </div>

                <h3>
                    EMAIL
                </h3>

                <p>
                    Thông tin liên hệ khách hàng
                </p>

            </div>

        </div>

    </div>

    <div class="col-md-4">

        <div class="card stat-card bg-warning text-dark">

            <div class="card-body text-center">

                <div class="icon">
                    📱
                </div>

                <h3>
                    LIÊN HỆ
                </h3>

                <p>
                    Số điện thoại khách hàng
                </p>

            </div>

        </div>

    </div>

</div>

<!-- DANH SÁCH -->

<div class="card shadow-lg border-0">

    <div class="card-header bg-primary text-white">

        <h5 class="mb-0">
            📋 Danh sách khách hàng
        </h5>

    </div>

    <div class="card-body">

        <div class="table-responsive">

            <asp:GridView
                ID="gvKhachHang"
                runat="server"
                Width="100%"
                CssClass="table table-hover align-middle"
                AutoGenerateColumns="False"
                DataKeyNames="MaKH"
                OnRowDeleting="gvKhachHang_RowDeleting">

                <Columns>

                    <asp:TemplateField HeaderText="Thao tác">

                        <ItemTemplate>

                            <asp:LinkButton
                                ID="btnDelete"
                                runat="server"
                                CommandName="Delete"
                                CssClass="btn btn-danger btn-sm action-btn"
                                OnClientClick="return confirm('Bạn có chắc muốn xoá khách hàng này?');">

                                🗑 Xóa

                            </asp:LinkButton>

                        </ItemTemplate>

                    </asp:TemplateField>

                    <asp:BoundField
                        DataField="MaKH"
                        HeaderText="Mã KH"
                        ReadOnly="True" />

                    <asp:BoundField
                        DataField="HoTen"
                        HeaderText="Họ tên" />

                    <asp:BoundField
                        DataField="Email"
                        HeaderText="Email" />

                    <asp:BoundField
                        DataField="DiaChi"
                        HeaderText="Địa chỉ" />

                    <asp:BoundField
                        DataField="SoDienThoai"
                        HeaderText="Số điện thoại" />

                </Columns>

            </asp:GridView>

        </div>

        <div class="text-end mt-4">

            <asp:Button
                ID="btnBack"
                runat="server"
                Text="⬅ Quay lại Dashboard"
                CssClass="btn btn-primary btn-lg"
                OnClick="btnBack_Click" />

        </div>

    </div>

</div>


</div>

<style>

.page-header{
    margin-bottom:30px;
}

.page-header h1{
    font-size:60px;
    font-weight:800;
    color:#222;
}

.page-header p{
    color:#6c757d;
    font-size:22px;
}

.card{
    border:none;
    border-radius:20px;
    overflow:hidden;
}

.card-header{
    font-size:22px;
    font-weight:600;
    padding:16px 24px;
}

.stat-card{
    color:white;
    border:none;
    border-radius:20px;
    transition:.3s;
    box-shadow:0 8px 20px rgba(0,0,0,.15);
}

.stat-card:hover{
    transform:translateY(-5px);
}

.icon{
    font-size:50px;
    margin-bottom:10px;
}

.table{
    margin-bottom:0;
}

.table thead th{
    background:#212529;
    color:white;
    text-align:center;
    border:none;
    padding:15px;
    font-size:17px;
}

.table td{
    vertical-align:middle;
    padding:18px;
    font-size:17px;
}

.table-hover tbody tr:hover{
    background:#f8f9ff;
}

.action-btn{
    border-radius:10px;
    font-weight:600;
}

.btn-lg{
    border-radius:12px;
    font-weight:600;
}

</style>

</asp:Content>
