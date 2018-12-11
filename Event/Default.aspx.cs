using eventbrite_regal_day.App_Code;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eventbrite_regal_day.Event
{
    public partial class Default : System.Web.UI.Page
    {
        private SqlGuid UserID;
        private Controller objController;

        protected void Page_Load(object sender, EventArgs e)
        {
            ((Literal)Master.FindControl("litH1")).Text = "RSVP to the Event";

            if (Session["UserID"] == null)
                Session["UserID"] = "5ccbbe14-5b61-465f-bda5-e7afcbb291d0";

            objController = new Controller();
            UserID = SqlGuid.Parse(Session["UserID"].ToString());

            if (!IsPostBack)
            {
                var random = new Random();
                var test = random.Next(0, 2);

                if (test == 0)
                    Donate.Text = "Donate";
                else
                    Donate.Text = "Support";

                string EventID = "1";
                if (Request.QueryString["EventID"] != null)
                    EventID = Request.QueryString["EventID"];

                ViewState["EventID"] = EventID;
                using (SqlDataReader objReader = objController.Event2_Get(UserID, EventID))
                {
                    if (objReader.Read())
                    {
                        litEventName.Text = objReader["EventName"].ToString();
                        litEventDate.Text = Convert.ToDateTime(objReader["EventDate"]).ToString("MM/dd/yyyy");
                        litLocation.Text = objReader["Location"].ToString();
                        litOrganizerEmail.Text = objReader["OrganizerEmail"].ToString();
                        litDescription.Text = objReader["Description"].ToString();
                        imgEventImage.ImageUrl = "../UserControls/imagehandler.aspx?EventID=" + objReader["EventID"].ToString();
                    }
                    objReader.Close();
                }

                rptPartyGoers.DataSource = objController.PartyGoers_Get(UserID, Convert.ToInt32(ViewState["EventID"]));
                rptPartyGoers.DataBind();
            }
        }

        protected void lnkSubmit_Click(object sender, EventArgs e)
        {
            objController.PartyGoers_Add(UserID, 0, Convert.ToInt32(ViewState["EventID"]), txtName.Text, txtEmail.Text);
            rptPartyGoers.DataSource = objController.PartyGoers_Get(UserID, Convert.ToInt32(ViewState["EventID"]));
            rptPartyGoers.DataBind();
        }

        protected void rptPartyGoers_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "Delete":
                    objController.PartyGoers_Delete(UserID, Convert.ToInt32(((Literal)e.Item.FindControl("litrptPID")).Text));
                    rptPartyGoers.DataSource = objController.PartyGoers_Get(UserID, Convert.ToInt32(ViewState["EventID"]));
                    rptPartyGoers.DataBind();
                    break;
            }
        }

        protected void lnkGoBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("/");
        }

        protected void lnkDonate_Click(object sender, EventArgs e)
        {
            objController.Donate_Add(DateTime.Now, txtAmount.Text, Request.UserHostAddress, Donate.Text.Substring(0, 1));

            var random = new Random();
            var test = random.Next(0, 2);

            if (test == 0)
                Donate.Text = "Donate";
            else
                Donate.Text = "Support";
        }
    }
}