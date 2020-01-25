<%@ Page Title="" Language="VB" MasterPageFile="~/admin.master" AutoEventWireup="false" CodeFile="admincomment.aspx.vb" Inherits="admincomment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">

    <asp:GridView ID="gvCustomers" runat="server" AutoGenerateColumns="false">
        <Columns>
            <asp:BoundField DataField="name" HeaderText="Name" ItemStyle-Width="150px" />
            <asp:BoundField DataField="email" HeaderText="Email" ItemStyle-Width="100px" />
            <asp:BoundField DataField="comment" HeaderText="Comment" ItemStyle-Width="100px" />
        </Columns>
    </asp:GridView>
    <br />

</asp:Content>

