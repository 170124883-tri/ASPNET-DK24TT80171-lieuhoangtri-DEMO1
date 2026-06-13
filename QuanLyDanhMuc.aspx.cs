using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using ASPNET_da21tta_HoangTri_AppleStore.DAL;

namespace ASPNET_da21tta_HoangTri_AppleStore
{
    public partial class QuanLyDanhMuc : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("DangNhap.aspx");
            }
            if (!IsPostBack)
            {
                LoadDanhMuc();
            }
        }

        private void LoadDanhMuc()
        {
            SqlConnection conn = KetNoi.GetConnection();

            SqlDataAdapter da =
                new SqlDataAdapter(
                    "SELECT * FROM DanhMuc", conn);

            DataTable dt = new DataTable();

            da.Fill(dt);

            gvDanhMuc.DataSource = dt;
            gvDanhMuc.DataBind();
        }

        protected void btnThem_Click(
            object sender,
            EventArgs e)
        {
            SqlConnection conn =
                KetNoi.GetConnection();

            string sql =
                "INSERT INTO DanhMuc(TenDM) VALUES(@TenDM)";

            SqlCommand cmd =
                new SqlCommand(sql, conn);

            cmd.Parameters.AddWithValue(
                "@TenDM",
                txtTenDM.Text);

            conn.Open();

            cmd.ExecuteNonQuery();

            conn.Close();

            LoadDanhMuc();
        }

        protected void gvDanhMuc_RowDeleting(
object sender,
GridViewDeleteEventArgs e)
        {
            try
            {
                int maDM =
                Convert.ToInt32(
                gvDanhMuc.DataKeys[e.RowIndex].Value);


    SqlConnection conn =
        KetNoi.GetConnection();

                SqlCommand cmd =
                    new SqlCommand(
                    "DELETE FROM DanhMuc WHERE MaDM=@MaDM",
                    conn);

                cmd.Parameters.AddWithValue(
                    "@MaDM",
                    maDM);

                conn.Open();

                cmd.ExecuteNonQuery();

                conn.Close();

                LoadDanhMuc();

                ClientScript.RegisterStartupScript(
                    this.GetType(),
                    "msg",
                    "alert('Xóa danh mục thành công!');",
                    true);
            }
            catch
            {
                ClientScript.RegisterStartupScript(
                    this.GetType(),
                    "msg",
                    "alert('Không thể xóa vì danh mục đang chứa sản phẩm!');",
                    true);
            }


}

        

        protected void gvDanhMuc_RowEditing(
            object sender,
            GridViewEditEventArgs e)
        {
            gvDanhMuc.EditIndex =
                e.NewEditIndex;

            LoadDanhMuc();
        }

        protected void gvDanhMuc_RowCancelingEdit(
            object sender,
            GridViewCancelEditEventArgs e)
        {
            gvDanhMuc.EditIndex = -1;

            LoadDanhMuc();
        }

        protected void gvDanhMuc_RowUpdating(
            object sender,
            GridViewUpdateEventArgs e)
        {
            int maDM =
                Convert.ToInt32(
                    gvDanhMuc.DataKeys[e.RowIndex].Value);

            GridViewRow row =
                gvDanhMuc.Rows[e.RowIndex];

            string tenDM =
                ((TextBox)row.Cells[2]
                .Controls[0]).Text;

            SqlConnection conn =
                KetNoi.GetConnection();

            string sql =
                "UPDATE DanhMuc SET TenDM=@TenDM WHERE MaDM=@MaDM";

            SqlCommand cmd =
                new SqlCommand(sql, conn);

            cmd.Parameters.AddWithValue(
                "@TenDM",
                tenDM);

            cmd.Parameters.AddWithValue(
                "@MaDM",
                maDM);

            conn.Open();

            cmd.ExecuteNonQuery();

            conn.Close();

            gvDanhMuc.EditIndex = -1;

            LoadDanhMuc();
        }
    }
}