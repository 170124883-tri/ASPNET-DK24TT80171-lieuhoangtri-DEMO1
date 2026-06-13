using System;
using System.Data.SqlClient;
using ASPNET_da21tta_HoangTri_AppleStore.DAL;

namespace ASPNET_da21tta_HoangTri_AppleStore
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadThongKe();
            }
        }


    private void LoadThongKe()
        {
            SqlConnection conn = KetNoi.GetConnection();

            conn.Open();

            lblTongSP.Text =
                new SqlCommand(
                    "SELECT COUNT(*) FROM SanPham",
                    conn)
                .ExecuteScalar().ToString();

            lblTongDM.Text =
                new SqlCommand(
                    "SELECT COUNT(*) FROM DanhMuc",
                    conn)
                .ExecuteScalar().ToString();

            lblTongKH.Text =
                new SqlCommand(
                    "SELECT COUNT(*) FROM KhachHang",
                    conn)
                .ExecuteScalar().ToString();

            conn.Close();
        }
    }


}
