/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* global map, google, infowindow, vesselInfoMap, url, markersArray */


function initialize_map() {

   // findSelection();
    // Animate loader off screen
    $(".loadingBar").fadeOut("slow");
    ;
    //create map and map options
    createMapOptions();
    //get data from DB and process it
    getPromotionDetails();
}
;
// This function will iterate over markersData array
// creating markers with createMarker function
function displayMarkers(markerData) {

    //clear the markers
    clearMarkers();
    // this variable sets the map bounds and zoom level according to markers position
    //  var bounds = new google.maps.LatLngBounds();

    // For loop that runs through the info on markersData making it possible to createMarker function to create the markers
    for (var i = 0; i < markerData.length; i++) {

        var latlng = new google.maps.LatLng(markerData[i].latitude, markerData[i].longitude);
        if (latlng) {
            createMarker(latlng,markerData[i]);
        }
    }
    //setMapOnAll(map);

}
// This function creates each marker and sets their Info Window content
function createMarker(promolatlng,promotions) {


    // Add a Marker to the Map
    var str_latitude = '';
    var str_longitude = '';
    var markerImage = "images/placeholder-Blue.png";



    if (promotions && promotions.ownerLocation.lat !== null) {

        str_latitude = promotions.ownerLocation.lat;
        if (str_latitude < 0) {
            str_latitude = str_latitude + " S";
            str_latitude = str_latitude.slice(1);
        }
        else {
            str_latitude = str_latitude + " N";
        }
    }
    if (promotions && promotions.ownerLocation.lng !== null) {
        str_longitude = promotions.ownerLocation.lng;
        if (str_longitude < 0) {
            str_longitude = str_longitude + " W";
            str_longitude = str_longitude.slice(1);
        }
        else {
            str_longitude = str_longitude + " E";
        }
    }

    var contentString = '<h1 id=' + "infoHeading" + '>' + promotions.promotionDescription + '</h3>' +
        '<div id="bodyContent">' +
        '<p><b>Starting:</b>' +promotions.startTime + '</p>' +
        '<p><b>Ends By:</b>' + promotions.endTime + '</p>' +
        '<p><b>Address</b>' +'' + '</p>' +
        '<p><b>Rating:</b>' + '' + '</p>'
       ;
    '</div>'; //+
    //  '</div>';
    // Add a Marker to the Map
    var latlng = new google.maps.LatLng(promotions.ownerLocation.lat, promotions.ownerLocation.lng);
    if (str_latitude !== '' && str_longitude !== '')
    {

       /* var marker = new MarkerWithLabel({
            title: promotions.promotionDescription,
            position: latlng,
            map: map,
            fontSize: 10,
            strokeWeight: 3,
            text: promotions.promotionDescription,
            labelClass: "markerlabels",
            labelStyle: {opacity: 0.75, visibility: 'visible'},
            labelContent: promotions.promotionDescription,
            icon: markerImage,
            animation: google.maps.Animation.DROP,
            align: 'right'

        });
        ;*/
        var marker = new google.maps.Marker({
            position: promolatlng,
            map: map,
            title:"Porcelain Factory of Vista Alegre"
        });

        marker.addListener('click', function () {
            if (infowindow) {
                infowindow.close();

            }
            infowindow = new google.maps.InfoWindow({
                    content: contentString,
                    maxWidth: 250
                }
            );

            infowindow.open(map, marker);
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

        markersArray.push(marker);

    }

}
// Sets the map on all markers in the array.
function setMapOnAll(map) {
    for (var i = 0; i < markersArray.length; i++) {

        markersArray[i].setMap(map);
    }
}

// Create the Map Options
function createMapOptions() {

    var mapOptions = {
        center: new google.maps.LatLng(0, 0),
        zoom: 10,

    };
    // Generate the Map
    map = new google.maps.Map(document.getElementById('map'), mapOptions);
}

function clearMarkers() {


  //  setMapOnAll(null);
    markersArray = [];

}

function getPromotionDetails() {
    $.when($.getJSON(url, function (data) {
        console.log(data);
        // Set the variables from the results array


    }, function () {
        console.log("Error in JS");
    })).then(function (data) {
       refreshVesselInfoFromDB();
        var bounds = new google.maps.LatLngBounds();
        for (var i = 0; i < data.length; i++) {

            var latlng = new google.maps.LatLng(data[i].latitude, data[i].longitude);
            bounds.extend(latlng);
        }
        map.fitBounds(bounds);
    });
}
function refreshVesselInfoFromDB() {
    $.when($.getJSON(url, function (data) {
        console.log(data);
      //  vesselInfoMap.set(data);
        //window.setTimeout(refreshVesselInfoFromDB, 360000);
    }, function () {
        console.log("Error in map.js");
    })).then(function (data) {
        displayMarkers(data);
    });

}

