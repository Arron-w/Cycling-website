<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="election.aspx.cs" Inherits="FinalProject.Admin.election" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <asp:DropDownList ID="ddl_User" runat="server" DataSourceID="SqlDataSource2" DataTextField="UserName" DataValueField="Id">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbaw16abnConnectionString %>" SelectCommand="SELECT [Id], [Name] FROM [AspNetRoles]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dbaw16abnConnectionString %>" SelectCommand="SELECT [Id], [UserName] FROM [AspNetUsers]"></asp:SqlDataSource>
    Should have role
    <asp:DropDownList ID="ddl_Role" runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="Id">
    </asp:DropDownList>
    <br />

    <asp:Button ID="Button1" runat="server" Text="Give User Role" OnClick="Button1_Click" />


    <br />
    <br />
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>


</asp:Content>
