<%--
  Created by IntelliJ IDEA.
  User: skvpsid
  Date: 1/7/2018
  Time: 12:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link type="text/css" href="css/layout.css" media="screen" rel="stylesheet" />



    <script src="js/map.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <style>

        html, body, #map{
            margin: 0;
            padding: 0;
            height: 100%;
        }
        .map{
            height: 400px;
            width:100%;
        }

    </style>
</head>

<body>
<script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAlHTuGOT_CQSVDNMlA4_MmyyyNhaULVy0&callback=initMap">
</script>
<div id="map"></div>

<script>
    var markersArray = [];
    var map;
    var url ="https://promoprofiler.cfapps.io/promotions/search";

    function initMap() {
        createMapOptions();
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(function(position) {
                var pos = {
                    lat: position.coords.latitude,
                    lng: position.coords.longitude
                };
              //  alert("Data: "+pos.lat+","+pos.lng);


                map.setCenter(pos);
            }, function() {
                handleLocationError(true, infoWindow, map.getCenter());
            });
        } else {
            // Browser doesn't support Geolocation
            handleLocationError(false, infoWindow, map.getCenter());
        }

        $.get("https://promoprofiler.cfapps.io/promotions/search", function(data, status){
            displayMarkers(data);
          /*  $.each(data,function (i,promotions) {

                var latlng = new google.maps.LatLng(promotions.ownerLocation.lat, promotions.ownerLocation.lng);
                displayMarkers(promotions);



            })*/

        });
    }

</script>

</body>
</html>
