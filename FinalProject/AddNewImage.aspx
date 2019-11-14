<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddNewImage.aspx.cs" Inherits="FinalProject.AddNewImage" %>
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
      <div class="col-md-2">Author</div><div class="col-md-4"><asp:TextBox ID="tbAuthor" runat="server"></asp:TextBox></div>
            </div><br />

     <div class="row">
      <div class="col-md-2">Date of publication</div><div class="col-md-4"><asp:TextBox ID="tbDate" runat="server" TextMode="DateTime"></asp:TextBox></div>
            </div><br />

    <div class="row">
      <div class="col-md-2">PDF</div><div class="col-md-4"><asp:FileUpload ID="fupPDF" runat="server" /></div>
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
