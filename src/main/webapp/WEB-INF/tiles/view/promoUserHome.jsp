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

    <style>
        #map {
            height: 400px;
            width: 100%;
        }
    </style>

</head>
<style>
    .gm-style-iw {
        width: 350px !important;
        top: 15px !important;
        left: 0px !important;
        background-color: #fff;
        box-shadow: 0 1px 6px rgba(178, 178, 178, 0.6);
        border: 1px solid rgba(72, 181, 233, 0.6);
        border-radius: 2px 2px 10px 10px;
    }

    #iw-container {
        margin-bottom: 10px;
    }
    #iw-container .iw-title {
        font-family: 'Open Sans Condensed', sans-serif;
        font-size: 22px;
        font-weight: 400;
        padding: 10px;
        background-color: #48b5e9;
        color: white;
        margin: 0;
        border-radius: 2px 2px 0 0;
    }
    #iw-container .iw-content {
        font-size: 13px;
        line-height: 18px;
        font-weight: 400;
        margin-right: 1px;
        padding: 15px 5px 20px 15px;
        max-height: 140px;
        overflow-y: auto;
        overflow-x: hidden;
    }
    .iw-content img {
        float: right;
        margin: 0 5px 5px 10px;
    }
    .iw-subTitle {
        font-size: 16px;
        font-weight: 700;
        padding: 5px 0;
    }
    .iw-bottom-gradient {
        position: absolute;
        width: 326px;
        height: 25px;
        bottom: 10px;
        right: 18px;
        background: linear-gradient(to bottom, rgba(255,255,255,0) 0%, rgba(255,255,255,1) 100%);
        background: -webkit-linear-gradient(top, rgba(255,255,255,0) 0%, rgba(255,255,255,1) 100%);
        background: -moz-linear-gradient(top, rgba(255,255,255,0) 0%, rgba(255,255,255,1) 100%);
        background: -ms-linear-gradient(top, rgba(255,255,255,0) 0%, rgba(255,255,255,1) 100%);
    }
</style>
<body>

<div id="map"></div>

<script>

    function initMap() {

        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(function(position) {
                var pos = {
                    lat: position.coords.latitude,
                    lng: position.coords.longitude
                };
                alert("Data: "+pos.lat+","+pos.lng);


                map.setCenter(pos);
            }, function() {
                handleLocationError(true, infoWindow, map.getCenter());
            });
        } else {
            // Browser doesn't support Geolocation
            handleLocationError(false, infoWindow, map.getCenter());
        }
        var uluru = {lat:  47.7902237, lng: -122.1772239};
        var map = new google.maps.Map(document.getElementById('map'), {
            zoom: 10,
            center: uluru
        });
        // infoWindow = new google.maps.InfoWindow;
        $.get("http://localhost:8080/promotions/search", function(data, status){
            $.each(data,function (i,promotions) {

                var latlng = new google.maps.LatLng(promotions.ownerLocation.lat, promotions.ownerLocation.lng);
               // alert("Data: "+i+ latlng);
                var marker = new google.maps.Marker({
                    position: latlng,
                    map: map
                });

                google.maps.event.addListener(marker, 'click', function() {
                    var infoWindow = new google.maps.InfoWindow;

                    google.maps.event.addListener(infoWindow, 'domready', function() {

                        // Reference to the DIV that wraps the bottom of infowindow
                        var iwOuter = $('.gm-style-iw');

                        /* Since this div is in a position prior to .gm-div style-iw.
                         * We use jQuery and create a iwBackground variable,
                         * and took advantage of the existing reference .gm-style-iw for the previous div with .prev().
                        */
                        var iwBackground = iwOuter.prev();

                        // Removes background shadow DIV
                        iwBackground.children(':nth-child(2)').css({'display' : 'none'});

                        // Removes white background DIV
                        iwBackground.children(':nth-child(4)').css({'display' : 'none'});

                        // Moves the infowindow 115px to the right.
                        iwOuter.parent().parent().css({left: '115px'});

                        // Moves the shadow of the arrow 76px to the left margin.
                        iwBackground.children(':nth-child(1)').attr('style', function(i,s){ return s + 'left: 76px !important;'});

                        // Moves the arrow 76px to the left margin.
                        iwBackground.children(':nth-child(3)').attr('style', function(i,s){ return s + 'left: 76px !important;'});

                        // Changes the desired tail shadow color.
                        iwBackground.children(':nth-child(3)').find('div').children().css({'box-shadow': 'rgba(72, 181, 233, 0.6) 0px 1px 6px', 'z-index' : '1'});

                        // Reference to the div that groups the close button elements.
                        var iwCloseBtn = iwOuter.next();

                        // Apply the desired effect to the close button
                        iwCloseBtn.css({opacity: '1', right: '38px', top: '3px', border: '7px solid #48b5e9', 'border-radius': '13px', 'box-shadow': '0 0 5px #3990B9'});



                        // The API automatically applies 0.7 opacity to the button after the mouseout event. This function reverses this event to the desired value.
                        iwCloseBtn.mouseout(function(){
                            $(this).css({opacity: '1'});
                        });
                    });
                    var content = '<div id="iw-container">' +
                        '<div class="iw-title">'+promotions.promotionDescription+'</div>' +
                        '<div class="iw-content">' +
                        '<div class="iw-subTitle">History</div>' +
                        '<img src="images/vistalegre.jpg" alt="Porcelain Factory of Vista Alegre" height="115" width="83">' +
                        '<p></p>' +
                        '<div class="iw-subTitle">Contacts</div>' +
                        '<p><br>'+
                        '<br>Phone. +351 234 320 600<br>e-mail: geral@vaa.pt<br>www: www.myvistaalegre.com</p>'+
                        '</div>' +
                        '<div class="iw-bottom-gradient"></div>' +
                        '</div>';
                    infoWindow.setContent(content);
                    infoWindow.open(map, marker);


                });
            })

        });
    }
</script>
<script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAlHTuGOT_CQSVDNMlA4_MmyyyNhaULVy0&callback=initMap">
</script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</body>
</html>
