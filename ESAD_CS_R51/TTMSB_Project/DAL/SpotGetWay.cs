using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using TTMSB_Project.Models;

namespace TTMSB_Project.DAL
{
    public class SpotGetWay
    {
        SqlConnection con = new SqlConnection(Connection.getConnection());
        public IQueryable<Spot> Get()
        {
            con.Open();
            DataTable dt = new DataTable();
            SqlDataAdapter sda = new SqlDataAdapter("SELECT * FROM spot", con);
            sda.Fill(dt);
            con.Close();
            return dt.AsEnumerable()
                .Select(r => new Spot
                {
                    SpotId = r.Field<int>("spotId"),
                    SpotName = r.Field<string>("spotName")
                })
                .AsQueryable();


        }
        public void Insert(Spot s)
        {
            SqlCommand cmd = new SqlCommand("INSERT INTO spot VALUES(@n)", con);
            cmd.Parameters.AddWithValue("@n", s.SpotName);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
        public void Update(Spot s)
        {
            SqlCommand cmd = new SqlCommand("UPDATE spot SET spotName=@n WHERE spotId=@i", con);
            cmd.Parameters.AddWithValue("@n", s.SpotName);
            cmd.Parameters.AddWithValue("@i", s.SpotId);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
        public void Delete(Spot s)
        {
            SqlCommand cmd = new SqlCommand(@"DELETE FROM spot WHERE spotId=@i", con);
            cmd.Parameters.AddWithValue("@i", s.SpotId);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }
}