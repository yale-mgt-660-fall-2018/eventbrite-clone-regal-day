<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="eventbrite_regal_day.Event.Default" %>

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
        });
    </script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div id="general">
        <div class="content custom-form">
            <div class="sectionheader">
                <h3 class="left">RSVP to the Event</h3>
                <hr style="clear: both;" />
            </div>

            <div class="eventbanner">
                <div class="banner-center">
                    <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <asp:Image ID="imgEventImage" CssClass="d-block w-100" runat="server" AlternateText="Party Image" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Create Event -->
            <!-- http://getbootstrap.com/docs/4.1/content/typography/ -->
            <div class="content custom-form">
                <div class="sectionheader">
                    <h3 class="left"><asp:Literal ID="litEventName" runat="server"></asp:Literal></h3>
                    <hr style="clear: both;" />
                </div>

                <div class="row">
                    <div class="col-sm-10">
                        <div>
                            <dl>
                                <dt>When is it?</dt>
                                <dd><asp:Literal ID="litEventDate" runat="server"></asp:Literal></dd>
                            </dl>
                            <dl>
                                <dt>Where is it?</dt>
                                <dd><asp:Literal ID="litLocation" runat="server"></asp:Literal></dd>
                            </dl>

                            <dl>
                                <dt>What's it about?</dt>
                                <dd><asp:Literal ID="litDescription" runat="server"></asp:Literal></dd>
                            </dl>

                            <div class="alert alert-warning">
                                Don't want to be a leech? <asp:LinkButton ID="Donate" runat="server" CssClass="alert-link" OnClick="lnkDonate_Click">Donate</asp:LinkButton><br />
                                Amount ($)<asp:TextBox ID="txtAmount" runat="server" Text="10" CssClass="form-control"></asp:TextBox>
                            </div>

                            <dl>
                                <dt>Who's organizing?</dt>
                                <dd><asp:Literal ID="litOrganizerEmail" runat="server"></asp:Literal></dd>
                            </dl>

                        </div>
                    </div>
                </div>
                <div class="rsvpbox">
                    <h5>Don't be a party pooper. Stop by the party!</h5>
                    <div class="form-row align-items-center">
                        <div class="col-md-4">
                            <label class="sr-only" for="inlineFormInput">Name</label>
                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control mb-2" placeholder="Name"></asp:TextBox>
                            <asp:RequiredFieldValidator SetFocusOnError="true" ID="rqName" runat="server" ErrorMessage="Please enter a name" ControlToValidate="txtName" Display="None"></asp:RequiredFieldValidator>
                            <ajaxToolkit:ValidatorCalloutExtender PopupPosition="BottomLeft" CssClass="CustomValidator" runat="Server" ID="vceName" TargetControlID="rqName" HighlightCssClass="highlight" WarningIconImageUrl="../img/ValidatorCallout/alert-small.gif" CloseImageUrl="../img/ValidatorCallout/close.gif" />
                        </div>
                        <div class="col-md-5">
                            <label class="sr-only" for="inlineFormInputGroup">Email</label>
                            <div class="input-group mb-2">
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control mb-2" placeholder="Email"></asp:TextBox>
                                <asp:RequiredFieldValidator SetFocusOnError="true" ID="rqEmail" runat="server" ErrorMessage="Please enter an email" ControlToValidate="txtEmail" Display="None"></asp:RequiredFieldValidator>
                                <ajaxToolkit:ValidatorCalloutExtender PopupPosition="BottomLeft" CssClass="CustomValidator" runat="Server" ID="vceEmail" TargetControlID="rqEmail" HighlightCssClass="highlight" WarningIconImageUrl="../img/ValidatorCallout/alert-small.gif" CloseImageUrl="../img/ValidatorCallout/close.gif" />
                                <asp:RegularExpressionValidator SetFocusOnError="true" ID="rejexEmail" runat="server" ErrorMessage="Enter a yale email only." ControlToValidate="txtEmail" Display="None" ValidationExpression="\w+([-+.]\w+)*@yale.edu"></asp:RegularExpressionValidator>
                                <ajaxToolkit:ValidatorCalloutExtender CssClass="CustomValidator" runat="Server" ID="vcerejexEmail" TargetControlID="rejexEmail" HighlightCssClass="highlight" WarningIconImageUrl="../img/ValidatorCallout/alert-small.gif" CloseImageUrl="../img/ValidatorCallout/close.gif" />
                            </div>
                        </div>
                        <div class="col-auto">
                            <asp:LinkButton ID="lnkSubmit" runat="server" CssClass="btn btn-primary mb-2" OnClick="lnkSubmit_Click">RSVP</asp:LinkButton>
                            <asp:LinkButton ID="lnkGoBack" runat="server" CssClass="btn btn-primary mb-2" OnClick="lnkGoBack_Click" CausesValidation="false">GO BACK</asp:LinkButton>
                        </div>
                    </div>
                </div>
                <div>
                    <div class="sectionheader">
                        <h5 class="left">Party Goers</h5>
                    </div>
                    <div>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">Name</th>
                                    <th scope="col">Email</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="rptPartyGoers" runat="server" OnItemCommand="rptPartyGoers_ItemCommand">
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <asp:Literal ID="litrptPID" runat="server" Visible="false" Text='<%# DataBinder.Eval(Container.DataItem,"PID").ToString() %>'></asp:Literal>
                                                <asp:Literal ID="litrptEventID" runat="server" Visible="false" Text='<%# DataBinder.Eval(Container.DataItem,"EventID").ToString() %>'></asp:Literal>
                                                <asp:Literal ID="litrptName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"Name").ToString() %>'></asp:Literal>
                                            </td>
                                            <td><asp:Literal ID="litrptEmail" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"Email").ToString() %>'></asp:Literal></td>
                                            <td><asp:LinkButton ID="lnkrptDelete" runat="server" CommandName="Delete">Kick em out</asp:LinkButton></td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
