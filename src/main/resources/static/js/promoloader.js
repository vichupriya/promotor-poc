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

            icon: markerIcon,
            animation: google.maps.Animation.DROP,
            align: 'right'

        });
/*
  labelClass: "markerlabels",
            labelStyle: {opacity: 0.75, visibility: false},
            labelContent: markerLabel,
*/
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
        var addr='';
        if(typeof promotions.formattedAddress != "undefined"){
            addr =promotions.formattedAddress.split(",");
        }


        var cardContent ='';
    var miles = promotions.miles;
    if(typeof miles === "undefined" || miles===null){
        miles = '';
    }else{
        miles =miles+ ' Away';
    }

        cardContent =' <div class="media">' +
        '<div class="media-left media-middle">' +
        '      <img src="/images/rstant.jpg" class="media-object" style="width:100px;height:100px">' +
        '    </div>' +
        '<div class="media-body">' +
        '      <h1 class="media-heading">'+promotions.businessName+'</h1>' +
        '      <h2><small>'+addr[1]+addr[2]+',<span class="badge">'+miles+'</span></small></h2>' +
        '      <span class="label label-danger">'+promotions.promotionDescription+'</span>' +
        '      Used By <span class="badge">2</span>' +
        '      <div style="text-align:right"> <button type="button" class="btn btn-primary">Get Promo Code</button></div>' +
        '     ' +
        '    </div>' +
        '  </div><hr>';

        $('#cardContainer').append(cardContent);
        bounds.extend(latlng);

        markerArray.push({type:promotions.businessType,markerobj:marker});
    })

    if(data.length >0){
        map.fitBounds(bounds);
        map.panToBounds(bounds);
        map.setZoom(10);
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

 