<%@ Page Title="PartyOn | Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="eventbrite_regal_day._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div id="general">
        <!-- Welcom banner -->
        <div id="welcomebanner">
            <div class="bg-img">
                <div class="form-row container">

                    <div class="col">
                        <label for="event"><small>Looking for</small></label><br />
                        <asp:TextBox ID="txtEvent" runat="server"></asp:TextBox>
                    </div>
                    <div class="col">
                        <label for="destination"><small>In</small></label><br />
                        <asp:DropDownList ID="ddlDestination" runat="server">
                            <asp:ListItem Value="any">New Haven, CT</asp:ListItem>
                            <asp:ListItem Value="week">New York, NY</asp:ListItem>
                            <asp:ListItem Value="month">Boston, MA</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col">
                        <label for="time"><small>On</small></label><br />
                        <asp:DropDownList ID="ddlTime" runat="server">
                            <asp:ListItem Value="any">Any time</asp:ListItem>
                            <asp:ListItem Value="week">This week</asp:ListItem>
                            <asp:ListItem Value="month">This month</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="col-2">
                        <label>&nbsp;</label><br />
                        <button type="submit" class="btn btn-info searchbtn">Search</button>
                    </div>
                </div>
            </div>
        </div>

        <div id="events">
            <div class="sectionheader">
                <h3 class="left">Events</h3>
                <a class="right" href="/createevent/">Register an Event</a>
                <hr style="clear: both;" />
            </div>

            <div class="card-group">
                <asp:Repeater ID="rptEvents" runat="server" OnItemDataBound="rptEvents_ItemDataBound">
                    <ItemTemplate>
                        <div class="card ">
                            <a href="#">
                                <asp:Label ID="lblEventID" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"EventID").ToString() %>' Visible="false"></asp:Label>
                                <asp:Image ID="imgEventImage" CssClass="card-img-top" runat="server" AlternateText="Card image cap" />
                            </a>
                            <div class="card-body">
                                <h5 class="card-title"><b>What's the party?</b> <%# DataBinder.Eval(Container.DataItem,"EventName").ToString() %></h5>
                                <p class="card-text"><b>Where is it?</b> <%# DataBinder.Eval(Container.DataItem,"Location").ToString() %></p>
                                <p class="card-text"><b>When is it?</b> <%# DataBinder.Eval(Container.DataItem,"EventDate").ToString() %></p>
                                <p class="card-text"><b>What's it about?</b> <%# DataBinder.Eval(Container.DataItem,"Description").ToString() %></p>
                                <div style="float:left; width:50%;"><asp:LinkButton ID="lnkRSVP" runat="server" CssClass="btn btn-primary">RSVP</asp:LinkButton></div>
                                <div style="float:right; width:50%; text-align:right;"><asp:LinkButton ID="lnkEdit" runat="server" CssClass="btn btn-primary green">EDIT</asp:LinkButton></div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
</asp:Content>
