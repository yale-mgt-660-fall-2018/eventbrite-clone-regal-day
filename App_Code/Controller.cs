using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;

namespace eventbrite_regal_day.App_Code
{
    public class Controller
    {
        public SqlDataReader Events_Get(SqlGuid UserID)
        {
            return DataProvider.Instance.Events_Get(UserID);
        }
    }
}