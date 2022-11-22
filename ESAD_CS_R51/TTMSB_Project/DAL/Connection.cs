using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TTMSB_Project.DAL
{
    public static class Connection
    {
        public static string getConnection()
        {
            string str = "Data Source=DESKTOP-OPJ4F13; Initial Catalog=eviTTMSB; Integrated Security=TRUE;";
            return str;
        }
    }
}