using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using ASPNET_da21tta_HoangTri_AppleStore.DAL;

namespace ASPNET_da21tta_HoangTri_AppleStore
{
    public partial class QuanLySanPham : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("DangNhap.aspx");
            }


        if (Session["Role"] == null ||
            Session["Role"].ToString() != "Admin")
            {
                Response.Redirect("Default.aspx");
            }

            if (!IsPostBack)
            {
                LoadDanhMuc();
                LoadSanPham();
            }
        }

        private void LoadDanhMuc()
        {
            SqlConnection conn = KetNoi.GetConnection();

            string sql = "SELECT * FROM DanhMuc";

            SqlDataAdapter da =
                new SqlDataAdapter(sql, conn);

            DataTable dt = new DataTable();

            da.Fill(dt);

            ddlDanhMuc.DataSource = dt;
            ddlDanhMuc.DataTextField = "TenDM";
            ddlDanhMuc.DataValueField = "MaDM";
            ddlDanhMuc.DataBind();
        }

        private void LoadSanPham()
        {
            SqlConnection conn = KetNoi.GetConnection();

            string sql = @"
            SELECT
                sp.MaSP,
                sp.TenSP,
                sp.Gia,
                sp.SoLuong,
                sp.HinhAnh,
                sp.MoTa,
                dm.TenDM
            FROM SanPham sp
            INNER JOIN DanhMuc dm
                ON sp.MaDM = dm.MaDM";

            SqlDataAdapter da =
                new SqlDataAdapter(sql, conn);

            DataTable dt = new DataTable();

            da.Fill(dt);

            gvSanPham.DataSource = dt;
            gvSanPham.DataBind();
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = KetNoi.GetConnection();

                string sql = @"
                INSERT INTO SanPham
                (
                    TenSP,
                    Gia,
                    SoLuong,
                    HinhAnh,
                    MoTa,
                    MaDM
                )
                VALUES
                (
                    @TenSP,
                    @Gia,
                    @SoLuong,
                    @HinhAnh,
                    @MoTa,
                    @MaDM
                )";

                SqlCommand cmd =
                    new SqlCommand(sql, conn);

                cmd.Parameters.AddWithValue("@TenSP", txtTenSP.Text);
                cmd.Parameters.AddWithValue("@Gia", decimal.Parse(txtGia.Text));
                cmd.Parameters.AddWithValue("@SoLuong", int.Parse(txtSoLuong.Text));
                cmd.Parameters.AddWithValue("@HinhAnh", txtHinhAnh.Text);
                cmd.Parameters.AddWithValue("@MoTa", txtMoTa.Text);
                cmd.Parameters.AddWithValue("@MaDM", ddlDanhMuc.SelectedValue);

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();

                txtTenSP.Text = "";
                txtGia.Text = "";
                txtSoLuong.Text = "";
                txtHinhAnh.Text = "";
                txtMoTa.Text = "";

                LoadSanPham();

                ClientScript.RegisterStartupScript(
                    this.GetType(),
                    "msg",
                    "alert('Thêm sản phẩm thành công!');",
                    true);
            }
            catch
            {
                ClientScript.RegisterStartupScript(
                    this.GetType(),
                    "msg",
                    "alert('Dữ liệu không hợp lệ!');",
                    true);
            }
        }

        protected void gvSanPham_RowEditing(
            object sender,
            GridViewEditEventArgs e)
        {
            gvSanPham.EditIndex = e.NewEditIndex;

            LoadSanPham();
        }

        protected void gvSanPham_RowCancelingEdit(
            object sender,
            GridViewCancelEditEventArgs e)
        {
            gvSanPham.EditIndex = -1;

            LoadSanPham();
        }

        protected void gvSanPham_RowUpdating(
            object sender,
            GridViewUpdateEventArgs e)
        {
            int maSP =
                Convert.ToInt32(
                    gvSanPham.DataKeys[e.RowIndex].Value);

            GridViewRow row =
                gvSanPham.Rows[e.RowIndex];

            string tenSP =
                ((TextBox)row.Cells[2].Controls[0]).Text;

            decimal gia =
                Convert.ToDecimal(
                    ((TextBox)row.Cells[3].Controls[0]).Text);

            int soLuong =
                Convert.ToInt32(
                    ((TextBox)row.Cells[4].Controls[0]).Text);

            SqlConnection conn =
                KetNoi.GetConnection();

            string sql = @"
            UPDATE SanPham
            SET
                TenSP=@TenSP,
                Gia=@Gia,
                SoLuong=@SoLuong
            WHERE MaSP=@MaSP";

            SqlCommand cmd =
                new SqlCommand(sql, conn);

            cmd.Parameters.AddWithValue("@TenSP", tenSP);
            cmd.Parameters.AddWithValue("@Gia", gia);
            cmd.Parameters.AddWithValue("@SoLuong", soLuong);
            cmd.Parameters.AddWithValue("@MaSP", maSP);

            conn.Open();

            cmd.ExecuteNonQuery();

            conn.Close();

            gvSanPham.EditIndex = -1;

            LoadSanPham();

            ClientScript.RegisterStartupScript(
                this.GetType(),
                "msg",
                "alert('Cập nhật thành công!');",
                true);
        }

        protected void gvSanPham_RowDeleting(
            object sender,
            GridViewDeleteEventArgs e)
        {
            int maSP =
                Convert.ToInt32(
                    gvSanPham.DataKeys[e.RowIndex].Value);

            SqlConnection conn =
                KetNoi.GetConnection();

            string sql =
                "DELETE FROM SanPham WHERE MaSP=@MaSP";

            SqlCommand cmd =
                new SqlCommand(sql, conn);

            cmd.Parameters.AddWithValue("@MaSP", maSP);

            conn.Open();

            cmd.ExecuteNonQuery();

            conn.Close();

            LoadSanPham();
        }

        protected void btnTimKiem_Click(
            object sender,
            EventArgs e)
        {
            SqlConnection conn =
                KetNoi.GetConnection();

            string sql = @"
            SELECT
                sp.MaSP,
                sp.TenSP,
                sp.Gia,
                sp.SoLuong,
                sp.HinhAnh,
                sp.MoTa,
                dm.TenDM
            FROM SanPham sp
            INNER JOIN DanhMuc dm
                ON sp.MaDM = dm.MaDM
            WHERE sp.TenSP LIKE @TenSP";

            SqlCommand cmd =
                new SqlCommand(sql, conn);

            cmd.Parameters.AddWithValue(
                "@TenSP",
                "%" + txtTimKiem.Text + "%");

            SqlDataAdapter da =
                new SqlDataAdapter(cmd);

            DataTable dt =
                new DataTable();

            da.Fill(dt);

            gvSanPham.DataSource = dt;
            gvSanPham.DataBind();
        }
    }


}
