<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EventsByTag.aspx.cs" Inherits="FinalProject.Events.EventsByTag" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

   <asp:SqlDataSource ID="SqlDataSourceTagFilter" runat="server" ConnectionString="<%$ ConnectionStrings:dbaw16abnConnectionString %>" SelectCommand="SELECT DISTINCT [Id], [TagName] FROM [EventTag]"></asp:SqlDataSource>
  

    <br />
       
           <div class="row"><div class="col-md-4>">
       <b>Filter results by existing tag</b>
               </div>
       <asp:CheckBoxList ID="SelectTagFilter" runat="server" DataSourceID="SqlDataSourceTagFilter" DataTextField="TagName" DataValueField="Id" RepeatDirection="Horizontal">
        </asp:CheckBoxList>
        </div>
    <asp:Button ID="btnFilterTags" runat="server" Text="Search" OnClick="btnFilterTags_Click" />

             <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="EventId" DataSourceID="SqlDataSourceFilterTags">
            <Columns>
                <asp:BoundField DataField="EventId" HeaderText="EventId" InsertVisible="True" ReadOnly="True" SortExpression="EventId" Visible="False" />
                <asp:BoundField DataField="Title" HeaderText="Title" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:ImageField DataAlternateTextField="Image" DataImageUrlField="Image" HeaderText="Image"> 
                 <%--   <ItemStyle Wrap="True" Height="100px" Width="150px" />--%>

<ControlStyle Height="500px" Width="375px" CssClass="gridImage"></ControlStyle>

                </asp:ImageField>
                <asp:HyperLinkField DataNavigateUrlFields="EventId" DataNavigateUrlFormatString="EventDetail.aspx?EventId={0}" Text="EventDetails" />
            </Columns>
        </asp:GridView>



        <asp:SqlDataSource ID="SqlDataSourceFilterTags" runat="server" ConnectionString="<%$ ConnectionStrings:dbaw16abnConnectionString %>" SelectCommand="SELECT DISTINCT [Description], [Image], [EventId], [Title], [TagName] FROM [vwEventAndTags] WHERE ([TagName] = @TagName)">
            <SelectParameters>
                <asp:QueryStringParameter Name="TagName" QueryStringField="Tag" Type="String" />
            </SelectParameters>
          </asp:SqlDataSource>


</asp:Content>
