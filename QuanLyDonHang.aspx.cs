using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using ASPNET_da21tta_HoangTri_AppleStore.DAL;

namespace ASPNET_da21tta_HoangTri_AppleStore
{
    public partial class QuanLyDonHang : System.Web.UI.Page
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
                LoadDonHang();
            }
        }

        private void LoadDonHang()
        {
            SqlConnection conn = KetNoi.GetConnection();

            string sql = @"
            SELECT
                MaDH,
                MaKH,
                NgayDat,
                TongTien
            FROM DonHang
            ORDER BY MaDH DESC";

            SqlDataAdapter da =
                new SqlDataAdapter(sql, conn);

            DataTable dt = new DataTable();

            da.Fill(dt);

            gvDonHang.DataSource = dt;
            gvDonHang.DataBind();
        }

        protected void gvDonHang_RowDeleting(
            object sender,
            GridViewDeleteEventArgs e)
        {
            try
            {
                int maDH =
                    Convert.ToInt32(
                        gvDonHang.DataKeys[e.RowIndex].Value);

                SqlConnection conn =
                    KetNoi.GetConnection();

                SqlCommand cmd =
                    new SqlCommand(
                        "DELETE FROM DonHang WHERE MaDH=@MaDH",
                        conn);

                cmd.Parameters.AddWithValue(
                    "@MaDH",
                    maDH);

                conn.Open();

                cmd.ExecuteNonQuery();

                conn.Close();

                LoadDonHang();

                ClientScript.RegisterStartupScript(
                    this.GetType(),
                    "msg",
                    "alert('Xóa đơn hàng thành công!');",
                    true);
            }
            catch
            {
                ClientScript.RegisterStartupScript(
                    this.GetType(),
                    "msg",
                    "alert('Không thể xóa đơn hàng này!');",
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
