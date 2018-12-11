using eventbrite_regal_day.App_Code;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eventbrite_regal_day
{
    public partial class _Default : Page
    {
        private SqlGuid UserID;
        private Controller objController;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
                Session["UserID"] = "5ccbbe14-5b61-465f-bda5-e7afcbb291d0";

            objController = new Controller();
            UserID = SqlGuid.Parse(Session["UserID"].ToString());

            if (!IsPostBack)
            {
                rptEvents.DataSource = objController.Events_Get(UserID);
                rptEvents.DataBind();
            }
        }

        protected void rptEvents_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            Label lblEventID = ((Label)e.Item.FindControl("lblEventID"));
            ((Image)e.Item.FindControl("imgEventImage")).ImageUrl = "UserControls/imagehandler.aspx?EventID=" + lblEventID.Text;
            ((LinkButton)e.Item.FindControl("lnkRSVP")).PostBackUrl = "/events/?EventID=" + lblEventID.Text;
            ((LinkButton)e.Item.FindControl("lnkEdit")).PostBackUrl = "/createevent/?EventID=" + lblEventID.Text;
        }
    }
}