using System;
using System.Data.SqlClient;
using System.Web.UI;
using ASPNET_da21tta_HoangTri_AppleStore.DAL;

namespace ASPNET_da21tta_HoangTri_AppleStore
{
    public partial class DangNhap : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] != null)
            {
                Response.Redirect("Admin.aspx");
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            SqlConnection conn = KetNoi.GetConnection();

            string sql = @"SELECT * FROM TaiKhoan
                           WHERE TenDangNhap=@user
                           AND MatKhau=@pass";

            SqlCommand cmd = new SqlCommand(sql, conn);

            cmd.Parameters.AddWithValue("@user", txtUser.Text);
            cmd.Parameters.AddWithValue("@pass", txtPass.Text);

            conn.Open();

            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                Session["User"] = dr["TenDangNhap"].ToString();
                Session["Role"] = dr["Quyen"].ToString();

                Response.Redirect("Admin.aspx");
            }
            else
            {
                lblTB.Text = "Sai tên đăng nhập hoặc mật khẩu!";
            }

            conn.Close();
        }
    }
}