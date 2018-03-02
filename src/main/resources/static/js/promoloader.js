/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var barIcon ='';
var fineDineIcon = 'http://icons.iconarchive.com/icons/paomedia/small-n-flat/72/map-marker-icon.png';
var sportsBarIcon = 'http://icons.iconarchive.com/icons/icons-land/vista-map-markers/128/Map-Marker-Marker-Outside-Azure-icon.png';
var pubIcon = 'http://icons.iconarchive.com/icons/icons-land/vista-map-markers/128/Map-Marker-Marker-Outside-Chartreuse-icon.png';
var microBrewIcon = 'http://www.iconsplace.com/icons/preview/orange/marker-256.png';
var barIcon ='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjb28TwCK1MAhP5abin3xPJyXgxr5xYOVHIog_uADc_1zcraBTqg';
var resturantOnlyIcon = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjb28TwCK1MAhP5abin3xPJyXgxr5xYOVHIog_uADc_1zcraBTqg';
var localDateTimeString;
var withInBlockStr = "With in blocks of me";
var onetoTwoMiles = "1 to 2 Miles";
var twotoFiveMiles = "2 to 5 miles";
var moreThanFiveMiles = "More Than 5 Miles";
var markerArray=[];
var Popup;
 function initMap() {
        var styles = [
            {
                "elementType": "geometry",
                "stylers": [
                    {
                        "color": "#ebe3cd"
                    }
                ]
            },
            {
                "elementType": "labels.text.fill",
                "stylers": [
                    {
                        "color": "#523735"
                    }
                ]
            },
            {
                "elementType": "labels.text.stroke",
                "stylers": [
                    {
                        "color": "#f5f1e6"
                    }
                ]
            },
            {
                "featureType": "administrative",
                "elementType": "geometry.stroke",
                "stylers": [
                    {
                        "color": "#c9b2a6"
                    }
                ]
            },
            {
                "featureType": "administrative.land_parcel",
                "elementType": "geometry.stroke",
                "stylers": [
                    {
                        "color": "#dcd2be"
                    }
                ]
            },
            {
                "featureType": "administrative.land_parcel",
                "elementType": "labels.text.fill",
                "stylers": [
                    {
                        "color": "#ae9e90"
                    }
                ]
            },
            {
                "featureType": "landscape.natural",
                "elementType": "geometry",
                "stylers": [
                    {
                        "color": "#dfd2ae"
                    }
                ]
            },
            {
                "featureType": "poi",
                "elementType": "geometry",
                "stylers": [
                    {
                        "color": "#dfd2ae"
                    }
                ]
            },
            {
                "featureType": "poi",
                "elementType": "labels.text.fill",
                "stylers": [
                    {
                        "color": "#93817c"
                    }
                ]
            },
            {
                "featureType": "poi.park",
                "elementType": "geometry.fill",
                "stylers": [
                    {
                        "color": "#a5b076"
                    }
                ]
            },
            {
                "featureType": "poi.park",
                "elementType": "labels.text.fill",
                "stylers": [
                    {
                        "color": "#447530"
                    }
                ]
            },
            {
                "featureType": "road",
                "elementType": "geometry",
                "stylers": [
                    {
                        "color": "#f5f1e6"
                    }
                ]
            },
            {
                "featureType": "road.arterial",
                "elementType": "geometry",
                "stylers": [
                    {
                        "color": "#fdfcf8"
                    }
                ]
            },
            {
                "featureType": "road.highway",
                "elementType": "geometry",
                "stylers": [
                    {
                        "color": "#f8c967"
                    }
                ]
            },
            {
                "featureType": "road.highway",
                "elementType": "geometry.stroke",
                "stylers": [
                    {
                        "color": "#e9bc62"
                    }
                ]
            },
            {
                "featureType": "road.highway.controlled_access",
                "elementType": "geometry",
                "stylers": [
                    {
                        "color": "#e98d58"
                    }
                ]
            },
            {
                "featureType": "road.highway.controlled_access",
                "elementType": "geometry.stroke",
                "stylers": [
                    {
                        "color": "#db8555"
                    }
                ]
            },
            {
                "featureType": "road.local",
                "elementType": "labels.text.fill",
                "stylers": [
                    {
                        "color": "#806b63"
                    }
                ]
            },
            {
                "featureType": "transit.line",
                "elementType": "geometry",
                "stylers": [
                    {
                        "color": "#dfd2ae"
                    }
                ]
            },
            {
                "featureType": "transit.line",
                "elementType": "labels.text.fill",
                "stylers": [
                    {
                        "color": "#8f7d77"
                    }
                ]
            },
            {
                "featureType": "transit.line",
                "elementType": "labels.text.stroke",
                "stylers": [
                    {
                        "color": "#ebe3cd"
                    }
                ]
            },
            {
                "featureType": "transit.station",
                "elementType": "geometry",
                "stylers": [
                    {
                        "color": "#dfd2ae"
                    }
                ]
            },
            {
                "featureType": "water",
                "elementType": "geometry.fill",
                "stylers": [
                    {
                        "color": "#b9d3c2"
                    }
                ]
            },
            {
                "featureType": "water",
                "elementType": "labels.text.fill",
                "stylers": [
                    {
                        "color": "#92998d"
                    }
                ]
            }
        ];
       // var currentloc = {lat:  lat ,lng: lng};
       // var styledMap = new google.maps.StyledMapType(styles,{name: "Styled Map"});
        map = new google.maps.Map(document.getElementById('map'), {
            zoom: 10,
            styles: styles,

        });


     google.maps.event.addListener(map, "rightclick", function(event) {
        // $("#mydiv").show();
     });
     $.getScript( "/js/markerlabel.js" )
         .done(function( script, textStatus ) {
             console.log( textStatus );
         })
         .fail(function( jqxhr, settings, exception ) {
             $( "div.log" ).text( "Triggered ajaxError handler." );
         });
     getLocationPromos();
 }
function getPromotions(){

     // getCurrentDateTimeAsString();

     clearMarkerArray();
     var url = $("#searchForm").attr( "action") ;
      var userZip = $("#cityzip").val();
      var resturantType = '';
      var resturantOnly = $("#resturantOnly").prop("checked") ? 2 : '';
      var barOnly = $("#bar").prop("checked") ? 1 : '';
      var sportsBar = $("#sportsBar").prop("checked") ? 3 : '';
      var pubtavern =  $("#pubtavern").prop("checked") ? 10 : '';
      var pubLounge = $("#publounge").prop("checked") ? 11 : '';
      var pub = $("#pub").prop("checked") ? 5 : '';
      var fineDining  = $("#diner").prop("checked") ? 4 : '';
      var microBrew = $("#microbrew").prop("checked") ? 6 : '';
      var speciality = $("#speciality").prop("checked") ? 15 : '';
      resturantType =( $("#all").prop("checked")) ? -1 : resturantOnly+":"+barOnly+":"+sportsBar+":"+pub+":"+fineDining+":"+microBrew+":"+pubtavern+":"+pubLounge+":"+speciality;

      resturantType = (resturantType.length==0 || resturantType ==='::::::::' ) ? '-1':resturantType;
      var userLat=lat;//$("#latitude").val();
          var userLong=lng;//$("#longitude").val();
      var milesSelected = $('#mileselect').find(":selected").text();


    var milesRange =  20;
    if(milesSelected.toLowerCase() === withInBlockStr.toLowerCase())
        milesRange =.05;
    if(milesSelected.toLowerCase() === onetoTwoMiles.toLowerCase())
        milesRange = 2;
    if(milesSelected.toLowerCase() === twotoFiveMiles.toLowerCase())
        milesRange = 5;
    if(milesSelected.toLowerCase() === moreThanFiveMiles.toLowerCase())
        milesRange = 20;
    if(typeof milesRange === "undefined")
           milesRange = 20;
        var  promoSearchRequestJson={
        "withInMiles": milesRange,
            "searchZipCode": userZip,
            "resturantType": resturantType,
            "currentTime": getCurrentDateTimeAsString(),
            "userLat": userLat,
            "userLong": userLong,

    }
    $.ajax(
         {
             url:url,
             type:"POST",
             data: JSON.stringify(promoSearchRequestJson),
             beforeSend: function(xhr) {
                 xhr.setRequestHeader("Accept", "application/json");
                 xhr.setRequestHeader("Content-Type", "application/json");
                 xhr.setRequestHeader("Access-Control-Allow-Origin", "*");

             },success: function(data) {
             processPromotions(data);
         }



    });

}
function processPromotions(data){

    $("#noPromoAlert").hide();
    //definePopupClass();
    var bounds = new google.maps.LatLngBounds();
    $.each(data, function (i, promotions) {

        var latlng = new google.maps.LatLng(promotions.ownerLat, promotions.ownerLng);
        var markerIconURL =  '/images/default-marker.png';
        if(promotions.businessType ==1)
            markerIconURL ="/assets/images/bar.png";
        if(promotions.businessType ==2)
            markerIconURL ="/assets/images/resturant-marker.png";
        if(promotions.businessType ==3)
            markerIconURL = "/assets/images/sportsbar-marker.png";
        if(promotions.businessType ==4)
            markerIconURL = "/assets/images/pub-marker.png";
        if(promotions.businessType ==10)
            markerIconURL  = "/assets/images/pubtavern-marker.png";
        if(promotions.businessType ==11)
            markerIconURL  = "/assets/images/publounge-marker.png";
        if(promotions.businessType ==6)
            markerIconURL  = "/assets/images/microbrew-marker.png";
        if(promotions.businessType ==7)
            markerIconURL  = "/assets/images/diner-marker.png";
        var markerIcon = {
            url: markerIconURL,
            scaledSize: new google.maps.Size(35, 35),
        };
        var markerLabel = promotions.promotionDescription;

        var marker = new MarkerWithLabel({
            title: markerLabel,
            position: latlng,
            map: map,
            fontSize: 10,
            strokeWeight: 3,
            text: markerLabel,
            labelClass: "markerlabels",
            labelStyle: {opacity: 0.75, visibility: true},
            labelContent: markerLabel,
            icon: markerIcon,
            animation: google.maps.Animation.DROP,
            align: 'right'

        });
    /*   var popup = new Popup(
            latlng,
            promotions.promotionDescription);
        popup.setMap(map);*/

        var infoContent = '<ul class="list-group">\n' +
            '            <li class="list-group-item text-muted"><div class="well"><span class="label label-success" style="font-size: large">' + promotions.promotionDescription + '</span></div></li>\n' +
            '            <li class="list-group-item text-right"><span class="pull-left"><strong>Address</strong></span> <span class="label label-info" style="font-size: medium">' + promotions.formattedAddress + '</span></li>\n' +
            '            <li class="list-group-item text-right"><span class="pull-left"><strong>Distance From Current Location</strong></span><span class="label label-info" style="font-size: medium">' + promotions.miles + '</span></li>\n' +
            '            <li class="list-group-item text-right"><span class="pull-left"><strong>Current Traffic</strong></span> <span class="label label-warning style="font-size: medium">Light</span></li>\n' +
            '            <li class="list-group-item text-right"><span class="pull-left"><strong>Contact#</strong></span> <span class="label label-info style="font-size: medium">' + promotions.contactPhone + '</span></li>\n' +
            '            \n' +
            '          </ul> <button type="button" class="btn btn-warning">Print Promo Code</button>'
        google.maps.event.addListener(marker, 'click', function () {
            var panelContent = '';



           var  content ='<div class="card">\n' +
                '  <img src="/w3images/team2.jpg" alt="John" style="width:100%">\n' +
                '  <h1>'+promotions.businessName+'</h1>\n' +
                '  <p class="title">'+promotions.promotionDescription+'</p>\n' +
                '  <p>'+promotions.formattedAddress+'</p>\n' +
                '  <div style="margin: 24px 0;">\n' +
                '    <a href="#"><i class="fa fa-dribbble"></i></a> \n' +
                '    <a href="#"><i class="fa fa-twitter"></i></a>  \n' +
                '    <a href="#"><i class="fa fa-linkedin"></i></a>  \n' +
                '    <a href="#"><i class="fa fa-facebook"></i></a> \n' +
                ' </div>\n' +
                ' <p><button>'+'Promo Code:'+promotions.promotionCode+'</button></p>\n' +
                '</div>'
            var infowindow = new google.maps.InfoWindow({
                    content: content,
                    maxWidth: 650,
                }
            );




            infowindow.open(map, marker);
        });
        bounds.extend(latlng);

        markerArray.push({type:promotions.businessType,markerobj:marker});
    })
    if(data.length >0){
        map.fitBounds(bounds);
        map.panToBounds(bounds);
    }else{
        $("#noPromoAlert").show();
    }
   /* if (markerArray.length == 1 && map.getZoom() > 15) {
        map.setZoom(10);
    }*/
}

function clearMarkerArray(){
    for (var i = 0; i < markerArray.length; i++) {

            markerArray[i].markerobj.setMap(null);
        }
        markerArray=[];
}
function clearMarkerArrayForType(type){
    for (var i = 0; i < markerArray.length; i++) {
        if(markerArray[i].type===type)
            markerArray[i].markerobj.setMap(null);
    }

}

 