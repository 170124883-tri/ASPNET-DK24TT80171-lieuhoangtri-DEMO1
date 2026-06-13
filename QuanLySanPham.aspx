<%@ Page Title="Quản lý sản phẩm"
Language="C#"
MasterPageFile="~/Site.Master"
AutoEventWireup="true"
CodeBehind="QuanLySanPham.aspx.cs"
Inherits="ASPNET_da21tta_HoangTri_AppleStore.QuanLySanPham" %>
<asp:Content ID="Content1"
ContentPlaceHolderID="MainContent"
runat="server">
<div class="page-header mb-4">

    <h1 class="display-5 fw-bold">
        📦 QUẢN LÝ SẢN PHẨM
    </h1>

    <p class="text-muted">
        Quản lý sản phẩm Apple Store
    </p>

</div>

<!-- THÊM SẢN PHẨM -->

<div class="card shadow-lg border-0 mb-4">

    <div class="card-header bg-primary text-white">
        ➕ Thêm sản phẩm mới
    </div>

    <div class="card-body">

        <div class="row">

            <div class="col-md-4 mb-3">
                <label>Tên sản phẩm</label>

                <asp:TextBox
                    ID="txtTenSP"
                    runat="server"
                    CssClass="form-control">
                </asp:TextBox>
            </div>

            <div class="col-md-4 mb-3">
                <label>Giá bán</label>

                <asp:TextBox
                    ID="txtGia"
                    runat="server"
                    CssClass="form-control">
                </asp:TextBox>
            </div>

            <div class="col-md-4 mb-3">
                <label>Số lượng</label>

                <asp:TextBox
                    ID="txtSoLuong"
                    runat="server"
                    CssClass="form-control">
                </asp:TextBox>
            </div>

            <div class="col-md-6 mb-3">

                <label>Hình ảnh</label>

                <asp:TextBox
                    ID="txtHinhAnh"
                    runat="server"
                    CssClass="form-control">
                </asp:TextBox>

            </div>

            <div class="col-md-6 mb-3">

                <label>Danh mục</label>

                <asp:DropDownList
                    ID="ddlDanhMuc"
                    runat="server"
                    CssClass="form-select">
                </asp:DropDownList>

            </div>

            <div class="col-md-12 mb-3">

                <label>Mô tả</label>

                <asp:TextBox
                    ID="txtMoTa"
                    runat="server"
                    CssClass="form-control"
                    TextMode="MultiLine"
                    Rows="4">
                </asp:TextBox>

            </div>

        </div>

        <asp:Button
            ID="btnThem"
            runat="server"
            Text="➕ Thêm sản phẩm"
            CssClass="btn btn-primary btn-lg"
            OnClick="btnThem_Click" />

    </div>

</div>

<!-- TÌM KIẾM -->

<div class="card shadow border-0 mb-4">

    <div class="card-header bg-dark text-white">
        🔍 Tìm kiếm sản phẩm
    </div>

    <div class="card-body">

        <div class="row">

            <div class="col-md-10">

                <asp:TextBox
                    ID="txtTimKiem"
                    runat="server"
                    CssClass="form-control">
                </asp:TextBox>

            </div>

            <div class="col-md-2">

                <asp:Button
                    ID="btnTimKiem"
                    runat="server"
                    Text="Tìm kiếm"
                    CssClass="btn btn-success w-100"
                    OnClick="btnTimKiem_Click" />

            </div>

        </div>

    </div>

</div>

<!-- DANH SÁCH -->

<div class="card shadow-lg border-0">

    <div class="card-header bg-secondary text-white">
        📋 Danh sách sản phẩm
    </div>

    <div class="card-body">

        <div class="table-responsive">

            <asp:GridView
                ID="gvSanPham"
                runat="server"
                CssClass="table table-hover align-middle"
                AutoGenerateColumns="False"
                DataKeyNames="MaSP"
                OnRowEditing="gvSanPham_RowEditing"
                OnRowCancelingEdit="gvSanPham_RowCancelingEdit"
                OnRowUpdating="gvSanPham_RowUpdating"
                OnRowDeleting="gvSanPham_RowDeleting">

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
        OnClientClick="return confirm('Bạn có chắc muốn xóa sản phẩm này?');">

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
DataField="MaSP"
HeaderText="Mã SP"
ReadOnly="True" />
<asp:BoundField
DataField="TenSP"
HeaderText="Tên sản phẩm" />
<asp:TemplateField HeaderText="Giá bán">

    <ItemTemplate>
        <%# String.Format(
            new System.Globalization.CultureInfo("vi-VN"),
            "{0:c0}",
            Eval("Gia")) %>
    </ItemTemplate>

</asp:TemplateField>

    
<asp:BoundField
DataField="SoLuong"
HeaderText="Số lượng" />
<asp:TemplateField HeaderText="Hình ảnh">
<ItemTemplate>

    <asp:Image
        ID="imgSP"
        runat="server"
        Width="90"
        Height="90"
        CssClass="product-image"
        ImageUrl='<%# ResolveUrl("~/Images/" + Eval("HinhAnh")) %>' />

</ItemTemplate>
</asp:TemplateField>
<asp:BoundField
    DataField="MoTa"
    HeaderText="Mô tả" />

<asp:BoundField
    DataField="TenDM"
    HeaderText="Danh mục" />

</Columns>

</asp:GridView>

</div>

</div>

</div>



<style>

/* css */

</style>

</asp:Content>

