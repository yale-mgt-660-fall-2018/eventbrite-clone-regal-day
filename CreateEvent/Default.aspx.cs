using eventbrite_regal_day.App_Code;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eventbrite_regal_day.CreateEvent
{
    public partial class Default : System.Web.UI.Page
    {
        private SqlGuid UserID;
        private Controller objController;

        protected void Page_Load(object sender, EventArgs e)
        {
            //using (SqlDataReader objReader = objController.Events_Get(UserID))
            //{
            //    if (objReader.Read())
            //    {

            //    }
            //}
        }

        protected void lnkSubmit_Click(object sender, EventArgs e)
        {

        }

        protected void btnUploadFile_Click(object sender, EventArgs e)
        {

        }

        protected void btnCancelUpload_Click(object sender, EventArgs e)
        {

        }
    }
}