using eventbrite_regal_day.App_Code;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eventbrite_regal_day.UserControls
{
    public partial class imagehandler : System.Web.UI.Page
    {
        private SqlGuid UserID;
        private Controller objController;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
                Session["UserID"] = "5ccbbe14-5b61-465f-bda5-e7afcbb291d0";

            objController = new Controller();
            UserID = SqlGuid.Parse(Session["UserID"].ToString());

            if (Request.QueryString["EventID"] != null)
            {
                ViewState["EventID"] = Request.QueryString["EventID"];
                using (SqlDataReader objReader = objController.Event_Get(UserID, Request.QueryString["EventID"]))
                {
                    if (objReader.Read())
                    {
                        Response.ContentType = "image/jpg";
                        Response.BinaryWrite((byte[])objReader["EventImage"]);
                    }
                    objReader.Close();
                }
            }
        }
    }
}