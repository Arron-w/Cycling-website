<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EventDetail.aspx.cs" Inherits="FinalProject.Events.EventDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        #map {
            width: 100%;
            height: 400px;
            background-color: grey;
        }
    </style>

     
    <p>
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSourceEvent1" OnItemCommand="Repeater1_ItemCommand">
            <ItemTemplate>
                <div class="row">
                   <div class="col-md-4"><span><h2><%#Eval("Title") %></h2> </span></div>
                    </div>
                
                 <div class="row">
                   <div class="col-md-8"><div style="border-style:solid;border-width:medium;"> <b>Description:</b> <%#Eval("Description") %></div></div>
                </div>
                    
                   <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Image") %>' Height="250px" Width="300px" />
                     <br /> 

                <div class="row">
                   <div class="col-md-8"><div style="border-style:solid;border-width:medium;"> <b>Event Date:</b> <%#Eval("EventDate") %></div></div>
                </div>
                <div class="row">
                   <div class="col-md-8"><div style="border-style:solid;border-width:medium;"><b> Location: </b> <%#Eval("Location") %></div></div>
                </div>
                <div class="row">
                   <div class="col-md-8"><div style="border-style:solid;border-width:medium;"> <b> Venue Opens: </b> <%#Eval("VenueOpen") %></div></div>
                </div>
                <div class="row">
                   <div class="col-md-8"><div style="border-style:solid;border-width:medium;"> <b>Registration Time: </b> <%#Eval("RegistrationTime") %></div></div>
                </div>
                <div class="row">
                   <div class="col-md-8"><div style="border-style:solid;border-width:medium;"> <b>Start Time: </b> <%#Eval("StartTime") %></div></div>
                </div>
                <div class="row">
                   <div class="col-md-8"><div style="border-style:solid;border-width:medium;"> <b>Finish Time: </b> <%#Eval("EndTime") %></div></div>
                </div>
                 <div class="row">
                   <div class="col-md-8"><div style="border-style:solid;border-width:medium;"><b> Latitude:</b> <%#Eval("LocLat") %></div></div>
                </div>
                 <div class="row">
                   <div class="col-md-8"><div style="border-style:solid;border-width:medium;"><b> Longitude:</b> <%#Eval("LocLong") %></div></div>
                </div>
                 
               
                
                 
                
                <hr />
                

            </ItemTemplate>
        </asp:Repeater>
    </p>
    <p>
        &nbsp;</p>



    
        <asp:SqlDataSource ID="SqlDataSourceEvent1" runat="server" ConnectionString="<%$ ConnectionStrings:dbaw16abnConnectionString %>" SelectCommand="SELECT * FROM [Event] WHERE ([EventId] = @EventId)" >
            <SelectParameters>
                <asp:QueryStringParameter Name="EventId" QueryStringField="EventId" Type="Int32" />
                
            </SelectParameters>
        </asp:SqlDataSource>
    
    
        <%#Eval("Description") %>
        <asp:SqlDataSource ID="SqlDataSourceEvent2" runat="server" ConnectionString="<%$ ConnectionStrings:dbaw16abnConnectionString %>" SelectCommand="SELECT [Title], [Body], [Author], [PostingTime], [Id] FROM [EventComment] WHERE ([Event_FKid] = @Event_FKid)" >
            <SelectParameters>
                <asp:QueryStringParameter Name="Event_FKid" QueryStringField="EventId" Type="Int16" />
            </SelectParameters>
        </asp:SqlDataSource>

   <asp:PlaceHolder  runat="server" ID="EventTagForm">
    
    <div class="row"><div class="col-md-4>">
       <h2>Tag with existing tags</h2><asp:CheckBoxList ID="CheckBoxList1" runat="server" DataSourceID="SqlDataSource3" DataTextField="TagName" DataValueField="Id" RepeatDirection="Horizontal">
        </asp:CheckBoxList>
        </div></div>
        <div class="row">
     <div class="col-md-4"> <h2>Tags Seperated by Commas</h2> &nbsp&nbsp <asp:TextBox ID="TbTags" runat="server" Width="250px"></asp:TextBox> </div></div><br />
        <div class="row"><div class="col-md-4"><asp:Button ID="BtnAddTags" runat="server" OnClick="BtnAddTags_Click" Text="Add Tags" /></div>
        </div>

        <hr />
        </asp:PlaceHolder>

    <br />
 
    
      
    <asp:PlaceHolder  runat="server" ID="jsRaterArea">
        <h2>Please rate this event</h2>
    <input id="superRater" type="number" class="rating" min="0" max="5" step=0.2 data-size="lg" >
        <hr />
    </asp:PlaceHolder>
    


   

    
     <asp:LoginView ID="LoginView1" runat="server" >
        <AnonymousTemplate><b>Sorry, you need to be logged in to add to the discussions, rate and apply tags.</b></AnonymousTemplate>
        <LoggedInTemplate>
       


    <h2>Discussion</h2>
    <div style="border-style:solid; border-width:medium;">
    <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSourceEvent2">
        <ItemTemplate>
            
        <div class ="Row">
            <div class="col-md-4">Title: <%#Eval("Title") %></div>
            <div class="col-md-4">Posted: <%#Eval("PostingTime") %></div>
            
            <div class="col-md-4">Posted: <%#Eval("Author") %></div>
        </div>
           <div class ="Row">
            
            <div class="col-md-12">Comment: <%#Eval("Body") %></div>
            
        </div>
               
            <hr />

        </ItemTemplate>
    </asp:Repeater>
            </div>
            </LoggedInTemplate>
    </asp:LoginView> 

  
    
     
     <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:dbaw16abnConnectionString %>" SelectCommand="SELECT DISTINCT [Id], [TagName] FROM [EventTag]"></asp:SqlDataSource>
  <hr />

    <asp:PlaceHolder ID="DiscussionForm" runat="server"> 

            <p>
        &nbsp;</p>
       <h2>Comments:</h2>
    <p>


        Title:
        <asp:TextBox ID="tbCommentTitle" runat="server"></asp:TextBox>


    </p>
    <p>


        Body
        <asp:TextBox ID="tbBody" runat="server" Rows="6" TextMode="MultiLine"></asp:TextBox>


    </p>
   
    <p>


        <asp:Button ID="BtnComSub" runat="server" OnClick="BtnComSub_Click" Text="Submit" />
    </p>
    <p>
        <asp:Label ID="lbl_msg" runat="server" Text="Label"></asp:Label>
    </p>
        <hr />
    </asp:PlaceHolder>
    

   
    <br />

 <h2>Where you can find us:</h2>
 <div id="map"></div>


    

   

    <script>

        $(document).ready(function () {
            $('#superRater').rating();
        });

        $('#superRater').on('rating:change', function (event, value, caption) {
            alert($('#superRater').val());





           

            var pId = getUrlVars()["EventId"];
            var rating = $('#superRater').val();

            $.get("saveEventRating.aspx",
                {
                    Thing: pId,
                    Score: rating

                });

        });

            function getUrlVars() {
                var vars = [], hash;
                var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
                for (var i = 0; i < hashes.length; i++) {
                    hash = hashes[i].split('=');
                    vars.push(hash[0]);
                    vars[hash[0]] = hash[1];

                }
                return vars;


        }



        

           
            

                
               

               


            function initMap() {
               
                   
                    var Lat = 51.266045;
                    var Long = -0.751213;
                    var uluru = { lat: Lat, lng: Long };
                    var map = new google.maps.Map(document.getElementById('map'), {
                        zoom: 4,
                        center: uluru
                    });


                    var marker = new google.maps.Marker({
                        position: uluru,
                        map: map
                    });
            }

           
          
            
    </script>
    
       <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCPj2CpJHYT3X72cqc0xg_gs4whjxJMNVU&callback=initMap"></script>
    

    
    

   
</asp:Content>
