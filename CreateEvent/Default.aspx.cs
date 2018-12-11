using eventbrite_regal_day.App_Code;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.IO;
using System.Linq;
using System.Net;
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
            if (Session["UserID"] == null)
                Session["UserID"] = "5ccbbe14-5b61-465f-bda5-e7afcbb291d0";

            objController = new Controller();
            UserID = SqlGuid.Parse(Session["UserID"].ToString());

            if (!IsPostBack)
            {
                int[] months = new int[] { 31, 28, 31, 30, 31, 30, 31, 30, 30, 31, 30, 31 };
                if (Convert.ToInt16(ddlYear.SelectedValue) % 4 == 0)
                    months[1] = 29;

                ddlDay.SelectedIndex = -1;
                ddlDay.Items.Clear();

                for (int i = 1; i <= months[Convert.ToInt16(ddlMonth.SelectedValue) - 1]; i++)
                {
                    ddlDay.Items.Add(i.ToString());
                }

                if (Request.QueryString["EventID"] != null)
                {
                    ((Literal)Master.FindControl("litH1")).Text = "Edit the Event";

                    ViewState["EventID"] = Request.QueryString["EventID"];
                    using (SqlDataReader objReader = objController.Event_Get(UserID, Request.QueryString["EventID"]))
                    {
                        if (objReader.Read())
                        {
                            txtEventName.Text = objReader["EventName"].ToString();
                            DateTime thedate = Convert.ToDateTime(objReader["EventDate"]);

                            ddlYear.SelectedValue = thedate.Year.ToString();
                            ddlMonth.SelectedValue = thedate.Month.ToString();
                            ddlDay.SelectedValue = thedate.Day.ToString();
                            ddlHour.SelectedValue = thedate.Hour.ToString();
                            ddlMinute.SelectedValue = (thedate.Minute == 0 ? "00" : "30");

                            txtLocation.Text = objReader["Location"].ToString();
                            txtOrganizerEmail.Text = objReader["OrganizerEmail"].ToString();
                            txtDescription.Text = objReader["Description"].ToString();
                            imgEventImage.ImageUrl = "../UserControls/imagehandler.aspx?EventID=" + objReader["EventID"].ToString();
                        }
                        objReader.Close();
                    }
                }
                else
                {
                    ViewState["EventID"] = "0";
                    ((Literal)Master.FindControl("litH1")).Text = "Create the Event";
                }
            }
        }

        protected void lnkSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                System.Drawing.Image imag = System.Drawing.Image.FromStream(FileUpload1.PostedFile.InputStream);
                byte[] image = ConvertImageToByteArray(imag, System.Drawing.Imaging.ImageFormat.Jpeg);
                //byte[] image = client.DownloadData(imgEventImage.ImageUrl);
                objController.Event_Add(UserID, Convert.ToInt32(ViewState["EventID"]), txtEventName.Text, ddlMonth.Text + "/" + ddlDay.Text + "/" + ddlYear.Text + " " + ddlHour.Text + ":" + ddlMinute.Text + ":00", txtLocation.Text, txtOrganizerEmail.Text, txtDescription.Text, image);
            }
            catch {
                if (Convert.ToInt32(ViewState["EventID"]) != 0)
                    objController.Event_Update(UserID, Convert.ToInt32(ViewState["EventID"]), txtEventName.Text, ddlMonth.Text + "/" + ddlDay.Text + "/" + ddlYear.Text + " " + ddlHour.Text + ":" + ddlMinute.Text + ":00", txtLocation.Text, txtOrganizerEmail.Text, txtDescription.Text);
            }
            
            Response.Redirect("/");
        }

        protected void btnUploadFile_Click(object sender, EventArgs e)
        {

        }

        protected void btnCancelUpload_Click(object sender, EventArgs e)
        {

        }
        private byte[] ConvertImageToByteArray(System.Drawing.Image imageToConvert,
                                       System.Drawing.Imaging.ImageFormat formatOfImage)
        {
            byte[] Ret;
            try
            {
                using (MemoryStream ms = new MemoryStream())
                {
                    imageToConvert.Save(ms, formatOfImage);
                    Ret = ms.ToArray();
                }
            }
            catch (Exception) { throw; }
            return Ret;
        }

        protected void ddlMonth_SelectedIndexChanged(object sender, EventArgs e)
        {
            int[] months = new int[] { 31, 28, 31, 30, 31, 30, 31, 30, 30, 31, 30, 31 };
            if (Convert.ToInt16(ddlYear.SelectedValue) % 4 == 0)
                months[1] = 29;

            ddlDay.SelectedIndex = -1;
            ddlDay.Items.Clear();

            for (int i = 1; i <= months[Convert.ToInt16(ddlMonth.SelectedValue) - 1]; i++)
            {
                ddlDay.Items.Add(i.ToString());
            }
        }
    }
}