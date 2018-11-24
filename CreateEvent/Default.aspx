<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="eventbrite_regal_day.CreateEvent.Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <script>
        $(function () {
            function readURL(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();

                    reader.onload = function (e) {
                        $('img[data-val-preview]').attr('src', e.target.result);
                    }

                    reader.readAsDataURL(input.files[0]);
                }
            }

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
        $(function () {
            document.getElementById("MainContent_FileUpload1").onchange = function () {
                var path = this.value;
                if (path != "") {
                    //var separated = path.split("\\");
                    //path = separated[separated.length - 1];
                    //document.getElementById("body_ChooseFileName").value = path;
                    document.forms['ctl01'].submit();
                }


            };
        });
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
                        <asp:RequiredFieldValidator SetFocusOnError="true" id="rqEventName" runat="server" ErrorMessage="Please enter an event name" ControlToValidate="txtEventName" Display="None"></asp:RequiredFieldValidator>
	                    <ajaxtoolkit:validatorcalloutextender CssClass="CustomValidator" runat="Server" ID="vceEventName" TargetControlID="rqEventName"  HighlightCssClass="highlight" WarningIconImageUrl="../img/ValidatorCallout/alert-small.gif" CloseImageUrl="../img/ValidatorCallout/close.gif" />
                    </div>
                </div>

                <div class="form-row">
                    <div class="col-md-4 mb-2">
                        <asp:TextBox ID="txtEventDate" runat="server" placeholder="Event Date" CssClass="form-control"></asp:TextBox>
                        <ajaxtoolkit:calendarextender runat="server" TargetControlID="txtEventDate" ID="ceEventDate" Format="MM/dd/yyyy" />
                        <asp:RequiredFieldValidator SetFocusOnError="true" id="rqEventDate" runat="server" ErrorMessage="Please enter an event date" ControlToValidate="txtEventDate" Display="None"></asp:RequiredFieldValidator>
	                    <ajaxtoolkit:validatorcalloutextender CssClass="CustomValidator" runat="Server" ID="Validatorcalloutextender1" TargetControlID="rqEventDate"  HighlightCssClass="highlight" WarningIconImageUrl="../img/ValidatorCallout/alert-small.gif" CloseImageUrl="../img/ValidatorCallout/close.gif" />
                        <asp:RegularExpressionValidator SetFocusOnError="true" id="rejexEventDate" runat="server" ErrorMessage="Enter the date in the correct format." ControlToValidate="txtEventDate" Display="None" ValidationExpression="^(0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])[- /.](19|20)\d\d$"></asp:RegularExpressionValidator>
	                    <ajaxToolkit:ValidatorCalloutExtender CssClass="CustomValidator" runat="Server" ID="vcerejexEventDate" TargetControlID="rejexEventDate" HighlightCssClass="highlight" WarningIconImageUrl="../img/ValidatorCallout/alert-small.gif" CloseImageUrl="../img/ValidatorCallout/close.gif" />
                    </div>
                </div>

                <div class="form-row">
                    <div class="col-md-8 mb-2">
                        <asp:TextBox ID="txtEventAddress" runat="server" CssClass="form-control" placeholder="Event Address"></asp:TextBox>
                        <asp:RequiredFieldValidator SetFocusOnError="true" id="rqEventAddress" runat="server" ErrorMessage="Please enter an event address" ControlToValidate="txtEventAddress" Display="None"></asp:RequiredFieldValidator>
	                    <ajaxtoolkit:validatorcalloutextender CssClass="CustomValidator" runat="Server" ID="vceEventAddress" TargetControlID="rqEventAddress"  HighlightCssClass="highlight" WarningIconImageUrl="../img/ValidatorCallout/alert-small.gif" CloseImageUrl="../img/ValidatorCallout/close.gif" />
                    </div>
                </div>

                <div class="form-row">
                    <div class="col-md-6 mb-2">
                        <asp:TextBox ID="txtOrganizerEmail" runat="server" CssClass="form-control" placeholder="Email"></asp:TextBox>
                        <asp:RequiredFieldValidator SetFocusOnError="true" id="rqOrganizerEmail" runat="server" ErrorMessage="Please enter an event address" ControlToValidate="txtEventAddress" Display="None"></asp:RequiredFieldValidator>
	                    <ajaxtoolkit:validatorcalloutextender CssClass="CustomValidator" runat="Server" ID="vcerqOrganizerEmail" TargetControlID="rqOrganizerEmail"  HighlightCssClass="highlight" WarningIconImageUrl="../img/ValidatorCallout/alert-small.gif" CloseImageUrl="../img/ValidatorCallout/close.gif" />
                        <asp:RegularExpressionValidator SetFocusOnError="true" id="rejexOrganizerEmail" runat="server" ErrorMessage="Enter the email address in the correct format." ControlToValidate="txtOrganizerEmail" Display="None" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
	                    <ajaxToolkit:ValidatorCalloutExtender CssClass="CustomValidator" runat="Server" ID="vcerejexOrganizerEmail" TargetControlID="rejexOrganizerEmail" HighlightCssClass="highlight" WarningIconImageUrl="../img/ValidatorCallout/alert-small.gif" CloseImageUrl="../img/ValidatorCallout/close.gif" />
                    </div>
                </div>

                <div class="form-row">
                    <div class="col-md-8 mb-3">
                        <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                        <asp:RequiredFieldValidator SetFocusOnError="true" id="rqDescription" runat="server" ErrorMessage="Please enter an event address" ControlToValidate="txtDescription" Display="None"></asp:RequiredFieldValidator>
	                    <ajaxtoolkit:validatorcalloutextender CssClass="CustomValidator" runat="Server" ID="vceDescription" TargetControlID="rqDescription"  HighlightCssClass="highlight" WarningIconImageUrl="../img/ValidatorCallout/alert-small.gif" CloseImageUrl="../img/ValidatorCallout/close.gif" />
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-10 mb-3">
                        <div class="file-upload">
                            <%--<button class="btn btn-info btn-block" type="button" onclick="$('.file-upload-input').trigger( 'click' )">Add Image</button>--%>
                            <div class="image-upload-wrap">
                                <%--<input class="file-upload-input" type='file' onchange="readURL(this);" accept="image/*" />--%>
                                <div class="btnChooseFile btn btn-info btn-block">
                                    <span>ADD AN IMAGE FOR YOUR EVENT</span>
                                    <asp:FileUpload ID="FileUpload1" runat="server" data-val-fileupload="data-val-fileupload" accept="image/*"/>
                                    <input id="ChooseFileName" placeholder="No file chosen" disabled="disabled" runat="server" style="width: 21.1em;" />
                                    <span class="file-upload-btns">
                                            <asp:Button ID="btnUploadFile" runat="server" Text="+ Upload File" CssClass="btn orange" ToolTip="upload a pdf file" OnClick="btnUploadFile_Click" />   
                                            <asp:Button ID="btnCancelUpload" runat="server" Text="Cancel" CssClass="btn outline" ToolTip="Cancel upload" OnClick="btnCancelUpload_Click" /> 
                                        </span>
                                </div>
                            </div>
                            <div class="file-upload-content">
                                <a href="javascript:void(0);" class="thumbnail">
                                    <asp:Image runat="server" ID="imgEmailLogo" ImageUrl="#" data-val-preview="data-val-preview" Style="max-width: 320px;" />
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
