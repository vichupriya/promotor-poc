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
            height: 1000px;
            width: 100%;
        }
    </style>

</head>
<style>
    html{ width:100%; height:100%; overflow-y: hidden;  overflow-x: hidden}
    body{ width:100%; height:100%; overflow-y: hidden;  overflow-x: hidden}



    #firstHeading
    {
        text-align: center;
        font-family:Verdana;

        color: #ffffff;
        padding: 5px 0px 5px 5px;
        border: solid 2px #9E9E9C;//#154893;
        background-color: #E0960E;
    //#3e6cb1 --blue
    }

    #findHeading,#ColorLegend,#infoHeading
    {
        text-align: center;
        font-family:Verdana;
        font-size: 14px;
        color: #FFFFFF;


    }
    #map_canvas
    {
        position: absolute;
        top: 0px;
        left: 0px;
        bottom: 0px;
        width: 100%;
        z-index: 1;
    }




    .no-js #loader { display: none;  }
    .js #loader { display: block; position: absolute; left: 100px; top: 0; }


    #content{
        font-weight: 300;
        font-size: 12px;
        display: inline-block;
        overflow: auto;
        max-height: 820px;
        max-width: 654px;
        color: #666666;
        padding: 5px;


    }
    #bodyContent{
        text-align: left;
        font-family: verdana;
        font-size: smaller;
        /*font-size: 13px;*/
    // line-height: 18px;
        font-weight: 400;
        margin-right: 1px;
        padding: 5px 5px 5px 5px;
        max-height: 250px;
    //overflow-y: auto;
        overflow-x: hidden;
        color:#666666;
        line-height: 50%;

    }

    .dropbtn {
        position: absolute;
        top: 140px;
        left: 100px;
        width: 180px;
        height: 20px;
        background-color: #4CAF50;
        color: white;
        padding: 16px;
        font-size: 16px;
        border: none;
        cursor: pointer;
    }





    .dropdown-content img:hover { opacity: 1.0;
        filter: alpha(opacity=100);}


    .dropdown:hover .dropdown-content {
        display: block;
    }


    .markerlabels {

        color: #F10929;
        background-color: #DED7D7;
        font-family: "Lucida Grande", "Arial", sans-serif;
        font-size: 10px;
        font-weight: bold;
        text-align: center;
        width: 90px;
        border: 1px solid #666666;
        white-space: nowrap;
        height:12px;

    }
    .gm-style-iw {
    // width: 234px;
        width: 350px;
    //height:300px;
        top: 15px ;
        left: 0 ;
        background-color: #fff;
        box-shadow: 0 1px 6px rgba(178, 178, 178, 0.6);
        border: 1px solid rgba(72, 181, 233, 0.6);
        border-radius: 10px 10px 10px 10px;
        text-align: center;
        background-image: url('data:image/jpeg;base64,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');
        background-repeat: no-repeat;
        background-position: left top;
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
              /*  var marker = new google.maps.Marker({
                    position: latlng,
                    map: map
                });*/

                  //
                var markerIcon = {
                    url: 'http://dryicons.com/uploads/icon/preview/6445/small_1x_7a84723a-8491-4af3-884e-1954a3ebbb94.png',
                    scaledSize: new google.maps.Size(35, 35),
                    origin: new google.maps.Point(0, 0),
                    anchor: new google.maps.Point(32,65)
                };
                var markerLabel = promotions.promotionDescription;
                var marker = new google.maps.Marker({
                    map: map,
                    animation: google.maps.Animation.DROP,
                    position: latlng,
                    icon: markerIcon,
                    label: {
                        text: markerLabel,
                        color: "#eb3a44",
                        fontSize: "12px",
                        fontWeight: "bold"
                    }
                });

                google.maps.event.addListener(marker, 'click', function() {
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
                    var infoWindow = new google.maps.InfoWindow({
                            content: content,
                            maxWidth: 250
                        }
                    );

                    infoWindow.open(map, marker);
                    var iwOuter = $('.gm-style-iw');
                    var iwBackground = iwOuter.prev();
                    // Remove the background shadow DIV
                    iwBackground.children(':nth-child(2)').css({'display': 'none'});
                    // Remove the white background DIV
                    iwBackground.children(':nth-child(4)').css({'display': 'none'});
                    var iwCloseBtn = iwOuter.next();

                    // Apply the desired effect to the close button
                    iwCloseBtn.css({
                        opacity: '1', // by default the close button has an opacity of 0.7
                        right: '11px', top: '10px', // button repositioning
                        border: '7px solid #48b5e9', // increasing button border and new color
                        'border-radius': '13px', // circular effect
                        'box-shadow': '0 0 5px #3990B9' // 3D effect to highlight the button
                    });

                    // The API automatically applies 0.7 opacity to the button after the mouseout event.
                    // This function reverses this event to the desired value.
                    iwCloseBtn.mouseout(function () {
                        $(this).css({opacity: '1'});
                    });

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
