<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Photos.aspx.cs" Inherits="FinalProject.Photos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

     

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbaw16abnConnectionString %>" 
            SelectCommand="SELECT [Id], [Title], [Description], [DateOfPublication], [Author], [PDF]  FROM [vwPhotoPlusRatings]"></asp:SqlDataSource>
         <asp:ListView ID="PhotoList" runat="server" DataKeyNames="Id" DataSourceID="SqlDataSource1">
             <AlternatingItemTemplate>
                 <%--<li style="background-color: #FFF8DC;">Id:--%>
                      <b>Title: 
                     <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                          </b>
                     <br />
                      <i> Description:
                     <div style="border: 2px solid">
                     <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                         </i>
                         </div>
                     <br />
                     DateOfPublication:
                     <asp:Label ID="DateOfPublicationLabel" runat="server" Text='<%# Eval("DateOfPublication") %>' />
                     <br />             
                     Author:
                     <asp:Label ID="AuthorLabel" runat="server" Text='<%# Eval("Author") %>' />
                     <br />
                     <a href="Detail.aspx?PhotoId=<%# Eval("Id") %>">More Details</a>
                     <br />
                     <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("PDF") %>' height="500" width="600"/>
                     <br />
                     
                     
                 </li>
             </AlternatingItemTemplate>
             <EditItemTemplate>
                <%-- <li style="background-color: #008A8C;color: #FFFFFF;">Id--%>:
                     Title:
                     <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                     <br />
                       Description:
                     <div style="border: 2px solid">
                     <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                         </div>
                     <br />
                     DateOfPublication:
                     <asp:Label ID="DateOfPublicationLabel" runat="server" Text='<%# Eval("DateOfPublication") %>' />
                     <br />             
                     Author:
                     <asp:Label ID="AuthorLabel" runat="server" Text='<%# Eval("Author") %>' />
                     <br />
                     PDF:
                     <asp:Label ID="PDFLabel" runat="server" Text='<%# Eval("PDF") %>' />
                     <br />
                     <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                     <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                 </li>
             </EditItemTemplate>
             <EmptyDataTemplate>
                 No data was returned.
             </EmptyDataTemplate>
             <InsertItemTemplate>
                 <li style="">DateOfPublication:
                     <asp:TextBox ID="DateOfPublicationTextBox" runat="server" Text='<%# Bind("DateOfPublication") %>' />
                     <br />Title:
                     <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
                     <br />Author:
                     <asp:TextBox ID="AuthorTextBox" runat="server" Text='<%# Bind("Author") %>' />
                     <br />PDF:
                     <asp:TextBox ID="PDFTextBox" runat="server" Text='<%# Bind("PDF") %>' />
                     <br />Description:
                     <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' />
                     <br />
                     <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                     <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                 </li>
             </InsertItemTemplate>
             <ItemSeparatorTemplate>
<br />
             </ItemSeparatorTemplate>
             <ItemTemplate>
                <%--<li style="background-color: #FFF8DC;">Id:--%>
                      <b>Title: 
                     <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                          </b>
                     <br />
                      <i> Description:
                     <div style="border: 2px solid">
                     <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                         </i>
                         </div>
                     <br />
                     DateOfPublication:
                     <asp:Label ID="DateOfPublicationLabel" runat="server" Text='<%# Eval("DateOfPublication") %>' />
                     <br />             
                     Author:
                     <asp:Label ID="AuthorLabel" runat="server" Text='<%# Eval("Author") %>' />
                     <br />
                     <a href="Detail.aspx?PhotoId=<%# Eval("Id") %>">More Details</a>
                     <br />
                     <%--<img src='<%#Eval("PDF") %>'height="500" width="600"> --%>
                 <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("PDF") %>' height="500" width="600"/>
                     <br />
                   
                     
                 </li>
             </ItemTemplate>
             <LayoutTemplate>
                 <ul id="itemPlaceholderContainer" runat="server" style="font-family: Verdana, Arial, Helvetica, sans-serif;">
                     <li runat="server" id="itemPlaceholder" />
                 </ul>
                 <div style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                 </div>
             </LayoutTemplate>
             <SelectedItemTemplate>
                 <%--<li style="background-color: #008A8C;font-weight: bold;color: #FFFFFF;">Id:--%>
                     <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                     <br />
                     DateOfPublication:
                     <asp:Label ID="DateOfPublicationLabel" runat="server" Text='<%# Eval("DateOfPublication") %>' />
                     <br />
                     Title:
                     <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                     <br />
                     Author:
                     <asp:Label ID="AuthorLabel" runat="server" Text='<%# Eval("Author") %>' />
                     <br />
                     PDF:
                     <asp:Label ID="PDFLabel" runat="server" Text='<%# Eval("PDF") %>' />
                     <br />
                     Description:
                     <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                     <br />
                 </li>
             </SelectedItemTemplate>
     </asp:ListView>

         <div style =" float:right">
     <asp:DataPager ID="DataPager1" runat="server" PageSize="5" PagedControlID="PhotoList">
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
