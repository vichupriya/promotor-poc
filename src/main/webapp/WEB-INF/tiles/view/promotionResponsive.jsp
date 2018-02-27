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
<title>W3.CSS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="generator" content="Mobirise v4.6.5, mobirise.com">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
<link rel="shortcut icon" href="/assets/images/logo.png" type="image/x-icon">
<meta name="description" content="">
<title>Home</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic&subset=latin">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat:400,700">
<link rel="stylesheet" href="/assets/tether/tether.min.css">
<link rel="stylesheet" href="/assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/assets/dropdown/css/style.css">
<link rel="stylesheet" href="/assets/animate.css/animate.min.css">
<link rel="stylesheet" href="/assets/theme/css/style.css">
<link rel="stylesheet" href="/assets/mobirise/css/mbr-additional.css" type="text/css">

<script src="/assets/tether/tether.min.js"></script>
<script src="/assets/bootstrap/js/bootstrap.min.js"></script>
<script src="/assets/smooth-scroll/smooth-scroll.js"></script>
<script src="/assets/dropdown/js/script.min.js"></script>
<script src="/assets/touch-swipe/jquery.touch-swipe.min.js"></script>
<script src="/assets/viewport-checker/jquery.viewportchecker.js"></script>
<script src="/assets/theme/js/script.js"></script>
<script src="/assets/formoid/formoid.min.js"></script>
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
        #map{
            height: 680px;
            overflow: hidden;
            padding-bottom: 22.25%;
            padding-top: 30px;
            position: relative;
        }

    #noPromoAlert {
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
    }
    #mileselect{
        width: 308px;

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
        
    });
    function submitSearchFromModal(){
        $("#userZipCode").val($("searchZipCode").val());
        getPromotions();
    }
   
</script>
<section id="ext_menu-b" data-rv-view="113">

    <nav class="navbar navbar-dropdown navbar-fixed-top">
        <div class="container">

            <div class="mbr-table">
                <div class="mbr-table-cell">

                    <div class="navbar-brand">
                        <a href="https://promoweb.cfapps.io" class="navbar-logo"><img src="assets/images/logo.png" alt="Mobirise"></a>
                        <a class="navbar-caption" href="https://promoweb.cfapps.io">PROMO</a>
                    </div>

                </div>

                <div class="mbr-table-cell">

                    <button class="navbar-toggler pull-xs-right hidden-md-up" type="button" data-toggle="collapse" data-target="#exCollapsingNavbar">
                        <div class="hamburger-icon"></div>
                    </button>

                    <ul class="nav-dropdown collapse pull-xs-right nav navbar-nav navbar-toggleable-sm" id="exCollapsingNavbar">

                        <li class="nav-item"><a class="nav-link link" href=""><li class="dropdown">
                        <a href="http://phpoll.com/login" class="dropdown-toggle" data-toggle="dropdown">Log In <span class="caret"></span></a>
                        <ul class="dropdown-menu dropdown-lr animated slideInRight" role="menu">
                            <div class="col-lg-12">
                                <div class="text-center"><h3><b>Log In</b></h3></div>
                                <form id="ajax-login-form" action="http://phpoll.com/login/process" method="post" role="form" autocomplete="off">
                                    <div class="form-group">
                                        <label for="username">Username</label>
                                        <input type="text" name="username" id="username" tabindex="1" class="form-control" placeholder="Username" value="" autocomplete="off">
                                    </div>

                                    <div class="form-group">
                                        <label for="password">Password</label>
                                        <input type="password" name="password" id="password" tabindex="2" class="form-control" placeholder="Password" autocomplete="off">
                                    </div>

                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-xs-7">
                                                <input type="checkbox" tabindex="3" name="remember" id="remember">
                                                <label for="remember"> Remember Me</label>
                                            </div>
                                            <div class="col-xs-5 pull-right">
                                                <input type="submit" name="login-submit" id="login-submit" tabindex="4" class="form-control btn btn-success" value="Log In">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="text-center">
                                                    <a href="http://phpoll.com/recover" tabindex="5" class="forgot-password">Forgot Password?</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <input type="hidden" class="hide" name="token" id="token" value="a465a2791ae0bae853cf4bf485dbe1b6">
                                </form>
                            </div>
                        </ul>
                    </li></a></li>





                        <li class="nav-item"><a class="nav-link link" href="https://mobirise.com/"></a></li><li class="nav-item"><a class="nav-link link" href="https://promoweb.cfapps.io">HELP</a></li><li class="nav-item nav-btn"></li><li class="nav-item nav-btn"></li></ul>
                    <button hidden="" class="navbar-toggler navbar-close" type="button" data-toggle="collapse" data-target="#exCollapsingNavbar">
                        <div class="close-icon"></div>
                    </button>

                </div>
            </div>

        </div>
    </nav>

</section>

<section class="mbr-section form2 mbr-background mbr-after-navbar" id="form2-h" data-rv-view="115" style="background-image: url('/assets/images/jumbotron.jpg'); padding-top: 95px; padding-bottom: 5px;">

    <div class="mbr-section mbr-section__container mbr-section__container--middle">

        <div class="container">
            <div class="row">


                    <form>


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

                        <h6>How Far?</h6>
                        <select class="form-control" id="mileselect" >
                            <option>With in blocks of me</option>
                            <option>1 to 2 Miles</option>
                            <option>2 to 5 Miles</option>
                            <option>More Than 5 Miles</option>
                        </select>

                    </form>

            </div>
        </div>
    </div>
</section>
<form id="searchForm" action="${pageContext.request.contextPath}/activepromotions"></form>


    <div id="map"></div>


    </div>
<footer class="mbr-small-footer mbr-section mbr-section-nopadding" id="footer1-k" data-rv-view="123" style="background-color: rgb(50, 50, 50); padding-top: 1.75rem; padding-bottom: 1.75rem;">

    <div class="container text-xs-center">
        <p>Copyright (c) 2016 Promo.</p>
    </div>
</footer>


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
