<%@ Page Title="" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeFile="Checkout.aspx.cs" Inherits="Checkout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
  <div class="container row table-title">
    <h2 class="col-sm-12 text-center">CD Checkout Database</h2>
    <br />
    <br />
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSourceCDALL" DataKeyNames="">
      <ItemTemplate>
        <tr class="item-row">
          <td>
            <asp:Label Text='<%# Eval("CD_ID") %>' runat="server" ID="CD_IDLabel" /></td>
          <td>
            <asp:Label Text='<%# Eval("title") %>' runat="server" ID="titleLabel" /></td>
          <td>
            <asp:Label Text='<%# Eval("borrower") %>' runat="server" ID="borrowerLabel" /></td>
          <td>
            <asp:Label Text='<%# Eval("borrower_ID") %>' runat="server" ID="borrower_IDLabel" /></td>
          <td>
            <asp:Label Text='<%# Eval("borrowed_date", "{0:d}") %>' runat="server" ID="borrowed_dateLabel" /></td>
          <td>
            <asp:Label Text='<%# Eval("status") %>' runat="server" ID="statusLabel" /></td>
          <td>
            <asp:Button runat="server" CommandName="Edit" Text="Edit" ID="EditButton" CssClass="btn btn-primary" CausesValidation="False" />
          </td>
        </tr>
      </ItemTemplate>
      <AlternatingItemTemplate>
        <tr class="item-row">
          <td>
            <asp:Label Text='<%# Eval("CD_ID") %>' runat="server" ID="CD_IDLabel" /></td>
          <td>
            <asp:Label Text='<%# Eval("title") %>' runat="server" ID="titleLabel" /></td>
          <td>
            <asp:Label Text='<%# Eval("borrower") %>' runat="server" ID="borrowerLabel" /></td>
          <td>
            <asp:Label Text='<%# Eval("borrower_ID") %>' runat="server" ID="borrower_IDLabel" /></td>
          <td>
            <asp:Label Text='<%# Eval("borrowed_date", "{0:d}") %>' runat="server" ID="borrowed_dateLabel" /></td>
          <td>
            <asp:Label Text='<%# Eval("status") %>' runat="server" ID="statusLabel" /></td>
          <td>
            <asp:Button runat="server" CommandName="Edit" Text="Edit" ID="EditButton" CssClass="btn btn-primary" CausesValidation="False" />
          </td>
        </tr>
      </AlternatingItemTemplate>
      <EditItemTemplate>
        <tr class=""> 
          <td>
            <asp:Label Text='<%# Bind("CD_ID")%>' runat="server" ID="CD_IDLabel" /> <br />
          </td>
          <td>
            <asp:Label Text='<%# Bind("title")%>' runat="server" ID="titleLabel" /> <br />
          </td>
          <td>
            <asp:Label Text='<%# Bind("borrower")%>' runat="server" ID="borrowerLabel" /> <br />
          </td>
          <td>
            <asp:TextBox Text='<%# Bind("borrower_ID") %>' runat="server" ID="borrower_IDTextBox" /> <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required" ControlToValidate="borrower_IDTextBox" Display="Dynamic" CssClass="edit_error"></asp:RequiredFieldValidator>
              <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Must be between 1 and 21" ControlToValidate="borrower_IDTextBox" CssClass="edit_error" MaximumValue="22" MinimumValue="1" Type="Integer" Display="Dynamic"></asp:RangeValidator>
            </td>
          <td>
            <asp:TextBox Text='<%# Bind("borrowed_date", "{0:d}") %>' runat="server" ID="borrowed_dateTextBox" /> <br />
              <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Required" ControlToValidate="borrowed_dateTextBox" Display="Dynamic" CssClass="edit_error"></asp:RequiredFieldValidator>
              <asp:RangeValidator ID ="rvDate" runat ="server" ControlToValidate="borrowed_dateTextBox" ErrorMessage="Invalid Date" Type="Date" MinimumValue="01/01/1900" MaximumValue="01/01/2100" Display="Dynamic"></asp:RangeValidator>
            </td>
          <td>
            <asp:TextBox Text='<%# Bind("status") %>' runat="server" ID="statusTextBox" /><br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required" ControlToValidate="statusTextBox" Display="Dynamic" CssClass="edit_error"></asp:RequiredFieldValidator>
              <asp:RangeValidator ID="RangeValidator2" runat="server" ErrorMessage="Must be Borrowed or In Library" ControlToValidate="statusTextBox" CssClass="edit_error" MaximumValue="In Library" MinimumValue="Borrowed" Type="String" Display="Dynamic"></asp:RangeValidator>
          </td>
          <td>
              <asp:Button runat="server" CommandName="Update" Text="Update" ID="UpdateButton" OnClick="UpdateButton_Click" CausesValidation="False" />
            <asp:Button runat="server" CommandName="Cancel" Text="Cancel" ID="CancelButton" CssClass="btn btn-primary" CausesValidation="False" />
          </td>
        </tr>
      </EditItemTemplate>
      <EmptyDataTemplate>
        <table runat="server" style="">
          <tr>
            <td>No data was returned.</td>
          </tr>
        </table>
      </EmptyDataTemplate>
      <LayoutTemplate>
        <table runat="server" class="col-sm-12">
          <tr runat="server">
            <td runat="server">
              <table id="itemPlaceholderContainer" class="table table-bordered table-responsive table-striped">
                <tr runat="server" style="">
                  <th runat="server">CD ID</th>
                  <th runat="server">Title</th>
                  <th runat="server">Last Borrower</th>
                  <th runat="server">Borrower ID</th>
                  <th runat="server">Borrowed Date</th>
                  <th runat="server">Status</th>
                  <th runat="server"></th>
                </tr>
                <tr runat="server" id="itemPlaceholder"></tr>
              </table>
            </td>
          </tr>
          <tr runat="server">
            <td runat="server" style="padding-bottom: 20px; text-align: center;">
              <asp:DataPager runat="server" ID="DataPager1"  PageSize="15">
                <Fields>
                  <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" ButtonCssClass="btn btn-primary" ></asp:NextPreviousPagerField>
                </Fields>
              </asp:DataPager>
            </td>
          </tr>
        </table>
      </LayoutTemplate>
      <SelectedItemTemplate>
        <tr style="">
          <td>
            <asp:Button runat="server" CommandName="Delete" Text="Delete" ID="DeleteButton" />
            <asp:Button runat="server" CommandName="Edit" Text="Edit" ID="EditButton" />
          </td>
          <td>
            <asp:Label Text='<%# Eval("CD_ID") %>' runat="server" ID="CD_IDLabel" /></td>
          <td>
            <asp:Label Text='<%# Eval("title") %>' runat="server" ID="titleLabel" /></td>
          <td>
            <asp:Label Text='<%# Eval("borrower") %>' runat="server" ID="borrowerLabel" /></td>
          <td>
            <asp:Label Text='<%# Eval("borrower_ID") %>' runat="server" ID="borrower_IDLabel" /></td>
          <td>
            <asp:Label Text='<%# Eval("borrowed_date", "{0:d}") %>' runat="server" ID="borrowed_dateLabel" /></td>
          <td>
            <asp:Label Text='<%# Eval("status") %>' runat="server" ID="statusLabel" /></td>
          <td>
        </tr>
      </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource runat="server" ID="SqlDataSourceCDALL" ConnectionString='<%$ ConnectionStrings:disk_inventoryConnectionString %>' 
      SelectCommand="SELECT CD_Borrowed.CD_ID, CD_Borrowed.Borrower_ID, CD_borrowed.borrowed_date, CD.status, CD.title, 
                     borrower.first_name + ' ' + borrower.last_name AS 'Borrower'
                     FROM CD_borrowed
                     JOIN borrower ON borrower.borrower_ID = CD_borrowed.borrower_ID
                     JOIN CD ON CD.CD_ID = CD_borrowed.CD_ID" 
      UpdateCommand="EXEC spUpdateBorrowed @CD_ID, @Borrower_ID, @borrowed_date, @status">
      <UpdateParameters>
        <asp:Parameter Name="CD_ID" Type="Int32"></asp:Parameter>
        <asp:Parameter Name="Borrower_ID" Type="Int32"></asp:Parameter>
        <asp:Parameter Name="borrowed_date" Type="String"></asp:Parameter>
        <asp:Parameter Name="status" Type="String"></asp:Parameter>
      </UpdateParameters>
    </asp:SqlDataSource>
  </div>
</asp:Content>