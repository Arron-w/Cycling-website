<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewEvents.aspx.cs" Inherits="FinalProject.Events.ViewEvents" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

     
    <asp:SqlDataSource ID="SqlDataSourceEvent" runat="server" ConnectionString="<%$ ConnectionStrings:dbaw16abnConnectionString %>" 
            SelectCommand="SELECT [EventId], [Image], [Title], [EventDate], [Location] FROM [vwEventPlusRatings]"></asp:SqlDataSource>

    
         <asp:ListView ID="EventList" runat="server" DataSourceID="SqlDataSourceEvent">
             <AlternatingItemTemplate>
                  
                   <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Image") %>' Height="250px" Width="300px" />
                     <br />             
                     Title:
                     <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                     <br />
                     EventDate:
                     <asp:Label ID="EventDateLabel" runat="server" Text='<%# Eval("EventDate") %>' />
                     <br />
                     Location:
                     <asp:Label ID="LocationLabel" runat="server" Text='<%# Eval("Location") %>' />
                     <br />
                     <a href="EventDetail.aspx?EventId=<%# Eval("EventId") %>">More Details</a>
                    <!-- <br />
                       <input value="<!--%# Eval("AverageScore") %>" type="number" class="rating" min="0" max="5" step="0.2" data-size="md" data-readonly="true" />
                     <br /> -->
                     
                 </li>
             </AlternatingItemTemplate>
             <EditItemTemplate>
                 <li style="">
                     <asp:TextBox ID="ImageTextBox" runat="server" Text='<%# Bind("Image") %>' />
                     <br />
                     Title:
                     <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
                     <br />
                       EventDate:
                     <asp:TextBox ID="EventDateTextBox" runat="server" Text='<%# Bind("EventDate") %>' />
                     <br />
                     Location:
                     <asp:TextBox ID="LocationTextBox" runat="server" Text='<%# Bind("Location") %>' />
                     <br />
                     <a href="EventDetail.aspx?EventId=<%# Eval("EventId") %>">More Details</a>
                     <br />
                     <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                     <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                 </li>
             </EditItemTemplate>
             <EmptyDataTemplate>
                 No data was returned.
             </EmptyDataTemplate>
             <InsertItemTemplate>
                 <li style="">
                     <asp:TextBox ID="ImageTextBox" runat="server" Text='<%# Bind("Image") %>' />
                     <br />Title:
                     <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
                     <br />EventDate:
                     <asp:TextBox ID="EventDateTextBox" runat="server" Text='<%# Bind("EventDate") %>' />
                     <br />Location:
                     <asp:TextBox ID="LocationTextBox" runat="server" Text='<%# Bind("Location") %>' />
                     <br />
                     <a href="EventDetail.aspx?EventId=<%# Eval("EventId") %>">More Details</a>
                     <br />
                     <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                     <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                 </li>
             </InsertItemTemplate>
             <ItemSeparatorTemplate>
<br />
             </ItemSeparatorTemplate>
             <ItemTemplate>
                
                     <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Image") %>' Height="250px" Width="300px"/>
                     <br /> 
                     Title:
                    <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                     <br />
                      EventDate:
                    <asp:Label ID="EventDateLabel" runat="server" Text='<%# Eval("EventDate") %>' />
                     <br />
                     Location:
                    <asp:Label ID="LocationLabel" runat="server" Text='<%# Eval("Location") %>' />
                    <br />
                     <a href="EventDetail.aspx?EventId=<%# Eval("EventId") %>">More Details</a>
                     <br />
                 <!--
                      <input value="<!-%# Eval("AverageScore") %>" type="number" class="rating" min="0" max="5" step="0.2" data-size="md" data-readonly="true" />
                     <br /> -->
                 
                     
                 </li>
             </ItemTemplate>
             <LayoutTemplate>
                 <ul id="itemPlaceholderContainer" runat="server" style="">
                     <li runat="server" id="itemPlaceholder" />
                 </ul>
                 <div style="">
                 </div>
             </LayoutTemplate>
             <SelectedItemTemplate>
                 <li style="">
                     <asp:Label ID="ImageLabel" runat="server" Text='<%# Eval("Image") %>' />
                     <br />
                     Title:
                     <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                     <br />
                     EventDate:
                     <asp:Label ID="EventDateLabel" runat="server" Text='<%# Eval("EventDate") %>' />
                     <br />
                     Location:
                     <asp:Label ID="LocationLabel" runat="server" Text='<%# Eval("Location") %>' />
                     <br />
                     <a href="EventDetail.aspx?EventId=<%# Eval("EventId") %>">More Details</a>
                     <br />
                 </li>
             </SelectedItemTemplate>
     </asp:ListView>

         <div style =" float:right">
     <asp:DataPager ID="DataPager1" runat="server" PageSize="5" PagedControlID="EventList">
         <Fields>
             <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
         </Fields>
     </asp:DataPager>
             </div>

    
    <p>


        &nbsp;</p>
    <p>


     
    <p>


        &nbsp;</p>
</asp:Content>
