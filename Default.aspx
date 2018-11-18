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
                <a class="right" href="#">See all</a>
                <hr style="clear: both;" />
            </div>

            <div class="card-group">
                <div class="card ">
                    <a href="#">
                        <img class="card-img-top" src="img/4.jpg" alt="Card image cap">
                    </a>
                    <div class="card-body">
                        <h5 class="card-title">Card title</h5>
                        <p class="card-text">This is a placeholder for upcoming events</p>
                    </div>

                </div>


                <div class="card">
                    <a href="#">
                        <img class="card-img-top" src="img/2.jpg" alt="Card image cap">
                    </a>
                    <div class="card-body">
                        <h5 class="card-title">Card title</h5>
                        <p class="card-text">This is a placeholder for upcoming events</p>
                    </div>
                </div>


                <div class="card">
                    <a href="#">
                        <img class="card-img-top" src="img/1.jpg" alt="Card image cap">
                    </a>
                    <div class="card-body">
                        <h5 class="card-title">Card title</h5>
                        <p class="card-text">This is a placeholder for upcoming events</p>
                    </div>

                </div>

            </div>
        </div>
    </div>
</asp:Content>
