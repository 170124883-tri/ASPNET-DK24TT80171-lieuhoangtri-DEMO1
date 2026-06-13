<%@ Page Title="Quản lý danh mục"
Language="C#"
MasterPageFile="~/Site.Master"
AutoEventWireup="true"
CodeBehind="QuanLyDanhMuc.aspx.cs"
Inherits="ASPNET_da21tta_HoangTri_AppleStore.QuanLyDanhMuc" %>

<asp:Content ID="Content1"
ContentPlaceHolderID="MainContent"
runat="server">

<div class="container-fluid">


<div class="page-header">

    <h1>📂 QUẢN LÝ DANH MỤC</h1>

    <p>
        Thêm, sửa và quản lý danh mục sản phẩm Apple Store
    </p>

</div>

<div class="card shadow-lg border-0 mb-4">

    <div class="card-header bg-success text-white">

        <h5 class="mb-0">
            ➕ Thêm danh mục mới
        </h5>

    </div>

    <div class="card-body">

        <div class="row align-items-end">

            <div class="col-md-9">

                <label class="form-label">
                    Tên danh mục
                </label>

                <asp:TextBox
                    ID="txtTenDM"
                    runat="server"
                    CssClass="form-control"
                    placeholder="Nhập tên danh mục">
                </asp:TextBox>

            </div>

            <div class="col-md-3">

                <asp:Button
                    ID="btnThem"
                    runat="server"
                    Text="➕ Thêm danh mục"
                    CssClass="btn btn-success w-100 btn-lg"
                    OnClick="btnThem_Click" />

            </div>

        </div>

    </div>

</div>

<div class="card shadow-lg border-0">

    <div class="card-header bg-dark text-white">

        <h5 class="mb-0">
            📋 Danh sách danh mục
        </h5>

    </div>

    <div class="card-body">

        <div class="table-responsive">

            <asp:GridView
                ID="gvDanhMuc"
                runat="server"
                CssClass="table table-hover align-middle"
                AutoGenerateColumns="False"
                DataKeyNames="MaDM"
                OnRowEditing="gvDanhMuc_RowEditing"
                OnRowCancelingEdit="gvDanhMuc_RowCancelingEdit"
                OnRowUpdating="gvDanhMuc_RowUpdating"
                OnRowDeleting="gvDanhMuc_RowDeleting">

                <HeaderStyle CssClass="table-dark text-center" />

                <Columns>

                    <asp:TemplateField HeaderText="Thao tác">

                        <ItemTemplate>

                            <asp:LinkButton
                                ID="btnSua"
                                runat="server"
                                CommandName="Edit"
                                CssClass="btn-action btn-edit">

                                ✏️ Sửa

                            </asp:LinkButton>

                            <asp:LinkButton
                                ID="btnXoa"
                                runat="server"
                                CommandName="Delete"
                                CssClass="btn-action btn-delete"
                                OnClientClick="return confirm('Bạn có chắc muốn xóa danh mục này?');">

                                🗑 Xóa

                            </asp:LinkButton>

                        </ItemTemplate>

                        <EditItemTemplate>

                            <asp:LinkButton
                                ID="btnCapNhat"
                                runat="server"
                                CommandName="Update"
                                CssClass="btn-action btn-save">

                                💾 Lưu

                            </asp:LinkButton>

                            <asp:LinkButton
                                ID="btnHuy"
                                runat="server"
                                CommandName="Cancel"
                                CssClass="btn-action btn-cancel">

                                ❌ Hủy

                            </asp:LinkButton>

                        </EditItemTemplate>

                    </asp:TemplateField>

                    <asp:BoundField
                        DataField="MaDM"
                        HeaderText="Mã DM"
                        ReadOnly="True" />

                    <asp:BoundField
                        DataField="TenDM"
                        HeaderText="Tên danh mục" />

                </Columns>

            </asp:GridView>

        </div>

    </div>

</div>


</div>

<style>

.page-header{
    margin-bottom:30px;
}

.page-header h1{
    font-size:56px;
    font-weight:800;
    color:#212529;
}

.page-header p{
    color:#6c757d;
    font-size:20px;
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

.form-control{
    height:55px;
    border-radius:12px;
    font-size:18px;
}

.btn{
    border-radius:12px;
    font-weight:600;
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
}

.table td{
    vertical-align:middle;
    padding:18px;
    font-size:18px;
}

.table-hover tbody tr:hover{
    background:#f5f9ff;
}

.btn-action{
    display:inline-block;
    padding:8px 14px;
    border-radius:10px;
    text-decoration:none;
    font-weight:600;
    margin-right:5px;
    color:white !important;
}

.btn-edit{
    background:#0d6efd;
}

.btn-delete{
    background:#dc3545;
}

.btn-save{
    background:#198754;
}

.btn-cancel{
    background:#6c757d;
}

</style>

</asp:Content>
