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
                    <div style="float:left;">
                        Yr<br />
                        <asp:DropDownList ID="ddlYear" runat="server">
                            <asp:ListItem>2018</asp:ListItem>
                            <asp:ListItem>2019</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div style="float:left;">
                        Mo<br />
                        <asp:DropDownList ID="ddlMonth" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlMonth_SelectedIndexChanged">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            <asp:ListItem>6</asp:ListItem>
                            <asp:ListItem>7</asp:ListItem>
                            <asp:ListItem>8</asp:ListItem>
                            <asp:ListItem>9</asp:ListItem>
                            <asp:ListItem>10</asp:ListItem>
                            <asp:ListItem>11</asp:ListItem>
                            <asp:ListItem>12</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div style="float:left;">
                        Day<br />
                        <asp:DropDownList ID="ddlDay" runat="server">
                            <asp:ListItem>1</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div style="float:left;">
                        Hr<br />
                        <asp:DropDownList ID="ddlHour" runat="server">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            <asp:ListItem>6</asp:ListItem>
                            <asp:ListItem>7</asp:ListItem>
                            <asp:ListItem>8</asp:ListItem>
                            <asp:ListItem>9</asp:ListItem>
                            <asp:ListItem>10</asp:ListItem>
                            <asp:ListItem>11</asp:ListItem>
                            <asp:ListItem>12</asp:ListItem>
                            <asp:ListItem>13</asp:ListItem>
                            <asp:ListItem>14</asp:ListItem>
                            <asp:ListItem>15</asp:ListItem>
                            <asp:ListItem>16</asp:ListItem>
                            <asp:ListItem>17</asp:ListItem>
                            <asp:ListItem>18</asp:ListItem>
                            <asp:ListItem>19</asp:ListItem>
                            <asp:ListItem>20</asp:ListItem>
                            <asp:ListItem>21</asp:ListItem>
                            <asp:ListItem>22</asp:ListItem>
                            <asp:ListItem>23</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div style="float:left;">
                        Min<br />
                        <asp:DropDownList ID="ddlMinute" runat="server">
                            <asp:ListItem>00</asp:ListItem>
                            <asp:ListItem>30</asp:ListItem>
                        </asp:DropDownList>
                    </div>
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

            <%--<div class="form-row ">
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

            </div>--%>

            <!-- http://getbootstrap.com/docs/4.1/components/buttons/ -->
            <%--<button class="btn btn-primary" type="submit">Submit</button>--%>
            <asp:LinkButton ID="lnkSubmit" CssClass="btn btn-primary" OnClick="lnkSubmit_Click" runat="server">Submit</asp:LinkButton>

        </div>
    </div>
</asp:Content>
