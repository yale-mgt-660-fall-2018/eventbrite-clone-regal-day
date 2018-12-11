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
        public SqlDataReader Event2_Get(SqlGuid UserID, string EventID)
        {
            int _EventID = Convert.ToInt32(EventID);

            return DataProvider.Instance.Event2_Get(UserID, _EventID);
        }
        public void Event_Add(SqlGuid UserID, int EventID, string EventName, string EventDate, string Location, string OrganizerEmail, string Description, byte[] EventImage)
        {
            DateTime _EventDate = Convert.ToDateTime(EventDate);
            
            DataProvider.Instance.Event_Add(UserID, EventID, EventName, _EventDate, Location, OrganizerEmail, Description, EventImage);
        }
        public void Donate_Add(DateTime DateDonated, string AmountDonated, string IPAddress, string DonationType)
        {
            double _AmountDonated = Convert.ToDouble(AmountDonated == "" ? "0" : AmountDonated);

            DataProvider.Instance.Donate_Add(DateDonated, _AmountDonated, IPAddress, DonationType);
        }
        public void Event_Update(SqlGuid UserID, int EventID, string EventName, string EventDate, string Location, string OrganizerEmail, string Description)
        {
            DateTime _EventDate = Convert.ToDateTime(EventDate);

            DataProvider.Instance.Event_Update(UserID, EventID, EventName, _EventDate, Location, OrganizerEmail, Description);
        }
        public SqlDataReader Events_Get(SqlGuid UserID)
        {
            return DataProvider.Instance.Events_Get(UserID);
        }
        public void PartyGoers_Add(SqlGuid UserID, int PID, int EventID, string Name, string Email)
        {
            DataProvider.Instance.PartyGoers_Add(UserID, PID, EventID, Name, Email);
        }
        public void PartyGoers_Delete(SqlGuid UserID, int PID)
        {
            DataProvider.Instance.PartyGoers_Delete(UserID, PID);
        }
        public SqlDataReader PartyGoers_Get(SqlGuid UserID, int EventID)
        {
            return DataProvider.Instance.PartyGoers_Get(UserID, EventID);
        }
    }
}