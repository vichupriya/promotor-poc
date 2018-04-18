<%--
  Created by IntelliJ IDEA.
  User: skvpsid
  Date: 11/28/2017
  Time: 1:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>

  <!-- Theme Made By Priya Sujith - No Copyright -->
  <title>Promo</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  <script>


  </script>
  <style>


    p {font-size: 16px;}

    #advSection{
      border: solid;
      border-width: 1px;
    }
    #searchInput {
        background-color: #5b5b5b;
        border-bottom: 1px solid grey;
        border-color: #E0960E;
      padding-top: 15px;
      padding-bottom: 1px;



    }
    .navbar-nav  li a:hover {
      color: #1abc9c !important;
    }
    #dropdown {
        font-family: "Times New Roman", Times, serif;
        font-size: 17px;

    }
    #mileselect
    {
        font-family: "Times New Roman", Times, serif;
        font-size: 17px;

    }
    #btnPanel {
        display: flex;


    }


  </style>
</head>
<body>
<script>

    $(document).ready(function(){

        $( "#logoutbtn").hide();
        $("#currentLoc").hide();


        $( "#navZipcodeSearchForm" ).submit(function( event ) {
            userZip= $("#zipCodeGloabalSearchText").val();
            searchTypeCode="SEARCH_IN_ZIPCODE";
            getPromotions();
            searchTypeCode="";
        })
        $( "#currentLocMenuItem" ).click(function( event ) {
            //$("#zipCodeGloabalSearchText").val("Current Location");
            getPromotions();

        })


    });

    function submitSearchInZipCode(){
        userZip= $("#zipCodeGloabalSearchText").val();
        searchTypeCode="SEARCH_IN_ZIPCODE";
        getPromotions();
        searchTypeCode="";
    }
</script>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!-- Navbar -->
<div class="container-fluid" style="background-color: orange" id="headerContainer">
    <div class="row" style="padding: 5px">
        <div class="col-sm-4 col-md-4 col-lg-4" style="text-align: center">
            <h1 style="color: white"><a href="${contextPath}/">PROMO</a></h1>
           </div>
        <div class="col-sm-2 col-md-4 col-lg-4" id="globalSearchDiv" >

             <div class="input-group" style="width: 250px">

            <input type="text" id="zipCodeGloabalSearchText" class="form-control" placeholder="Search in Zipcode" >

            <div class="input-group-append" style="float: none">

                <button class="btn btn-outline-secondary dropdown-toggle" style="background-color: skyblue"type="button" id="" onclick="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">

                </button>
                <div class="dropdown-menu">

                    <a class="dropdown-item" href="#"> <span class="glyphicon glyphicon-chevron-up" aria-hidden="true" id="currentLocMenuItem"> CurrentLocation</span></a>

                </div>
                <button class="btn btn-success" type="button" id="btnZipSearch" onclick="submitSearchInZipCode()">
                    <i class="glyphicon glyphicon-search" style="height: 23px"></i>
                </button>
            </div>



            </div>

        </div>
        <div class="col-sm-4 col-md-4 col-lg-4" style="text-align: center"> <button class="btn btn-link" type="button" style="font-size: large"><a href="${contextPath}/businessRegistration">SignUp</a></button>
            <button id="loginbtn" class="btn btn-link" type="button" style="font-size: large"><a href="${contextPath}/signin" id="loginlink">Login</a></button>
            <button id="logoutbtn" class="btn btn-link" type="button" style="font-size: large"><a href="${contextPath}/signout" id="logoutlink">LogOut</a></button></div>   </div>

    </div>

<nav class="navbar navbar-inverse" id="searchInput">
  <div class="container-fluid">
   <div class="row">



        <div class="col-sm-2 col-md-2 col-lg-2 col-md-offset-4" id="btnPanel">
            
            <div class="dropdown">
                <button class="btn btn-warning dropdown-toggle" type="button" data-toggle="dropdown" id="promotype" style="background-color: orange;font-size: 12px;margin-right:3px;">Where do you want to go?
                   </button>
                <ul class="dropdown-menu"  id="dropdown">
                    <li>
                        <a href="#" class="small" data-value=-1" tabIndex="-1">
                            <input type="checkbox" id="all"/>&nbsp;All
                        </a>
                    </li>
                    <li>
                        <a href="#" class="small" data-value="1" tabIndex="-1">
                            <input type="checkbox" id="resturantOnly" />&nbsp;Restaurant Only
                        </a>
                    </li>
                    <li>
                        <a href="#" class="small" data-value="2" tabIndex="-1">
                            <input type="checkbox" id="bar"/>&nbsp;Bar
                        </a>
                    </li>
                    <li>
                        <a href="#" class="small" data-value="3" tabIndex="-1">
                            <input type="checkbox" id="sportsBar"/>&nbsp;Sports Bar
                        </a>
                    </li>
                    <li>
                        <a href="#" class="small" data-value="4" tabIndex="-1">
                            <input type="checkbox" id="pubtavern"/>&nbsp;Pub/Tavern
                        </a>
                    </li>

                    <li>
                        <a href="#" class="small" data-value="5" tabIndex="-1">
                            <input type="checkbox" id="microbrew"/>&nbsp;MicroBrew
                        </a>
                    </li>

                    <li>

                        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp <button type="button" id="searchWithfilterBtn" class="btn btn-info" style="font-size: 15px;" >Apply</button>

                    </li>
                </ul>
            </div>
            <select class="form-control" id="mileselect" style="font-size: 12px;background-color: orange;width:100px;">
                <option style="background-color: white">How Far?</option>
                <option style="background-color: white">With in blocks of me</option>
                <option style="background-color: white">1 to 2 Miles</option>
                <option style="background-color: white">2 to 5 Miles</option>
                <option style="background-color: white">More Than 5 Miles</option>
            </select>
        </div>






</div>



      </div>
  </div>
</nav>



</body>
</html>

