<%--
  Created by IntelliJ IDEA.
  User: skvpsid
  Date: 2/11/2018
  Time: 11:10 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<title></title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="generator" content="Mobirise v4.6.5, mobirise.com">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
<link rel="shortcut icon" href="/assets/images/logo.png" type="image/x-icon">
<meta name="description" content="">
<title>Home</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="/js/promoloader.js"></script>
<script src="/js/utility.js"></script>


<script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAlHTuGOT_CQSVDNMlA4_MmyyyNhaULVy0&callback=initMap">
</script>

<head>
    <style>

        /* General sizing */
        ul.dropdown-lr {
            width: 300px;
        }

        /* mobile fix */
        @media (max-width: 768px) {

            }
        .dropdown-lr label {
            color: #eee;
        }


        .markerlabels {
            color: black;
            border-radius: 5px;
            border: 10px solid white;
            background: yellow;
            font-family: "Lucida Grande", "Arial", sans-serif;
            font-weight: bold;
            font-size: 12px;
            text-align: center;
            padding: 5px 5px 5px 5px;
            white-space: nowrap;
            border: 1px solid #666666;
            height:23px;
        }
        #searchInputSection{
            padding: 5px;
        }
        #map{
            position: relative;
            
            height: 350px;
            width: auto;
            overflow: hidden;


        }

    #noPromoAlert {
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
    }

   
    </style>
</head>
<body>
<script>
    var lat;
    var lng;
   // watchUserPosition();
    $( document ).ready(function() {
        $("#noPromoAlert").hide();

    /*    $("input[type='checkbox']").on('change', function () {
            getPromotions();

        });
        */
        $('#mileselect').on('change', function() {
            getPromotions();
        })
        $("#all").change(function ()
            {
                if($("#all").prop("checked")) {
                    getPromotions();
                    $(':checkbox').prop('checked', true);
                }else{
                    $(':checkbox').prop('checked', false);
                    clearMarkerArray();
                }

            }
        );
        $("#resturantOnly").change(function ()
            {
                if($("#resturantOnly").prop("checked") && !($("#all").prop("checked"))){
                    getPromotions();
                }else{
                    $("#all").prop('checked',false);
                    clearMarkerArrayForType("2");
                }

            }
        );
        $("#bar").change(function ()
            {
               if($("#bar").prop("checked")) {
                   getPromotions();
               }else{
                   $("#all").prop('checked',false);
                   clearMarkerArrayForType("1");
               }
            }
        );
        $("#sportsBar").change(function ()
            {
                if($("#sportsBar").prop("checked")) {
                    getPromotions();
                }
                else{
                    $("#all").prop('checked',false);
                    clearMarkerArrayForType("3");
                }
            }
        );
        $("#pubtavern").change(function ()
            {
                if($("#pubtavern").prop("checked")) {
                    getPromotions();
                }else{
                    $("#all").prop('checked',false);
                    clearMarkerArrayForType("10");
                }
            }
        );
        $("#publounge").change(function ()
            {
                if($("#publounge").prop("checked")) {
                    getPromotions();
                }else{
                    $("#all").prop('checked',false);
                    clearMarkerArrayForType("11");
                }
            }
        );
        $("#microbrew").change(function ()
            {
               if($("#microbrew").prop("checked")) {
                   getPromotions();
               }else{
                   $("#all").prop('checked',false);
                   clearMarkerArrayForType("6");
               }
            }
        );
        $("#diner").change(function ()
            {
               if($("#diner").prop("checked")){
                   getPromotions();
               }else {
                   $("#all").prop('checked', false);
                   clearMarkerArrayForType("7");
               }

            }
        );

        $("#speciality").change(function ()
            {
               if($("#speciality").prop("checked")) {
                   getPromotions();
               }else{
                   $("#all").prop('checked', false);
               }
            }
        );
        $("#pub").change(function ()
            {
                if($("#speciality").prop("checked")) {
                    getPromotions();
                }else{
                    $("#all").prop('checked', false);
                }
            }
        );
        
    });
    function submitSearchFromModal(){
        $("#userZipCode").val($("searchZipCode").val());
        getPromotions();
    }
   
</script>


  <div class="container" >

            <div class="row">


                <form class="form-inline" role="form">

                    <div class="form-group" style="height:69px">
                        <div class="dropdown">
                            <button class="btn btn-warning dropdown-toggle" type="button" data-toggle="dropdown">Where do you want to go?
                                <span class="caret"></span></button>
                            <ul class="dropdown-menu">
                                <li>
                                    <a href="#" class="small" data-value="option1" tabIndex="-1">
                                        <input type="checkbox" id="all"/>&nbsp;All
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="small" data-value="option2" tabIndex="-1">
                                        <input type="checkbox" id="resturantOnly" />&nbsp;Resturant Only
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="small" data-value="option3" tabIndex="-1">
                                        <input type="checkbox" id="bar"/>&nbsp;Bar
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="small" data-value="option4" tabIndex="-1">
                                        <input type="checkbox" id="sportsBar"/>&nbsp;Sports Bar
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="small" data-value="option5" tabIndex="-1">
                                        <input type="checkbox" id="pubtavern"/>&nbsp;Pub/Tavern
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="small" data-value="option6" tabIndex="-1">
                                        <input type="checkbox" id="publounge"/>&nbsp;Pub/Lounge
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="small" data-value="option6" tabIndex="-1">
                                        <input type="checkbox" id="pub"/>&nbsp;Pub
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="small" data-value="option6" tabIndex="-1">
                                        <input type="checkbox" id="diner"/>&nbsp;Diner
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="small" data-value="option6" tabIndex="-1">
                                        <input type="checkbox" id="microbrew"/>&nbsp;MicroBrew
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="small" data-value="option6" tabIndex="-1">
                                        <input type="checkbox" id="speciality"/>&nbsp;Speciality
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <div class="form-group" style="height:69px">
                        <label>How Far?</label>
                        <select class="form-control" id="mileselect" style="font-size: 12px;">
                            <option>More Than 5 Miles</option>
                            <option>With in blocks of me</option>
                            <option>1 to 2 Miles</option>
                            <option>2 to 5 Miles</option>

                        </select>
                    </div>
                    </form>

            </div>

  <div class="row">
    <div class="col-sm-3" style="background-color:lavender;">.col-sm-3</div>
    <div class="col-sm-6" ><div id="map"></div></div>

  </div>
  </div>
<form id="searchForm" action="${pageContext.request.contextPath}/activepromotions"></form>


    


 



<input name="animation" type="hidden">
<input type="hidden" id="userZipCode"></input>
<input type="hidden" id="latitude"></input>
<input type="hidden" id="longitude"></input>
<div class="modal fade" id="defaultSearchInputModal" role="dialog" ata-dismiss="modal" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">

            <div class="modal-body">
                <label for="cityzip">City/Zip:</label>
                <input type="text"  class="form-control" id="cityzip"></input>

            </div>
            <div class="modal-footer">
                <button type="button" id="promosearch" class="btn btn-default" data-dismiss="modal" onclick="submitSearchFromModal()">Search</button>
            </div>
        </div>
    </div>
</div>
<<div id="noPromoAlert" class="alert alert-warning alert-dismissable fade in">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    <strong>No Active Promotions going on,Better Luck Next Time!</strong>
</div>
</body>
</html>
