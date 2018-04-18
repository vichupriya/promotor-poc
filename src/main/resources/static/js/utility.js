/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var geo_options = {
    enableHighAccuracy: true,
    maximumAge        : 30000,
    timeout           : 27000
};
var takeScreenShot = function() {
    html2canvas(document.getElementById("promoDetailModal"), {
        onrendered: function (canvas) {
            var tempcanvas=document.createElement('canvas');
            tempcanvas.width=550;
            tempcanvas.height=350;
            var context=tempcanvas.getContext('2d');
            context.drawImage(canvas,112,0,288,200,0,0,350,350);
            var link=document.createElement("a");
            link.href=tempcanvas.toDataURL('image/jpg');   //function blocks CORS
            link.download = 'screenshot.jpg';
            link.click();
        }
    });
}
function getFormattedDate(date){

    var month = date.getMonth()+1;
    var monthValue = (month<=9)?"0"+month:month;
    var day =  date.getDate();
    var dayValue = (day<=9)?"0"+day:day;
    var hours =  date.getHours();
    var hoursValue = (hours<=9)?"0"+hours:hours;

    var mints =  date.getMinutes();
    var mintsValue = (mints<=9)?"0"+mints:mints;
    var defaultStartTime  = monthValue+"/"+dayValue+"/"+date.getFullYear();
    var hourString = date.toLocaleString('en-US', { hour: 'numeric', minute: 'numeric', hour12: true });
    return defaultStartTime+" "+hourString;
}
function getLocationPromos() {
    if (!navigator.geolocation){
        $('#defaultSearchInputModal').modal();
    }
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(onSuccessFullLocation,onLocationError);
    }
    //navigator.geolocation.watchPosition(onSuccessFullLocation, onLocationError, geo_options);
}
function onSuccessFullLocation(position){
    lat = position.coords.latitude;
    lng = position.coords.longitude;
    getPromotions();
}
function onLocationError(){
    $('#defaultSearchInputModal').modal();
}
function watchUserPosition() {
    var watchID = navigator.geolocation.watchPosition(function (position) {
        lat = position.coords.latitude,
            lng = position.coords.longitude
        $("#latitude").val(lat);
        $("#longitude").val(lng);
    });
}
function getCurrentDateTimeAsString(){
    var dNow = new Date(new Date().toString());
    localDateTimeString=  dNow.toISOString();
    return localDateTimeString;

}




