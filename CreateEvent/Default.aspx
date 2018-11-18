<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="eventbrite_regal_day.CreateEvent.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content custom-form">
        <div class="sectionheader">
            <h3 class="left">Create Event</h3>
            <hr style="clear: both;" />
        </div>
        <form action="/form" method="post" class="needs-validation" novalidate>

            <div class="form-row">
                <div class="col-md-8 mb-2">
                    <input autocomplete="off" autofocus="" class="form-control" name="event-name" placeholder="Name of event" type="text" required>
                    <div class="invalid-feedback">Please fill event name</div>
                </div>
            </div>

            <div class="form-row">
                <div class="col-md-4 mb-2">
                    <input data-date-format="dd/mm/yyyy" id="datepicker" autofocus="" class="form-control" name="event-date" required>
                    <div class="invalid-feedback">Please pick a date</div>
                </div>
            </div>

            <div class="form-row">
                <div class="col-md-8 mb-2">
                    <input type="text" id="address" autofocus="" class="form-control" name="event-location" placeholder="Location of event" required></input>
                    <div class="invalid-feedback">Please fill address</div>
                </div>
            </div>

            <div class="form-row">
                <div class="col-md-6 mb-2">
                    <input autocomplete="off" autofocus="" class="form-control" name="email" placeholder="Organizer@email.com" type="text" required>
                    <div class="invalid-feedback">Please fill with your valid email</div>
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
            <button class="btn btn-primary" type="submit">Submit</button>


        </form>
    </div>
</asp:Content>
