<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="eventbrite_regal_day.CreateEvent.Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div id="general">
        <div class="content custom-form">
            <div class="sectionheader">
                <h3 class="left">Create Event</h3>
                <hr style="clear: both;" />
            </div>
            <form action="/form" method="post" class="needs-validation" novalidate>

                <div class="form-row">
                    <div class="col-md-8 mb-2">
                        <asp:TextBox ID="txtEventName" runat="server" CssClass="form-control" placeholder="Name of event"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rqEventName" CssClass="invalid-feedback" runat="server" ErrorMessage="Please enter an event name" ControlToValidate="txtEventName"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="form-row">
                    <div class="col-md-4 mb-2">
                        <asp:TextBox ID="txtEventDate" runat="server" placeholder="Event Date" CssClass="form-control"></asp:TextBox>
                        <ajaxToolkit:CalendarExtender runat="server" TargetControlID="txtEventDate" ID="ceEventDate" Format="dd/MM/yyyy" />
                        <ajaxToolkit:MaskedEditExtender ID="meEventDate" runat="server" TargetControlID="txtEventDate" Mask="99/99/9999" UserDateFormat="DayMonthYear" MaskType="Number" InputDirection="LeftToRight" ClearMaskOnLostFocus="false" ClearTextOnInvalid="true" />
                        <asp:RequiredFieldValidator ID="rqEventDate" ControlToValidate="txtEventDate" CssClass="invalid-feedback" runat="server" ErrorMessage="Please enter a date"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="form-row">
                    <div class="col-md-8 mb-2">
                        <asp:TextBox ID="txtEventAddress" runat="server" CssClass="form-control" placeholder="Event Address"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rqEventAddress" ControlToValidate="txtEventAddress" CssClass="invalid-feedback" runat="server" ErrorMessage="Please enter an address"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="form-row">
                    <div class="col-md-6 mb-2">
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Email"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rqEmail" ControlToValidate="txtEmail" CssClass="invalid-feedback" runat="server" ErrorMessage="Please enter an email"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="form-row">
                    <div class="col-md-8 mb-3">
                        <textarea autocomplete="off" autofocus="" class="form-control" name="event-desc" placeholder="Description of your event" required></textarea>
                        <div class="invalid-feedback">Please fill event name</div>
                    </div>
                </div>

                <div class="form-row">
                    <div class="col-md-10 mb-3">
                        <div class="file-upload">
                            <button class="btn btn-info btn-block" type="button" onclick="$('.file-upload-input').trigger( 'click' )">Add Image</button>

                            <div class="image-upload-wrap">
                                <input class="file-upload-input" type='file' onchange="readURL(this);" accept="image/*" />
                                <div class="drag-text">
                                    <h3>Drag and drop a file or select add Image</h3>
                                </div>
                            </div>
                            <div class="file-upload-content">
                                <img class="file-upload-image" src="#" alt="your image" />
                                <div class="image-title-wrap">
                                    <button type="button" onclick="removeUpload()" class="btn btn-outline-secondary">Remove <span class="image-title">Uploaded Image</span></button>
                                </div>
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

            </form>
        </div>
    </div>
</asp:Content>
