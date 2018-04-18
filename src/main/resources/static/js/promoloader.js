/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var localDateTimeString;
var withInBlockStr = "With in blocks of me";
var onetoTwoMiles = "1 to 2 Miles";
var twotoFiveMiles = "2 to 5 miles";
var moreThanFiveMiles = "More Than 5 Miles";
var markerArray=[];
var dataArray=[];
var Popup;
var userZip="";
var distanceSelected="More Than 5 Miles";
var searchTypeCode="";
var printContent;
 function initMap() {
        var styles = [
            {
                "featureType": "road",
                "elementType": "labels",
                "stylers": [
                    {
                        "visibility": "on"
                    }
                ]
            },
            {
                "featureType": "road",
                "elementType": "labels.icon",
                "stylers": [
                    {
                        "visibility": "on"
                    }
                ]
            },
            {
                "featureType": "road",
                "elementType": "labels.text",
                "stylers": [
                    {
                        "visibility": "on"
                    }
                ]
            },
            {
                "featureType": "road",
                "elementType": "labels.text.fill",
                "stylers": [
                    {
                        "color": "#ff8040"
                    },
                    {
                        "visibility": "on"
                    },
                    {
                        "weight": 2.5
                    }
                ]
            },
            {
                "featureType": "road",
                "elementType": "labels.text.stroke",
                "stylers": [
                    {
                        "visibility": "on"
                    }
                ]
            }
        ];
       // var currentloc = {lat:  lat ,lng: lng};
       // var styledMap = new google.maps.StyledMapType(styles,{name: "Styled Map"});
        map = new google.maps.Map(document.getElementById('map'), {
            zoom: 50,
            styles: styles,

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
    var devicelatlng = new google.maps.LatLng(lat,lng);

    var deviceMarkerIcon = {
        url: 'https://raw.github.com/phatblat/BlueDot/0.1.1/bluedot.gif',
        scaledSize: new google.maps.Size(35, 35),
    };

    var currentLocMarker =  new google.maps.Marker({

        position: devicelatlng,
        map: map,
        fontSize: 10,
        strokeWeight: 3,
        icon: deviceMarkerIcon,
        animation: google.maps.Animation.DROP,
        align: 'right'

    });

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
            "currentTime": getFormattedDate(new Date()),
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
function displayPromoInfoModal(promoModalContent,mailToContent){

    $('#promoBusinessInfo').empty();

    $('#promoBusinessInfo').append(promoModalContent);
    $("#promoEmailLink").attr("href", mailToContent);
    $("#promoInfoModal").modal('show');
}
function preparePromoModal(modalData){

    //var modalContent =promotions.businessName+":"+promotions.formattedAddress+":"+promotions.promotionDescription+":"+promotions.promotionCode;
    if(typeof modalData != "undefined" && modalData!='') {
        modalContent = modalData.split(":");
        var expiryDate = modalContent[4] + ":" + modalContent[5];
        var promoCode = '<div class="offer-code">Code :<strong>' + modalContent[3] + '</strong><br></div>';
        var promoModalContent = '<div class="offer-redemption-content"><h1>' + modalContent[0] + '</h1>' +
            ' <span >' + modalContent[1] + '</span><br><em id="promoDesc">' + modalContent[2] + '</em >' + promoCode + '<br>Expiry :<span class="label label-danger">' + expiryDate + '</span></div><div id="print-view"><span>Issued Date:'+getFormattedDate(new Date())+'</span></div>';
       // printContent = '<html><body>'+promoModalContent +'<span>'+'Issued Date: '+getFormattedDate(new Date())+'</span></div></div></body></html>';
        var mailBody = modalContent[2] + '\n' + "Code :" + modalContent[3] + '\n' + modalContent[0] + '\n' + modalContent[1] + '\n' + expiryDate + '\n\n'+'Issued Date :'+getFormattedDate(new Date());
        var mailToContent = "mailto:?subject=Look At The Offer Inside&body=" + encodeURIComponent(mailBody);
        displayPromoInfoModal(promoModalContent, mailToContent);
    }
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

        var modalData =promotions.businessName+":"+promotions.formattedAddress+":"+promotions.promotionDescription+":"+promotions.promotionCode+":"+promotions.endTime;
        google.maps.event.addListener(marker, 'click', function () {

          preparePromoModal(modalData);


        });
        var addr='';
        if(typeof promotions.formattedAddress != "undefined"){
            addr =promotions.formattedAddress.split(",");
        }



    var miles = promotions.miles;
    if(typeof miles === "undefined" || miles===null){
        miles = '';
    }else{
        miles =miles+ ' Away';
    }
        var data =

        cardContent =' <div class="media">' +
        '<div class="media-left media-middle">' +
        '      <img src="/images/rstant.jpg" class="media-object" style="width:100px;height:100px">' +
        '    </div>' +
        '<div class="media-body">' +
        '      <h1 class="media-heading">'+promotions.businessName+'</h1>' +
        '      <h2><small>'+addr[1]+addr[2]+',<span class="badge">'+miles+'</span></small></h2>' +
        '      <span class="label label-danger">'+promotions.promotionDescription+'</span>' +
        '      Used By <span class="badge">2</span>' +
        '      <div style="text-align:right" class="promodiv" > <button type="button" id= "promoInfoBtn"  class="btn btn-primary" value="'+modalData+'">More Info</button></div>' +
        '     ' +
        '    </div>' +
        '  </div><hr>';

        var hiddenContent = '<input id="'+promotions.promotionId+'" type="hidden" value="'+data+'">';
       // $('#cardContainer').append(hiddenContent);
        $('#cardContainer').append(cardContent);
        bounds.extend(latlng);

        markerArray.push({type:promotions.businessType,markerobj:marker});
    })

    if(data.length >0){
        map.fitBounds(bounds);
        map.panToBounds(bounds);
       // map.setZoom(50);
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

 