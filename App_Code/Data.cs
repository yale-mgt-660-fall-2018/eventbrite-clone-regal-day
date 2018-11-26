using Microsoft.ApplicationBlocks.Data;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;

namespace eventbrite_regal_day.App_Code
{
    public sealed class DataProvider
    {
        #region Shared/Static Methods
        private static volatile DataProvider instance;
        private static object syncRoot = new Object();
        private static string _connectionString;
        private static string _affiliateConnectionString;

        private DataProvider(string ConnStr)
        {
            _connectionString = ConnStr;
        }



        public static DataProvider Instance
        {
            get
            {
                if (instance == null)
                {
                    lock (syncRoot)
                    {
                        //if (instance == null)
                        instance = new DataProvider(ConfigurationManager.ConnectionStrings["SiteSqlServer"].ToString());
                    }
                }
                return instance;
            }
        }
        public string ConnectionString
        {
            get
            {
                return _connectionString;
            }
        }
        #endregion
        #region Methods
        public SqlDataReader Event_Get(SqlGuid UserID, int EventID)
        {
            return SqlHelper.ExecuteReader(ConnectionString, "Event_Get", UserID, EventID);
        }
        public void Event_Add(SqlGuid UserID, int EventID, string EventName, DateTime EventDate, string Location, string OrganizerEmail, string Description, byte[] EventImage)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, "Event_Add", UserID, EventID, EventName, EventDate, Location, OrganizerEmail, Description, EventImage);
        }
        public SqlDataReader Events_Get(SqlGuid UserID)
        {
            return SqlHelper.ExecuteReader(ConnectionString, "Events_Get", UserID);
        }
        #endregion
    }
}