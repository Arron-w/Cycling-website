<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="FinalProject._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <div class="jumbotron">
        <h1>Cycling Great Britain Community</h1>
        <p class="lead">This is a community site for cyclists. It can be used to find suitable events to take part in and gives users the opportunity to discuss, rate and tag events.</p>
        <p>The users can also add their own events to the website.</p>
        <p>It also gives users the opportunity to upload their photos which can also be discussed and rated by other users</p>
    </div>

 <%--   <asp:SqlDataSource ID="SqlDataSourceTopEvent5" runat="server" ConnectionString="<%$ ConnectionStrings:dbaw16abnConnectionString %>" 
        SelectCommand="SELECT [Title], [AverageScore], [EventId] FROM [vwEventTop5Ratings]" >
        </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataTopPhoto5" runat="server" ConnectionString="<%$ ConnectionStrings:dbaw16abnConnectionString %>" 
        SelectCommand="SELECT [Title], [AverageScore],[Id], [PDF] FROM [vwPhotoTop5Ratings]" >
        </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataUpcomingEvents" runat="server" ConnectionString="<%$ ConnectionStrings:dbaw16abnConnectionString %>" 
        SelectCommand="SELECT [Title],[EventId], [EventDate] FROM [vwUpcomingEvents]" >
        </asp:SqlDataSource>--%>

    <div>
    <div id="myCarousel" class="carousel slide" data-ride="carousel" style="width:auto; height:500px;">
  <!-- Indicators -->

  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner">
    <div class="item active">
      <img src="/Carousel_Images/Best-Of-British-Ribble-Valley-7-1.jpg" style="height:inherit; width:inherit"  alt="Route 3 Trough of Bowland">
    </div>

    <div class="item">
      <img src="/Carousel_Images/Wilderness-Scotland-The-Five-Countries-Tour.jpg"style="height:inherit; width:inherit" alt="Scotland">
    </div>

    <div class="item">
      <img src="/Carousel_Images/a83284c131dff1f692785d5d3426d77f.jpg"style="height:inherit; width:inherit" alt="Mountain">
    </div>
      </div>
  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
    <span class="sr-only">Next</span>
  </a>
        </div>

 <div>

     <br />
     <br />
     <br />
     <br />
     <br />
     <br />
     <br />
     <br />
      <br />
      <br />
      <br />
      <br />
      <br />
      <br />
           

   <%-- <div class="row">
        <div class="col-md-4">
            <h2>Top 5 Events</h2>
            <asp:Repeater ID="Top5Event" runat="server" DataSourceID="SqlDataSourceTopEvent5">
                <ItemTemplate>
                     <div class="row">
                   <div class="col-md-4" style="font-weight:bold"><%#Eval("Title") %> </span></div>
                    </div>
                     <div class="row">
                           <a href="Events\EventDetail.aspx?EventId=<%# Eval("EventId") %>">More Details</a>
                     <br />
                       <input value="<%# Eval("AverageScore") %>" type="number" class="rating" min="0" max="5" step="0.2" data-size="xs" data-readonly="true" />
                         <hr />
                     <br />
                    </div>
                </ItemTemplate>

            </asp:Repeater>

        </div>
        <div class="col-md-4">
            <h2>Top 5 photos</h2>
            <asp:Repeater ID="Top5Photo" runat="server" DataSourceID="SqlDataTopPhoto5">
                <ItemTemplate>
                     <div class="row">
                   <div class="col-md-4" style="font-weight:bold"><%#Eval("Title") %> </span></div>
                    </div>
                     <div class="row">
                           <a href="Detail.aspx?PhotoId=<%# Eval("Id") %>">More Details</a>
                         </div>
                     <br />
                       <input value="<%# Eval("AverageScore") %>" type="number" class="rating" min="0" max="5" step="0.2" data-size="xs" data-readonly="true" />
                         <hr />
                     <br />


                </ItemTemplate>

                </asp:Repeater>

        </div>
         <div class="col-md-4">
            <h2>Upcoming Events</h2>
            <asp:Repeater ID="RepeaterUpcomingEvents" runat="server" DataSourceID="SqlDataUpcomingEvents">
                <ItemTemplate>
                     <div class="row">
                         <div class="col-md-4" style="font-weight:bold"><%#Eval("EventDate") %> </span></div>
                    </div>
                     <div class="row">
                   <div class="col-md-4" style="font-weight:bold"><%#Eval("Title") %> </span></div>
                    </div>
                     <div class="row">
                           <a href="Events/EventDetail.aspx?EventId=<%# Eval("EventId") %>">More Details</a>
                         </div>
                         <hr />
                     <br />


                </ItemTemplate>

                </asp:Repeater>--%>

        </div>

    </div>

        </div>
        </div>

    
</asp:Content>
