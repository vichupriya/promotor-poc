
$( document ).ready(function() {
    milesSelected = $('#mileselect').find(":selected").text();

    mapboxgl.accessToken = 'pk.eyJ1Ijoic3VqaXRodjE5ODQiLCJhIjoiY2pjZ3I0eng2MXB2MDJ3cGdwNjlhd3JrbSJ9.YeSHc125CGKkmIJX0wjv6w';
    var map = new mapboxgl.Map({
        container: 'map',
        style: 'mapbox://styles/mapbox/dark-v9'
    });

    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function(position) {
            pos = {
                lat: position.coords.latitude,
                lng: position.coords.longitude
            };
            prepareMap();
            // alert("Data: "+pos.lat+","+pos.lng);


            // map.setCenter(pos);
        }, function() {
            handleLocationError(true, infoWindow, map.getCenter());
        });
    } else {
        // Browser doesn't support Geolocation
        handleLocationError(false, infoWindow, map.getCenter());
    }
});
function prepareMap()
{

    markersArray = [];
    var url ='https://promoprofiler.cfapps.io/promotions/search/'+pos.lat+':'+pos.lng+'/'+milesSelected;
    $.when($.getJSON(url, function (data) {
        console.log(data);


    }, function () {
        console.log("Error in JS");
    })).then(function (data) {
        // alert(data.length)
        $.each(data,function (i,promotions) {

            var latlng = new google.maps.LatLng(promotions.ownerLocation.lat, promotions.ownerLocation.lng);


            var map = new mapboxgl.Map({
                container: 'map',
                style: 'mapbox://styles/mapbox/basic-v9',
                center: [-96, 37.8],
                zoom: 3
            });

            var popup = new mapboxgl.Popup({closeOnClick: false})
                .setLngLat([promotions.ownerLocation.lat ,promotions.ownerLocation.lng])
                .setHTML('<h1>Hello World!</h1>')
                .addTo(map);
            markerArray.push(marker);
        })

    });

}