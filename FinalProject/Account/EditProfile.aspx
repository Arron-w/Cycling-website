<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditProfile.aspx.cs" Inherits="FinalProject.Account.EditProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class =" row">
    <div class="col-md-4">
    Your Profile picture <asp:FileUpload ID="fuProfilePic" runat="server" Width="321px" />
    </div></div>
    <br />
    <div class =" row">
    <div class="col-md-8">
    Describe Yourself <asp:TextBox ID="tbDescription" runat="server" Height="123px" TextMode="MultiLine" Width="204px"></asp:TextBox>
    </div></div>
    
    <br />

    <br />
    <div class =" row">
    <div class="col-md-4">
    Where are you? <asp:TextBox ID="tbPostCode" runat="server" Width="213px"></asp:TextBox>
    </div></div>
    <br />

    <asp:Button ID="btnUpdateProfile" runat="server" Text="Save Profile" OnClick="btnUpdateProfile_Click" />
    <br />
    <br />
    <asp:Label ID="lbl_msg" runat="server" Text="Label"></asp:Label>
</asp:Content>
