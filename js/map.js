var markers = [
   <asp:Repeater ID="rptMarkers" runat="server">
   <ItemTemplate>
            {
                "times": '<%# Eval("times") %>',
                "lat": '<%# Eval("latitude") %>',
                "lng": '<%# Eval("longitude") %>',
                "dep": '<%# Eval("depth") %>',
                "magni": '<%# Eval("magnitude") %>',
                "magtype": '<%# Eval("mag_type") %>',
                
                
                //"place": '<%# Eval("placer") %>'
                
                
                "typo": '<%# Eval("type") %>',
               
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
            center: new google.maps.LatLng(-20.300000000000000000, 57.583333300000050000),
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
                map: map,
                title: "Magnitude:"+data.magni,

                icon: icons

            });
            (function (marker, data) {
                google.maps.event.addListener(marker, "click", function (e) {
                    infoWindow.setContent("Time:" + data.times + "<br/>" + //"Place:" + data.placee + 
                    "," + "<br/>" + "Magnitude:" + data.magni + "," + "<br/>" + "Magnitude Type:" + data.magtype + "," + "<br/>" + "Depth:" + data.dep + "," + "\n" + data.typo);
                    infoWindow.open(map, marker);
                });
            })(marker, data);
        }
    }