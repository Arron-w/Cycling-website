<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddEvent.aspx.cs" Inherits="FinalProject.Events.AddEvent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <br />

        <br />

        <br />

        <br />
      <div class="row">
      <div class="col-md-2"> Title</div><div class="col-md-4"><asp:TextBox ID="tbTitle" runat="server"></asp:TextBox></div>
          </div><br />
        
    
    <div class="row">
      <div class="col-md-2">Description</div>  <div class="col-md-4"><asp:TextBox ID="tbDesc" runat="server" Height="88px" TextMode="MultiLine" Width="272px"></asp:TextBox></div>
        </div><br />
    
        <div class="row">
      <div class="col-md-2">EventDate</div><div class="col-md-4"><asp:TextBox ID="tbEventDate" runat="server"></asp:TextBox></div>
            </div><br />
    

     <div class="row">
      <div class="col-md-2">Location</div><div class="col-md-4"><asp:TextBox ID="tbLocation" runat="server" TextMode="DateTime"></asp:TextBox></div>
            </div><br />
     <div class="row">
      <div class="col-md-2">Venue Opening Time</div><div class="col-md-4"><asp:TextBox ID="tbVenueOpenTime" runat="server" TextMode="DateTime"></asp:TextBox></div>
            </div><br />
     <div class="row">
      <div class="col-md-2">Registration Time</div><div class="col-md-4"><asp:TextBox ID="tbRegTime" runat="server" TextMode="DateTime"></asp:TextBox></div>
            </div><br />
     <div class="row">
      <div class="col-md-2">Start Time</div><div class="col-md-4"><asp:TextBox ID="tbStTime" runat="server" TextMode="DateTime"></asp:TextBox></div>
            </div><br />
     <div class="row">
      <div class="col-md-2">Finish Time</div><div class="col-md-4"><asp:TextBox ID="tbFinTime" runat="server" TextMode="DateTime"></asp:TextBox></div>
            </div><br />




    <div class="row">
      <div class="col-md-2">Image</div><div class="col-md-4"><asp:FileUpload ID="fupPDF" runat="server" /></div>
            </div>
        
   <br />
        
        <div class="row">
      <div class="col-md-5"></div><div class="col-md-5"><asp:Button ID="Button1" runat="server" OnClick="BtnSubmit_Click" Text="Submit" /></div>
            </div>
    <br />
      <div class="row">
      <div class="col-md-8"><asp:Label ID="lbl_msg" runat="server" Text="Label"></asp:Label></div>
            </div>
   
        
   
       
   
        
    
        &nbsp;
</asp:Content>
