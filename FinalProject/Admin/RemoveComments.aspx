<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RemoveComments.aspx.cs" Inherits="FinalProject.RemoveComments" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>This Page is for removing comments</h1>
    <p>
        <asp:CheckBoxList ID="CheckBoxList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Title" DataValueField="Id">
        </asp:CheckBoxList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbaw16abnConnectionString %>" SelectCommand="SELECT [Id], [Title] FROM [Comment]"></asp:SqlDataSource>
    </p>
    <p>
        <asp:Button ID="BtnRemoveCom" runat="server" OnClick="BtnRemoveCom_Click" Text="Delete comments" />
    </p>
    <p>&nbsp;</p>
</asp:Content>
