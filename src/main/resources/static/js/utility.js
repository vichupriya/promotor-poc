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




