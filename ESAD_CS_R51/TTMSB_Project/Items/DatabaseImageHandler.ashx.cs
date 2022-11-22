using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;

namespace TTMSB_Project.Items
{
    /// <summary>
    /// Summary description for DatabaseImageHandler
    /// </summary>
    public class DatabaseImageHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            //context.Response.ContentType = "text/plain";
            //context.Response.Write("Hello World");
            string id = context.Request.QueryString["id"];
            SqlConnection con = new SqlConnection("Data Source=DESKTOP-OPJ4F13;Initial Catalog=eviTTMSB;Integrated Security=True");
            string sql = "SELECT picture FROM client WHERE clientId="+id;
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            dr.Read();
            byte[] imgData = (byte[])dr["picture"];
            con.Close();
            context.Response.BinaryWrite(imgData);
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}