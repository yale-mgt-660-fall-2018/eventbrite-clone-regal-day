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
                if (Request.QueryString["EventID"] != null)
                {
                    ViewState["EventID"] = Request.QueryString["EventID"];
                    using (SqlDataReader objReader = objController.Event_Get(UserID, Request.QueryString["EventID"]))
                    {
                        if (objReader.Read())
                        {
                            txtEventName.Text = objReader["EventName"].ToString();
                            txtEventDate.Text = Convert.ToDateTime(objReader["EventDate"]).ToString("MM/dd/yyyy");
                            txtLocation.Text = objReader["Location"].ToString();
                            txtOrganizerEmail.Text = objReader["OrganizerEmail"].ToString();
                            txtDescription.Text = objReader["Description"].ToString();
                            imgEventImage.ImageUrl = "imagehandler.ascx?EventID=" + objReader["EventID"].ToString();
                        }
                        objReader.Close();
                    }
                }
                else
                    ViewState["EventID"] = "0";

                //if (imgEventImage.ImageUrl == "")
                //    divEventImage.Visible = false;
                //else
                //    divEventImage.Visible = true;
            }
        }

        protected void lnkSubmit_Click(object sender, EventArgs e)
        {
            System.Drawing.Image imag = System.Drawing.Image.FromStream(FileUpload1.PostedFile.InputStream);
            try
            {
                byte[] image = ConvertImageToByteArray(imag, System.Drawing.Imaging.ImageFormat.Jpeg);
                objController.Event_Add(UserID, Convert.ToInt32(ViewState["EventID"]), txtEventName.Text, txtEventDate.Text + " " + ddlTime.Text, txtLocation.Text, txtOrganizerEmail.Text, txtDescription.Text, image);
            }
            catch { }
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
    }
}