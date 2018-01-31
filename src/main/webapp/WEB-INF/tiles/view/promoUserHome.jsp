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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="/js/promoloader.js"></script>
</head>
<style>
    .row{
        margin-top:40px;
        padding: 0 10px;
    }

    .clickable{
        cursor: pointer;
    }





</style>
<body>
<script>
    var pos;
    var milesSelected;
    var resturantTypeSelected;
    var markerArray =[];
    var map;
    $( document ).ready(function() {
         milesSelected = $('#mileselect').find(":selected").text();
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(function(position) {
                pos = {
                    lat: position.coords.latitude,
                    lng: position.coords.longitude
                };
                prepareMap();
               
            }, function() {
                handleLocationError(true, infoWindow, map.getCenter());
            });
        } else {
            // Browser doesn't support Geolocation
            handleLocationError(false, infoWindow, map.getCenter());
        }
    });
    $('#mileselect').on('change', function() {
        milesSelected = $('#mileselect').find(":selected").text();
        clearMarkerArray();
        prepareMap();
    })
    $('#businessType').on('change', function() {

        resturantTypeSelected = $('#businessType').find(":selected").text();
        clearMarkerArray();
        prepareMap();
    })
   

    $(function(){
        $('#closeP').on('click',function(){
            var effect = $(this).data('effect');
            $(this).closest('.panel')[effect]();
        })
    })
    
    
</script>
<script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAlHTuGOT_CQSVDNMlA4_MmyyyNhaULVy0&callback=initMap">
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<div class="container-fluid">
    <div class="row content">
        <div class="col-sm-3 sidenav">
              <div class="well">

          <div class="form-group ">
            <label class="control-label " for="mileselect">
              With In Miles
            </label>
            <select class="select form-control" id="mileselect" name="select">
              <option value="5">
              5
              </option>
              <option value="10">
               10
              </option>
              <option value="20">
                20
              </option>
            </select>
            <label for="businessType">Type*	</label>
            <select path ="businessType" id="businessType" name="businessType" class="form-control">
              <option value="-1">Select</option>
              <option value="1">Bar Only</option>
              <option value="2">Restaurant Only</option>
              <option value="3">Sports Bar</option>
              <option value="4">Fine Dining</option>
              <option value="5">Pub</option>
              <option value="6">MicroBrew</option>
              <option value="7">Dive</option>
              <option value="8">Any</option>
            </select>
          </div>


      </div>
        </div>
        <div class="col-sm-9">
            <div id="map"></div>
                
        </div>
       </div>
   
</div>



</body>
</html>
