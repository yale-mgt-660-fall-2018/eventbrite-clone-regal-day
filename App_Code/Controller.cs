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
        public SqlDataReader Note_Get(bool SenderType, SqlGuid UserID)
        {
            return DataProvider.Instance.Note_Get(SenderType, UserID);
        }
    }
}