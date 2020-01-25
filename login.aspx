<%@ Page Title="" Language="VB" MasterPageFile="~/client.master" AutoEventWireup="false" CodeFile="login.aspx.vb" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
            .auto-style2 {
            color: #FF0000;
        }
           .auto-style31 {
            text-align: center;
            background-color: #999999;
            width: 264px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="row">
        <div class="col-sm-6 text-center">
            <table>
                <tr>
                    <th class="auto-style31"></th>
                    <th class="auto-style31">Login</th>
                    <th class="auto-style31"></th>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td ></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="LabelUser" runat="server" Text="User Name:"></asp:Label>
                    </td>
                    <td >
                        <asp:TextBox ID="txtuser" runat="server"></asp:TextBox>
                    </td>
                    <td >
                        <asp:RequiredFieldValidator ID="ValidUser" runat="server" ErrorMessage="*User Name is required" ControlToValidate="txtuser" CssClass="auto-style2"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                 </tr>
                <tr>
                    <td >
                        <asp:Label ID="Labelpass" runat="server" Text="Password:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtpass" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                    <td >
                        <asp:RequiredFieldValidator ID="ValidPass" runat="server" ErrorMessage="*Password is required" ControlToValidate="txtpass" CssClass="auto-style2"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                 <tr>
                    <td ></td>
                    <td>
                        <asp:Label ID="lblmg" runat="server"></asp:Label>
                    </td>
                    <td >&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style31"></td>
                    <td class="auto-style31">
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit " Width="94px" /></td>
                    <td class="auto-style31">
                        <asp:HyperLink ID="password" runat="server" NavigateUrl="~/recovery.aspx">Forgot password</asp:HyperLink></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>

