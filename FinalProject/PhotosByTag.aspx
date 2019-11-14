<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PhotosByTag.aspx.cs" Inherits="FinalProject.PhotosByTag" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:SqlDataSource ID="SqlDataSourceTagFilter" runat="server" ConnectionString="<%$ ConnectionStrings:dbaw16abnConnectionString %>" SelectCommand="SELECT DISTINCT [Id], [TagName] FROM [EventTag]"></asp:SqlDataSource>
  
   
    
    <div class="row"><div class="col-md-4>">
       <b>Filter Photos by selected tag</b>
               </div>
       <asp:CheckBoxList ID="SelectTagFilter" runat="server" DataSourceID="SqlDataSourceTagFilter" DataTextField="TagName" DataValueField="Id" RepeatDirection="Horizontal">
        </asp:CheckBoxList>
        </div>
    <asp:Button ID="btnFilterTags" runat="server" Text="Search" OnClick="btnFilterTags_Click" />


        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" Visible="False" />
                <asp:BoundField DataField="Title" HeaderText="Title" />
                <asp:BoundField DataField="DateOfPublication" HeaderText="DateOfPublication" SortExpression="DateOfPublication" />
                <asp:BoundField DataField="Author" HeaderText="Author" SortExpression="Author" Visible="False" />
                <asp:ImageField DataAlternateTextField="PDF" DataImageUrlField="PDF" HeaderText="PDF Image"> 
                 <%--   <ItemStyle Wrap="True" Height="100px" Width="150px" />--%>

<ControlStyle Height="500px" Width="375px" CssClass="gridImage"></ControlStyle>

                </asp:ImageField>
                <asp:HyperLinkField DataNavigateUrlFields="Id" DataNavigateUrlFormatString="Detail.aspx?PhotoId={0}" Text="Details" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbaw16abnConnectionString %>" SelectCommand="SELECT DISTINCT [Description], [Author], [DateOfPublication], [PDF], [Id], [Title], [TagName] FROM [vwPhotosAndTags] WHERE ([TagName] = @TagName)">
            <SelectParameters>
                <asp:QueryStringParameter Name="TagName" QueryStringField="Tag" Type="String" />
            </SelectParameters>
          </asp:SqlDataSource>


   
</asp:Content>
