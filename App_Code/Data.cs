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
        public SqlDataReader Event2_Get(SqlGuid UserID, int EventID)
        {
            return SqlHelper.ExecuteReader(ConnectionString, "Event2_Get", UserID, EventID);
        }
        public void Event_Add(SqlGuid UserID, int EventID, string EventName, DateTime EventDate, string Location, string OrganizerEmail, string Description, byte[] EventImage)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, "Event_Add", UserID, EventID, EventName, EventDate, Location, OrganizerEmail, Description, EventImage);
        }
        public void Donate_Add(DateTime DateDonated, double AmountDonated, string IPAddress, string DonationType)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, "Donations_Add", DateDonated, AmountDonated, IPAddress, DonationType);
        }
        public void Event_Update(SqlGuid UserID, int EventID, string EventName, DateTime EventDate, string Location, string OrganizerEmail, string Description)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, "Event_Update", UserID, EventID, EventName, EventDate, Location, OrganizerEmail, Description);
        }
        
        public SqlDataReader Events_Get(SqlGuid UserID)
        {
            return SqlHelper.ExecuteReader(ConnectionString, "Events_Get", UserID);
        }
        public void PartyGoers_Add(SqlGuid UserID, int PID, int EventID, string Name, string Email)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, "PartyGoers_Add", UserID, PID, EventID, Name, Email);
        }
        public void PartyGoers_Delete(SqlGuid UserID, int PID)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, "PartyGoers_Delete", UserID, PID);
        }
        public SqlDataReader PartyGoers_Get(SqlGuid UserID, int EventID)
        {
            return SqlHelper.ExecuteReader(ConnectionString, "PartyGoers_Get", UserID, EventID);
        }
        #endregion
    }
}