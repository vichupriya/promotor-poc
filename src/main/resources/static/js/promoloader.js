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
var userZip="";
var distanceSelected="More Than 5 Miles";
var searchTypeCode="";
var printContent;
 function initMap() {
        var styles = [
            {
                "featureType": "poi.business",
                "stylers": [
                    {
                        "visibility": "off"
                    }
                ]
            },
            {
                "featureType": "road",
                "elementType": "labels.icon",
                "stylers": [
                    {
                        "visibility": "off"
                    }
                ]
            },
            {
                "featureType": "road.arterial",
                "elementType": "labels",
                "stylers": [
                    {
                        "visibility": "off"
                    }
                ]
            },
            {
                "featureType": "road.highway",
                "elementType": "labels",
                "stylers": [
                    {
                        "visibility": "off"
                    }
                ]
            },
            {
                "featureType": "road.local",
                "stylers": [
                    {
                        "visibility": "off"
                    }
                ]
            },
            {
                "featureType": "transit",
                "stylers": [
                    {
                        "visibility": "off"
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
      var milesSelected =distanceSelected;


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
            "searchType": searchTypeCode

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

    $('#cardContainer').empty();
    $.each(data, function (i, promotions) {

        var latlng = new google.maps.LatLng(promotions.ownerLat, promotions.ownerLng);
        var markerIconURL =  '/images/promomarker.png';

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
            labelStyle: {opacity: 0.75, visibility: false},
            labelContent: markerLabel,
            icon: markerIcon,
            animation: google.maps.Animation.DROP,
            align: 'right'

        });

        google.maps.event.addListener(marker, 'click', function () {


            var $modal = $('#promoInfoModal');

// Show loader & then get content when modal is shown

            var promoCode ='<div class="offer-code">Code :'+promotions.promotionCode+'</div>';
             var promoBusinessContent ='<div class="offer-redemption-content"><h1>'+promotions.businessName+'</h1>' +
                ' <span >'+promotions.formattedAddress+'</span><br><em id="promoDesc">'+promotions.promotionDescription+'</em >'+promoCode+'</div><div id="print-view">';
            printContent = promoBusinessContent;
            $('#promoBusinessInfo').empty();

            $('#promoBusinessInfo').append(promoBusinessContent);
            $("#promoInfoModal").modal('show');


        });
       // $('#cardContainer').empty();
        var cardContent ='<div class="business-card" id="promoCard" style="height: 100px">' +
            '<div class="media">\n' +
            '<div class="media-left">\n' +
            '<img class="img-rounded"  src="data:image/jpeg;base64,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">' +
            '</div>\n' +
            ' <div class="media-body">\n' +
            '<h1>'+promotions.businessName+'</h1><h6><span class="label label-info">'+promotions.formattedAddress+'</span><h6>' +
            '<em id="promoDesc">'+promotions.promotionDescription+'</em>' +
            '</div>\n' +
            '</div>\n' +
            '</div>\n';
        $('#cardContainer').append(cardContent);
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

 