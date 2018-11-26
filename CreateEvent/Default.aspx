<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="eventbrite_regal_day.CreateEvent.Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <script>

        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('img[data-val-preview]').attr('src', e.target.result);
                }

                reader.readAsDataURL(input.files[0]);
            }
        }

        $(function () {


            $(":input[data-val-fileupload]").change(function () {
                readURL(this);

            });


            //document.getElementById("body_FileUpload1").onchange = function () {
            //    var path = this.value;
            //    if (path != "") {
            //        var separated = path.split("\\");
            //        path = separated[separated.length - 1];
            //    }

            //    document.getElementById("body_ChooseFileName").value = path;
            //};
            //document.getElementById("body_btnCancelUpload").onclick = function () {
            //    document.getElementById("body_ChooseFileName").value = document.getElementById("body_ChooseFileName").placeholder;
            //};

        });
    </script>
    <script type="text/javascript">
        //$(function () {
        //    document.getElementById("MainContent_FileUpload1").onchange = function () {
        //        var path = this.value;
        //        if (path != "") {
        //            //var separated = path.split("\\");
        //            //path = separated[separated.length - 1];
        //            //document.getElementById("body_ChooseFileName").value = path;
        //            document.forms['ctl01'].submit();
        //        }


        //    };
        //});
    </script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div id="general">
        <div class="content custom-form">
            <div class="sectionheader">
                <h3 class="left">Create Event</h3>
                <hr style="clear: both;" />
            </div>

            <div class="form-row">
                <div class="col-md-8 mb-2">
                    <asp:TextBox ID="txtEventName" runat="server" CssClass="form-control" placeholder="Name of event"></asp:TextBox>
                    <asp:RequiredFieldValidator SetFocusOnError="true" ID="rqEventName" runat="server" ErrorMessage="Please enter an event name" ControlToValidate="txtEventName" Display="None"></asp:RequiredFieldValidator>
                    <ajaxToolkit:ValidatorCalloutExtender CssClass="CustomValidator" runat="Server" ID="vceEventName" TargetControlID="rqEventName" HighlightCssClass="highlight" WarningIconImageUrl="../img/ValidatorCallout/alert-small.gif" CloseImageUrl="../img/ValidatorCallout/close.gif" />
                </div>
            </div>

            <div class="form-row">
                <div class="col-md-4 mb-2">
                    <div style="float:left;"><asp:TextBox ID="txtEventDate" runat="server" placeholder="Event Date" CssClass="form-control"></asp:TextBox></div>
                    <div style="float:left;"><asp:DropDownList ID="ddlTime" runat="server" CssClass="form-control">
                        <asp:ListItem>12:00 AM</asp:ListItem>
                        <asp:ListItem>12:30 AM</asp:ListItem>
                        <asp:ListItem Value="01:00 AM">1:00 AM</asp:ListItem>
                        <asp:ListItem Value="01:30 AM">1:30 AM</asp:ListItem>
                        <asp:ListItem Value="02:00 AM">2:00 AM</asp:ListItem>
                        <asp:ListItem Value="02:30 AM">2:30 AM</asp:ListItem>
                        <asp:ListItem Value="03:00 AM">3:00 AM</asp:ListItem>
                        <asp:ListItem Value="03:30 AM">3:30 AM</asp:ListItem>
                        <asp:ListItem Value="04:00 AM">4:00 AM</asp:ListItem>
                        <asp:ListItem Value="04:30 AM">4:30 AM</asp:ListItem>
                        <asp:ListItem Value="05:00 AM">5:00 AM</asp:ListItem>
                        <asp:ListItem Value="05:30 AM">5:30 AM</asp:ListItem>
                        <asp:ListItem Value="06:00 AM">6:00 AM</asp:ListItem>
                        <asp:ListItem Value="06:30 AM">6:30 AM</asp:ListItem>
                        <asp:ListItem Value="07:00 AM">7:00 AM</asp:ListItem>
                        <asp:ListItem Value="07:30 AM">7:30 AM</asp:ListItem>
                        <asp:ListItem Value="08:00 AM">8:00 AM</asp:ListItem>
                        <asp:ListItem Value="08:30 AM">8:30 AM</asp:ListItem>
                        <asp:ListItem Value="09:00 AM">9:00 AM</asp:ListItem>
                        <asp:ListItem Value="09:30 AM">9:30 AM</asp:ListItem>
                        <asp:ListItem>10:00 AM</asp:ListItem>
                        <asp:ListItem>10:30 AM</asp:ListItem>
                        <asp:ListItem>11:00 AM</asp:ListItem>
                        <asp:ListItem>11:30 AM</asp:ListItem>
                        <asp:ListItem>12:00 PM</asp:ListItem>
                        <asp:ListItem>12:30 PM</asp:ListItem>
                        <asp:ListItem Value="01:00 PM">1:00 PM</asp:ListItem>
                        <asp:ListItem Value="01:30 PM">1:30 PM</asp:ListItem>
                        <asp:ListItem Value="02:00 PM">2:00 PM</asp:ListItem>
                        <asp:ListItem Value="02:30 PM">2:30 PM</asp:ListItem>
                        <asp:ListItem Value="03:00 PM">3:00 PM</asp:ListItem>
                        <asp:ListItem Value="03:30 PM">3:30 PM</asp:ListItem>
                        <asp:ListItem Value="04:00 PM">4:00 PM</asp:ListItem>
                        <asp:ListItem Value="04:30 PM">4:30 PM</asp:ListItem>
                        <asp:ListItem Value="05:00 PM">5:00 PM</asp:ListItem>
                        <asp:ListItem Value="05:30 PM">5:30 PM</asp:ListItem>
                        <asp:ListItem Value="06:00 PM">6:00 PM</asp:ListItem>
                        <asp:ListItem Value="06:30 PM">6:30 PM</asp:ListItem>
                        <asp:ListItem Value="07:00 PM">7:00 PM</asp:ListItem>
                        <asp:ListItem Value="07:30 PM">7:30 PM</asp:ListItem>
                        <asp:ListItem Value="08:00 PM">8:00 PM</asp:ListItem>
                        <asp:ListItem Value="08:30 PM">8:30 PM</asp:ListItem>
                        <asp:ListItem Value="09:00 PM">9:00 PM</asp:ListItem>
                        <asp:ListItem Value="09:30 PM">9:30 PM</asp:ListItem>
                        <asp:ListItem>10:00 PM</asp:ListItem>
                        <asp:ListItem>10:30 PM</asp:ListItem>
                        <asp:ListItem>11:00 PM</asp:ListItem>
                        <asp:ListItem>11:30 PM</asp:ListItem>
                    </asp:DropDownList></div>
                    <div style="clear:left;"></div>
                    <ajaxToolkit:CalendarExtender runat="server" TargetControlID="txtEventDate" ID="ceEventDate" Format="MM/dd/yyyy" />
                    <asp:RequiredFieldValidator SetFocusOnError="true" ID="rqEventDate" runat="server" ErrorMessage="Please enter an event date" ControlToValidate="txtEventDate" Display="None"></asp:RequiredFieldValidator>
                    <ajaxToolkit:ValidatorCalloutExtender CssClass="CustomValidator" runat="Server" ID="Validatorcalloutextender1" TargetControlID="rqEventDate" HighlightCssClass="highlight" WarningIconImageUrl="../img/ValidatorCallout/alert-small.gif" CloseImageUrl="../img/ValidatorCallout/close.gif" />
                    <asp:RegularExpressionValidator SetFocusOnError="true" ID="rejexEventDate" runat="server" ErrorMessage="Enter the date in the correct format." ControlToValidate="txtEventDate" Display="None" ValidationExpression="^(0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])[- /.](19|20)\d\d$"></asp:RegularExpressionValidator>
                    <ajaxToolkit:ValidatorCalloutExtender CssClass="CustomValidator" runat="Server" ID="vcerejexEventDate" TargetControlID="rejexEventDate" HighlightCssClass="highlight" WarningIconImageUrl="../img/ValidatorCallout/alert-small.gif" CloseImageUrl="../img/ValidatorCallout/close.gif" />
                </div>
            </div>

            <div class="form-row">
                <div class="col-md-8 mb-2">
                    <asp:TextBox ID="txtLocation" runat="server" CssClass="form-control" placeholder="Event Address"></asp:TextBox>
                    <asp:RequiredFieldValidator SetFocusOnError="true" ID="rqLocation" runat="server" ErrorMessage="Please enter an event address" ControlToValidate="txtLocation" Display="None"></asp:RequiredFieldValidator>
                    <ajaxToolkit:ValidatorCalloutExtender CssClass="CustomValidator" runat="Server" ID="vceLocation" TargetControlID="rqLocation" HighlightCssClass="highlight" WarningIconImageUrl="../img/ValidatorCallout/alert-small.gif" CloseImageUrl="../img/ValidatorCallout/close.gif" />
                </div>
            </div>

            <div class="form-row">
                <div class="col-md-6 mb-2">
                    <asp:TextBox ID="txtOrganizerEmail" runat="server" CssClass="form-control" placeholder="Email"></asp:TextBox>
                    <asp:RequiredFieldValidator SetFocusOnError="true" ID="rqOrganizerEmail" runat="server" ErrorMessage="Please enter an event address" ControlToValidate="txtOrganizerEmail" Display="None"></asp:RequiredFieldValidator>
                    <ajaxToolkit:ValidatorCalloutExtender CssClass="CustomValidator" runat="Server" ID="vcerqOrganizerEmail" TargetControlID="rqOrganizerEmail" HighlightCssClass="highlight" WarningIconImageUrl="../img/ValidatorCallout/alert-small.gif" CloseImageUrl="../img/ValidatorCallout/close.gif" />
                    <asp:RegularExpressionValidator SetFocusOnError="true" ID="rejexOrganizerEmail" runat="server" ErrorMessage="Enter the email address in the correct format." ControlToValidate="txtOrganizerEmail" Display="None" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    <ajaxToolkit:ValidatorCalloutExtender CssClass="CustomValidator" runat="Server" ID="vcerejexOrganizerEmail" TargetControlID="rejexOrganizerEmail" HighlightCssClass="highlight" WarningIconImageUrl="../img/ValidatorCallout/alert-small.gif" CloseImageUrl="../img/ValidatorCallout/close.gif" />
                </div>
            </div>

            <div class="form-row">
                <div class="col-md-8 mb-3">
                    <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine" placeholder="Description"></asp:TextBox>
                    <asp:RequiredFieldValidator SetFocusOnError="true" ID="rqDescription" runat="server" ErrorMessage="Please enter an event address" ControlToValidate="txtDescription" Display="None"></asp:RequiredFieldValidator>
                    <ajaxToolkit:ValidatorCalloutExtender CssClass="CustomValidator" runat="Server" ID="vceDescription" TargetControlID="rqDescription" HighlightCssClass="highlight" WarningIconImageUrl="../img/ValidatorCallout/alert-small.gif" CloseImageUrl="../img/ValidatorCallout/close.gif" />
                </div>
            </div>
            <div class="form-row">
                <div class="col-md-10 mb-3">
                    <div class="file-upload">
                        <%--<button class="btn btn-info btn-block" type="button" onclick="$('.file-upload-input').trigger( 'click' )">Add Image</button>--%>
                        <div class="image-upload-wrap">
                            <%--<input class="file-upload-input" type='file' onchange="readURL(this);" accept="image/*" />--%>
                            <div class="btnChooseFile btn btn-info btn-block">
                                <a href="javascript:void(0);" onclick="$('#MainContent_FileUpload1').trigger('click');">ADD AN IMAGE FOR YOUR EVENT</a>
                                <asp:FileUpload ID="FileUpload1" runat="server" data-val-fileupload="data-val-fileupload" accept="image/*" />
                                <input id="ChooseFileName" placeholder="No file chosen" disabled="disabled" runat="server" style="width: 21.1em;" />
                                <span class="file-upload-btns">
                                    <asp:Button ID="btnUploadFile" runat="server" Text="+ Upload File" CssClass="btn orange" ToolTip="upload an image file" OnClick="btnUploadFile_Click" />
                                    <asp:Button ID="btnCancelUpload" runat="server" Text="Cancel" CssClass="btn outline" ToolTip="Cancel upload" OnClick="btnCancelUpload_Click" />
                                </span>
                            </div>


                        </div>
                        <div id="divEventImage" class="file-upload-content" runat="server">
                            <a href="javascript:void(0);" class="thumbnail">
                                <asp:Image runat="server" ID="imgEventImage" ImageUrl="" data-val-preview="data-val-preview" Style="max-width: 320px;" />
                            </a>
                            <%--<div class="image-title-wrap">
                                    <button type="button" onclick="removeUpload()" class="btn btn-outline-secondary">Remove <span class="image-title">Uploaded Image</span></button>
                                </div>--%>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-row ">
                <div class="col-md-4 mb-3">
                    <input type="checkbox" name="donation">
                    <label for="donation">Request guest donation</label>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">@</span>
                        </div>
                        <input type="text" placeholder="Venmo-handle" class="form-control" aria-label="venmohandle" name="venmohandle">
                    </div>
                    <div class="invalid-feedback">Please provide donation target</div>
                </div>

            </div>

            <!-- http://getbootstrap.com/docs/4.1/components/buttons/ -->
            <%--<button class="btn btn-primary" type="submit">Submit</button>--%>
            <asp:LinkButton ID="lnkSubmit" CssClass="btn btn-primary" OnClick="lnkSubmit_Click" runat="server">Submit</asp:LinkButton>

        </div>
    </div>
    </div>
    </div>
</asp:Content>
