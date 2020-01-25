<%@ Page Title="" Language="VB" MasterPageFile="~/admin.master" AutoEventWireup="false" CodeFile="adminupload.aspx.vb" Inherits="adminupload" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        body
        {
            font-family: Arial;
            font-size: 10pt;
        }
        table
        {
            border: 2px solid black;
        }
        table th
        {           
            color: #333;
            font-weight: bold;
        }
        table th, table td
        {
            padding: 4px 4px;            
            border: 2px solid Gray;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <h3 style="align-content: center;">Upload Xml</h3>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="row">
                    &nbsp;
                    &nbsp;
                    &nbsp;
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                    <br />
                    <asp:Button ID="btn_upload" Text="All day" runat="server" />
                    &nbsp;
                    &nbsp;
                    &nbsp;
                    <asp:Button ID="btn_month" Text="All month" runat="server" />
                    <br />
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                    <div class="col-md-12">
                        <fieldset style="width: 200px">
                            <legend>All day update</legend>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <asp:Button ID="btnSubmit" runat="server" Text="update all day" />
                                    <br />
                                    <asp:Label ID="lblStatus"
                                        runat="server" Text=""></asp:Label>
                                    <asp:UpdateProgress ID="UpdWaitImage" runat="server" DynamicLayout="true" AssociatedUpdatePanelID="UpdatePanel1">
                                        <ProgressTemplate>
                                            <asp:Image ID="imgProgress" ImageUrl="Images/progress.gif" runat="server" />
                                            Please Wait...
                                        </ProgressTemplate>
                                    </asp:UpdateProgress>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </fieldset>

                        <fieldset style="width: 200px">
                            <legend>All month update</legend>
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>
                                    <asp:Button ID="btn_allmonth" runat="server" Text="update all Month" />
                                    <br />
                                    <asp:Label ID="lbl_allmonth"
                                        runat="server" Text=""></asp:Label>
                                    <asp:UpdateProgress ID="UpdateProgress1" runat="server" DynamicLayout="true" AssociatedUpdatePanelID="UpdatePanel2">
                                        <ProgressTemplate>
                                            <asp:Image ID="imgProgress1" ImageUrl="Images/progress.gif" runat="server" />
                                            Please Wait...
                                        </ProgressTemplate>
                                    </asp:UpdateProgress>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </fieldset>
                    </div>
                </div>
                <br />
                <asp:Label ID="lbl_message" runat="server" Text=""></asp:Label>
                <br />
                <br />
                <div class="row">
                    <div class="col-md-12">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                            AllowPaging="True" CellPadding="4" DataSourceID="gdview" ForeColor="#333333"
                            GridLines="None" PageSize="6" AllowSorting="True">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:BoundField DataField="mag" HeaderText="Magnitude"
                                    SortExpression="mag" />
                                <asp:BoundField DataField="place" HeaderText="Place"
                                    SortExpression="place" />
                                <asp:BoundField DataField="time" HeaderText="Times"
                                    SortExpression="time"></asp:BoundField>
                                <asp:BoundField DataField="magType" HeaderText="Mag Type"
                                    SortExpression="magType" />
                                <asp:BoundField DataField="latitude" HeaderText="Latitude"
                                    SortExpression="latitude"></asp:BoundField>
                                <asp:BoundField DataField="longitude" HeaderText="Longitude"
                                    SortExpression="longitude"></asp:BoundField>
                                <asp:BoundField DataField="depth" HeaderText="Depth"
                                    SortExpression="depth" />
                            </Columns>
                            <EditRowStyle BackColor="#999999" />
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#E9E7E2" />
                            <SortedAscendingHeaderStyle BackColor="#506C8C" />
                            <SortedDescendingCellStyle BackColor="#FFFDF8" />
                            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="gdview" runat="server"
                            ConnectionString="<%$ ConnectionStrings:conn %>"
                            SelectCommand="SELECT * FROM [tbl_day]"></asp:SqlDataSource>
                        <br />
                        <br />
                        <br />
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False"
                            AllowPaging="True" CellPadding="4" DataSourceID="gdview2"
                            GridLines="None" PageSize="6" ForeColor="#333333">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="mag" HeaderText="Magitude"
                                    SortExpression="mag" />
                                <asp:BoundField DataField="place" HeaderText="Place"
                                    SortExpression="place" />
                                <asp:BoundField DataField="time" HeaderText="Time"
                                    SortExpression="time"></asp:BoundField>
                                <asp:BoundField DataField="magType" HeaderText="Mag Type"
                                    SortExpression="magType" />
                                <asp:BoundField DataField="latitude" HeaderText="Latitude"
                                    SortExpression="latitude"></asp:BoundField>
                                <asp:BoundField DataField="longitude" HeaderText="Longitude"
                                    SortExpression="longitude"></asp:BoundField>
                                <asp:BoundField DataField="depth" HeaderText="Depth"
                                    SortExpression="depth" />
                            </Columns>
                            <FooterStyle BackColor="#990000" ForeColor="White" Font-Bold="True" />
                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                            <SortedAscendingCellStyle BackColor="#FDF5AC" />
                            <SortedAscendingHeaderStyle BackColor="#4D0000" />
                            <SortedDescendingCellStyle BackColor="#FCF6C0" />
                            <SortedDescendingHeaderStyle BackColor="#820000" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="gdview2" runat="server"
                            ConnectionString="<%$ ConnectionStrings:conn %>"
                            SelectCommand="SELECT * FROM [tbl_month]"></asp:SqlDataSource>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
