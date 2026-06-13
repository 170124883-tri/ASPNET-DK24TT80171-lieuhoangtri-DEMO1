using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using ASPNET_da21tta_HoangTri_AppleStore.DAL;

namespace ASPNET_da21tta_HoangTri_AppleStore
{
    public partial class QuanLyKhachHang : System.Web.UI.Page
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
                LoadKhachHang();
            }
        }

        private void LoadKhachHang()
        {
            SqlConnection conn = KetNoi.GetConnection();

            string sql = @"
            SELECT
                MaKH,
                HoTen,
                Email,
                DiaChi,
                SoDienThoai
            FROM KhachHang
            ORDER BY MaKH";

            SqlDataAdapter da =
                new SqlDataAdapter(sql, conn);

            DataTable dt = new DataTable();

            da.Fill(dt);

            gvKhachHang.DataSource = dt;
            gvKhachHang.DataBind();
        }

        protected void gvKhachHang_RowDeleting(
            object sender,
            GridViewDeleteEventArgs e)
        {
            try
            {
                int maKH =
                    Convert.ToInt32(
                        gvKhachHang.DataKeys[e.RowIndex].Value);

                SqlConnection conn =
                    KetNoi.GetConnection();

                string sql =
                    "DELETE FROM KhachHang WHERE MaKH=@MaKH";

                SqlCommand cmd =
                    new SqlCommand(sql, conn);

                cmd.Parameters.AddWithValue("@MaKH", maKH);

                conn.Open();

                cmd.ExecuteNonQuery();

                conn.Close();

                LoadKhachHang();

                ClientScript.RegisterStartupScript(
                    this.GetType(),
                    "msg",
                    "alert('Xóa khách hàng thành công!');",
                    true);
            }
            catch
            {
                ClientScript.RegisterStartupScript(
                    this.GetType(),
                    "msg",
                    "alert('Không thể xóa khách hàng vì đã có đơn hàng liên quan!');",
                    true);
            }
        }

        protected void btnBack_Click(
            object sender,
            EventArgs e)
        {
            Response.Redirect("Admin.aspx");
        }
    }


}
