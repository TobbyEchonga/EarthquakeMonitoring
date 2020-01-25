<%@ Page Title="" Language="VB" MasterPageFile="~/client.master" AutoEventWireup="false" CodeFile="registration.aspx.vb" Inherits="registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .auto-style31 {
            text-align: center;
            background-color: #999999;
            width: 264px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <table>
        <tr>
            <th class="auto-style31"></th>
            <th class="auto-style31">Registration</th>
            <th class="auto-style31"></th>
        </tr>
        <tr>
            <td></td>
            <td ></td>
            <td></td>
        </tr>
        <tr>
            <td >First Name<asp:Label ID="Label1" runat="server" Text="*" ForeColor="red"></asp:Label>
            </td>
            <td >
                <asp:TextBox ID="txtuser" runat="server" Width="201px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="ValidateFname" runat="server" ErrorMessage="First Name is required" ControlToValidate="txtuser" ForeColor="Red" ></asp:RequiredFieldValidator></td>
        </tr>
         <tr>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td >Last Name<asp:Label ID="Label2" runat="server" Text="*" ForeColor="red"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtlname" runat="server" Width="201px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="ValidateLname" runat="server" ErrorMessage="Last Name is required" ControlToValidate="txtlname" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>Email<asp:Label ID="Label5" runat="server" Text="*" ForeColor="red"></asp:Label>
            </td>
            <td >
                <asp:TextBox ID="txtemail" runat="server" TextMode="Email" Width="201px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="ValidateEmail" runat="server" ControlToValidate="txtemail"
                    ErrorMessage="Please enter a valid email address"
                    ValidationExpression="^[a-z A-Z 1-9]{1,6}@[a-z]{4,6}.[com,co,ug.mu,uk]$" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
            </td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td >Password<asp:Label ID="Label3" runat="server" Text="*" ForeColor="red"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtpass" runat="server" TextMode="Password" Width="201px"></asp:TextBox>

            </td>
            <td>
                <asp:RequiredFieldValidator ID="ValidatePass" runat="server" ErrorMessage="Password is required"  ControlToValidate="txtpass" ForeColor="Red" ></asp:RequiredFieldValidator>
                <asp:RangeValidator ID="rangePass" runat="server" ErrorMessage="Password must be more than 7 characters" MaximumValue="7" MinimumValue="12" ForeColor="Red" ControlToValidate="txtpass"  ></asp:RangeValidator>
            </td>
        </tr>
        <tr>
            <td></td>
            <td ></td>
            <td></td>
        </tr>
        <tr>
            <td>Confirm Password<asp:Label ID="Label4" runat="server" Text="*" ForeColor="red"></asp:Label>
            </td>
            <td >
                <asp:TextBox ID="txtRpass" runat="server"  TextMode="Password" Width="198px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="ValidateRpass" runat="server" ErrorMessage="Confirm password is required" CssClass="auto-style15" ControlToValidate="txtRpass" ForeColor="Red" Width="208px"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareRpass" runat="server" ErrorMessage="Both passwords must be the same " ControlToValidate="txtRpass" CssClass="auto-style15" ForeColor="Red" ControlToCompare="txtpass" Width="298px"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td ></td>
            <td>
                <asp:Label ID="lblconfm" runat="server"></asp:Label>
            </td>
            <td></td>
        </tr>
        <tr>
            <td class="auto-style31"></td>
            <td class="auto-style31">
                <asp:Button ID="btnsave" runat="server" Text="Save" Width="88px" />
            </td>
            <td class="auto-style31">
                <asp:Button ID="btnclear" runat="server" Text="Clear" Width="87px" />
            </td>
        </tr>
    </table>
    <br />
    <br />
    <br />
    <br />
    <br />

</asp:Content>

