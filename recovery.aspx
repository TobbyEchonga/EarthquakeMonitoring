<%@ Page Title="" Language="VB" MasterPageFile="~/client.master" AutoEventWireup="false" CodeFile="recovery.aspx.vb" Inherits="recovery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
body {
    background: #555;
}

.content {
    max-width: 500px;
    margin: auto;
    background: white;
    padding: 10px;
}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="container">
        ,<div class="row">
            <div class="col-lg-12">
                <div class="content">
                    Email Address:
                     <asp:TextBox ID="txtEmail" runat="server" Width="250" />
                    <br />
                    <asp:Label ID="lblMessage" runat="server" />
                    <br />
                    <asp:Button Text="Send" runat="server" OnClick="SendEmail" />
                </div>
            </div>
         </div>
    </div>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>

