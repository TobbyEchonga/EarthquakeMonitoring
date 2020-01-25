<%@ Page Title="" Language="VB" MasterPageFile="~/client.master" AutoEventWireup="false" CodeFile="client1.aspx.vb" Inherits="client1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style type="text/css">
        .content{
  
            margin-left:auto;
            border:solid;
            max-width :400px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">

    <div class="jumbotron">
        <asp:Image runat="server" ImageUrl="Images/ear.jpg" ImageAlign="Top" Width="100%" Height="300px" />
    </div>

    <div class="row">
        <div class="col-md-6">
            <h2>Earthquake</h2>
            <p>
                An earthquake is what happens when two blocks of the earth suddenly
                 slip past one another. The surface where they slip is called the fault 
                or fault plane. The location below the earth’s surface where the earthquake 
                starts is called the hypocenter, and the location directly above it on the 
                surface of the earth is called the epicenter. 
            </p>
            <p>
                At the Earth's surface, earthquakes manifest themselves by shaking and
                 sometimes displacement of the ground. When the epicenter of a large 
                earthquake is located offshore, the seabed may be displaced sufficiently
                 to cause a tsunami. Earthquakes can also trigger landslides, and occasionally volcanic activity.
            </p>
            <p>
                In its most general sense, the word earthquake is used to describe any 
                seismic event — whether natural or caused by humans — that generates 
                seismic waves. Earthquakes are caused mostly by rupture of geological 
                faults, but also by other events such as volcanic activity, landslides,
                 mine blasts, and nuclear tests. An earthquake's point of initial rupture
                 is called its focus or hypocenter. The epicenter is the point at ground level directly above the hypocenter
            </p>
            <p>
                <a class="btn btn-default" href="https://earthquake.usgs.gov/learn/kids/eqscience.php">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-6">
            <h2>Simple demo</h2>
            <p>
                <asp:Image runat="server" ImageUrl="~/Images/d.jpg" Height="489px" Width="580px" />
            </p>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="content">
                    <h3>Comment</h3>
                    <table >
                        <tr>
                            <td></td>

                            <td>Name</td>
                            <td>
                                <asp:TextBox ID="txtname" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td></td>

                            <td>Email</td>
                            <td>
                                <asp:TextBox ID="txtemail" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                Comment
                            </td>
                            <td>
                                <asp:TextBox ID="txtcomm" runat="server" Height="77px" Width="152px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td>
                                <asp:Button ID="btncomment" runat="server" Text="Send" />
                            </td>
                        </tr>
                    </table>
                </div>                 
            </div>
        </div>
    </div>
    <br />
    <br />
    <br />
</asp:Content>

