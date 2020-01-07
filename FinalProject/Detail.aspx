<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Detail.aspx.cs" Inherits="FinalProject.Detail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <p>
        <br />
        <%#Eval("Author") %>
    </p>
    <p>
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                <div class="row">
                   <div class="col-md-4"><span><h2><%#Eval("Title") %></h2> by  <%#Eval("Author") %></span></div>
                    </div>
                
                 <div class="row">
                   <div class="col-md-8"><div style="border-style:solid;border-width:medium;"> <%#Eval("Description") %></div></div>
                </div>
                    <div class="row">
                     <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("PDF") %>' height="250" width="300"/>
                </div>
               
                
                   Posted date: <span> <%#Eval("DateOfPublication") %></span>
                
                <hr />
                

            </ItemTemplate>
        </asp:Repeater>
    </p>
    
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbaw16abnConnectionString %>" SelectCommand="SELECT * FROM [Photos] WHERE ([Id] = @Id)">
            <SelectParameters>
                <asp:QueryStringParameter Name="Id" QueryStringField="PhotoId" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    
        <%#Eval("Description") %>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dbaw16abnConnectionString %>" SelectCommand="SELECT [Title], [Body], [Author], [PostingTime], [Id] FROM [PhotoComment] WHERE ([Photo_FKid] = @Photo_FKid)" >
            <SelectParameters>
                <asp:QueryStringParameter Name="Photo_FKid" QueryStringField="PhotoId" Type="Int16" />
            </SelectParameters>
        </asp:SqlDataSource>
        
        <asp:PlaceHolder  runat="server" ID="PhotoTagForm">
       <h2>Tag with existing tags</h2>
        <div class="row">   
            <asp:CheckBoxList ID="CheckBoxList1" runat="server" DataSourceID="SqlDataSource3" DataTextField="TagName" DataValueField="Id" RepeatDirection="Horizontal">
        </asp:CheckBoxList></div>
        

        <div class="row">
     <div class="col-md-4"><h2>Tags Seperated by Commas</h2> &nbsp&nbsp <asp:TextBox ID="TbTags" runat="server" Width="250px"></asp:TextBox> </div></div><br />
        <div class="row"><div class="col-md-4"><asp:Button ID="BtnAddTags" runat="server" OnClick="BtnAddTags_Click" Text="Add Tags" /></div>
        </div>
    </asp:PlaceHolder>

    <hr />
    <br />
    
    
    <br />
    <asp:PlaceHolder runat="server" ID="jsRaterArea">
        <h2>Please rate this photo</h2>
    <input id="superRater" type="number" class="rating" min="0" max="5" step=0.2 data-size="lg" >
    </asp:PlaceHolder>


    <asp:LoginView ID="LoginView1" runat="server" >
        <AnonymousTemplate><b>Sorry, you need to be logged in to add to the discussions, rate and apply tags.</b></AnonymousTemplate>
        <LoggedInTemplate>


            <hr />

    <h2>Discussion</h2>
    <div style="border-style:solid; border-width:medium;">
    <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2">
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

  
    
     
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:dbaw16abnConnectionString %>" SelectCommand="SELECT DISTINCT [Id], [TagName] FROM [PhotoTag]"></asp:SqlDataSource>
    
    
       
    

    <asp:PlaceHolder ID="DiscussionForm" runat="server">
        <hr />
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

    </asp:PlaceHolder>
   
   

    <script>
        $(document).ready(function () {
            $('#superRater').rating();
        });

        $('#superRater').on('rating:change', function (event, value, caption) {
            alert($('#superRater').val());







            var pId = getUrlVars()["PhotoId"];
            var rating = $('#superRater').val();

            $.get("saveRating.aspx",
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
        


    </script>

</asp:Content>
