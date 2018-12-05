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
        public SqlDataReader Event_Get(SqlGuid UserID, string EventID)
        {
            int _EventID = Convert.ToInt32(EventID);

            return DataProvider.Instance.Event_Get(UserID, _EventID);
        }
        public void Event_Add(SqlGuid UserID, int EventID, string EventName, string EventDate, string Location, string OrganizerEmail, string Description, byte[] EventImage)
        {
            DateTime _EventDate = Convert.ToDateTime(EventDate);
            
            DataProvider.Instance.Event_Add(UserID, EventID, EventName, _EventDate, Location, OrganizerEmail, Description, EventImage);
        }
        public SqlDataReader Events_Get(SqlGuid UserID)
        {
            return DataProvider.Instance.Events_Get(UserID);
        }
        public void PartyGoers_Add(SqlGuid UserID, int PID, int EventID, string Name, string Email)
        {
            DataProvider.Instance.PartyGoers_Add(UserID, PID, EventID, Name, Email);
        }
    }
}