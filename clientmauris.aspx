<%@ Page Title="" Language="VB" MasterPageFile="~/client.master" AutoEventWireup="false" CodeFile="clientmauris.aspx.vb" Inherits="clientmauris" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="https://maps.googleapis.com/maps/api/js?v=3.11&key=AIzaSyAVEK0lAmZr7rNgyRtj0KhRFwcCgMt9HtE&sensor=false" type="text/javascript"></script>
    <script type="text/javascript">
    var markers = [
    <asp:Repeater ID="rptMarkers" runat="server">
    <ItemTemplate>
             {
                "time":   '<%# Eval("time") %>',
                "lat":    '<%# Eval("latitude") %>',
                "lng":    '<%# Eval("longitude") %>',
                "dep":    '<%# Eval("depth") %>',
                "magni":  '<%# Eval("mag") %>',
                "magtype":'<%# Eval("magType") %>',               
                "place":  '<%# Eval("place") %>'                     
            }
    </ItemTemplate>
    <SeparatorTemplate>
        ,
    </SeparatorTemplate>
    </asp:Repeater>
    ];
    </script>
    <script type="text/javascript">

        window.onload = function () {
            var mapOptions = {
                center: new google.maps.LatLng(-20.20665 , 57.6755),
                zoom: 2,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            var infoWindow = new google.maps.InfoWindow();
            var map = new google.maps.Map(document.getElementById("dvMap"), mapOptions);
            for (i = 0; i < markers.length; i++) {
                var data = markers[i]
                var myLatlng = new google.maps.LatLng(data.lat, data.lng);
                var icons = "";
                if (data.magni <= 2.5) {
                    icons = 'http://maps.google.com/mapfiles/ms/icons/green.png'
                }
                else if (data.magni > 2.5 && data.magni <= 5.4) {
                    icons = 'http://maps.google.com/mapfiles/ms/icons/grey.png'
                }
                else if (data.magni > 5.4 && data.magni <= 6.0) {
                    icons = 'http://maps.google.com/mapfiles/ms/icons/blue.png'
                }
                else if (data.magni > 6.0 && data.magni <= 6.9) {
                    icons = 'http://maps.google.com/mapfiles/ms/icons/yellow.png'
                }
                else if (data.magni > 6.9 && data.magni <= 7.9) {
                    icons = 'http://maps.google.com/mapfiles/ms/icons/orange.png'
                }
                else if (data.magni > 7.9) {
                    icons = 'http://maps.google.com/mapfiles/ms/icons/red.png'
                }

                var marker = new google.maps.Marker({
                    position: myLatlng,
                    animation: google.maps.Animation.BOUNCE,
                    map: map,
                    title: "Magnitude:"+data.magni,

                    icon: icons

                });
                (function (marker, data) {
                    google.maps.event.addListener(marker, "click", function (e) {
                        infoWindow.setContent( 
                        "Place: " + data.place + "," 
                        + "<br/>"  + "Magnitude: "  + data.magni + "," 
                        + "<br/>"  + "Magnitude Type: " + data.magtype + "," 
                        + "<br/>"  + "Depth: " + data.dep 
                     );
                        infoWindow.open(map, marker);
                    });
                })(marker, data);
            }
        }
    </script>
    <script type="text/javascript">

        window.onload = function () {
            var mapOptions = {
                center: new google.maps.LatLng(-20.20665 , 57.6755),
                zoom: 2,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            var infoWindow = new google.maps.InfoWindow();
            var map = new google.maps.Map(document.getElementById("dvMap"), mapOptions);
            for (i = 0; i < markers.length; i++) {
                var data = markers[i]
                var myLatlng = new google.maps.LatLng(data.lat, data.lng);
                var icons = "";
                if (data.magni <= 2.5) {
                    icons = 'http://maps.google.com/mapfiles/ms/icons/green.png'
                }
                else if (data.magni > 2.5 && data.magni <= 5.4) {
                    icons = 'http://maps.google.com/mapfiles/ms/icons/grey.png'
                }
                else if (data.magni > 5.4 && data.magni <= 6.0) {
                    icons = 'http://maps.google.com/mapfiles/ms/icons/blue.png'
                }
                else if (data.magni > 6.0 && data.magni <= 6.9) {
                    icons = 'http://maps.google.com/mapfiles/ms/icons/yellow.png'
                }
                else if (data.magni > 6.9 && data.magni <= 7.9) {
                    icons = 'http://maps.google.com/mapfiles/ms/icons/orange.png'
                }
                else if (data.magni > 7.9) {
                    icons = 'http://maps.google.com/mapfiles/ms/icons/red.png'
                }

                var marker = new google.maps.Marker({
                    position: myLatlng,
                    animation: google.maps.Animation.BOUNCE,
                    map: map,
                    title: "Magnitude:"+data.magni,

                    icon: icons

                });
                (function (marker, data) {
                    google.maps.event.addListener(marker, "click", function (e) {
                        infoWindow.setContent( 
                        "Place: " + data.place + "," 
                        + "<br/>"  + "Magnitude: "  + data.magni + "," 
                        + "<br/>"  + "Magnitude Type: " + data.magtype + "," 
                        + "<br/>"  + "Depth: " + data.dep 
                     );
                        infoWindow.open(map, marker);
                    });
                })(marker, data);
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <h3>Near Indian Ocean</h3>
    <hr />
    <div class="main-head-section">
        <div class="container">
            <h3>Earth Quake Near Mauritius(All WEEK)</h3>
            <div class="account_grid">
                <div class="col-md-6 login-left wow fadeInLeft" data-wow-delay="0.4s">
                    <h3>Legend & effect</h3>
                    <img alt="" src="http://maps.google.com/mapfiles/ms/icons/green.png" />
                    <b>2.5 or less, &nbsp&nbsp Usually not felt, but can be recorded by seismograph.</b><br />
                    <img alt="" src="http://maps.google.com/mapfiles/ms/icons/grey.png" />
                    <b>2.5 to 3.4, &nbsp&nbsp Often felt, but only causes minor damage.</b><br />
                    <img alt="" src="http://maps.google.com/mapfiles/ms/icons/blue.png" />
                    <b>3.5 to 4.0,  &nbsp&nbsp Slight damage to buildings and other structures.</b><br />
                    <img alt="" src="http://maps.google.com/mapfiles/ms/icons/yellow.png" />
                    <b>5.1 to 5.9, &nbsp&nbsp May cause a lot of damage in very populated areas.</b><br />
                    <img alt="" src="http://maps.google.com/mapfiles/ms/icons/orange.png" />
                    <b>6.0 to 7.9, &nbsp&nbsp Major earthquake. Serious damage.</b><br />
                    <img alt="" src="http://maps.google.com/mapfiles/ms/icons/red.png" />
                    <b>8.0 or greater, &nbsp&nbsp Great earthquake. Can totally destroy communities near the epicenter.</b>
                    <br />
                    <a class="acount-btn" href="allweek.aspx">Reload</a>
                </div>
            </div>
            <div id="dvMap" style="width: 500px; height: 500px"></div>
            <div class="clearfix"></div>
        </div>
    </div>
</asp:Content>

