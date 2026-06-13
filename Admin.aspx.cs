using System;
using System.Data.SqlClient;
using ASPNET_da21tta_HoangTri_AppleStore.DAL;

namespace ASPNET_da21tta_HoangTri_AppleStore
{
    public partial class Admin : System.Web.UI.Page
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
                lblUser.Text = Session["User"].ToString();

                LoadThongKe();
            }
        }

        private void LoadThongKe()
        {
            SqlConnection conn = KetNoi.GetConnection();

            conn.Open();

            lblSP.Text =
                new SqlCommand(
                    "SELECT COUNT(*) FROM SanPham",
                    conn)
                .ExecuteScalar().ToString();

            lblKH.Text =
                new SqlCommand(
                    "SELECT COUNT(*) FROM KhachHang",
                    conn)
                .ExecuteScalar().ToString();

            lblDH.Text =
                new SqlCommand(
                    "SELECT COUNT(*) FROM DonHang",
                    conn)
                .ExecuteScalar().ToString();

            lblDM.Text =
                new SqlCommand(
                    "SELECT COUNT(*) FROM DanhMuc",
                    conn)
                .ExecuteScalar().ToString();

            object dt =
                new SqlCommand(
                    "SELECT ISNULL(SUM(TongTien),0) FROM DonHang",
                    conn)
                .ExecuteScalar();

            decimal doanhThu =
                Convert.ToDecimal(dt);

            lblDoanhThu.Text =
                String.Format("{0:N0}", doanhThu);

          

            conn.Close();
        }

        protected void btnSP_Click(object sender, EventArgs e)
        {
            Response.Redirect("QuanLySanPham.aspx");
        }

        protected void btnDM_Click(object sender, EventArgs e)
        {
            Response.Redirect("QuanLyDanhMuc.aspx");
        }

        protected void btnKH_Click(object sender, EventArgs e)
        {
            Response.Redirect("QuanLyKhachHang.aspx");
        }

        protected void btnDH_Click(object sender, EventArgs e)
        {
            Response.Redirect("QuanLyDonHang.aspx");
        }
    }
}