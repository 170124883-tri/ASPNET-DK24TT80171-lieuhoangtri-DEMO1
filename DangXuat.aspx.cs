using System;

namespace ASPNET_da21tta_HoangTri_AppleStore
{
    public partial class DangXuat : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();

            Response.Redirect("DangNhap.aspx");
        }
    }
}