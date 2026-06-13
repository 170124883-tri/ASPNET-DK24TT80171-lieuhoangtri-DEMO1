using System.Configuration;
using System.Data.SqlClient;

namespace ASPNET_da21tta_HoangTri_AppleStore.DAL
{
    public class KetNoi
    {
        public static SqlConnection GetConnection()
        {
            string connStr =
                ConfigurationManager.ConnectionStrings["AppleStoreDB"].ConnectionString;

            return new SqlConnection(connStr);
        }
    }
}