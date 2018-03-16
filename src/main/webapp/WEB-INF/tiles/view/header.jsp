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
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script>


  </script>
  <style>


    p {font-size: 16px;}

    #advSection{
      border: solid;
      border-width: 1px;
    }
    .navbar {
      background-color:#5b5b5b;
      padding-top: 15px;
      padding-bottom: 1px;
      border: 0;
      border-radius: 0;
      margin-bottom: 0;
      font-size: 12px;
      letter-spacing: 5px;
    }
    .navbar-nav  li a:hover {
      color: #1abc9c !important;
    }
  </style>
</head>
<body>
<script>

    $(document).ready(function(){

        $( "#navZipcodeSearchForm" ).submit(function( event ) {
            userZip= $("#zipCodeGloabalSearchText").val();
            searchTypeCode="SEARCH_IN_ZIPCODE";
            getPromotions();
            searchTypeCode="";
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
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#" style="color: orange">PROMO</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">

        <li><a href="${contextPath}/">Home</a></li>

      </ul>
      <ul class="nav navbar-nav navbar-right">
        <form class="navbar-form navbar-left" id="navZipcodeSearchForm" action="javascript:submitSearchInZipCode();">
          <div class="input-group">
            <input type="text" id="zipCodeGloabalSearchText" class="form-control" placeholder="Search in Zipcode" data-toggle="popover" data-trigger="hover" data-placement="bottom" data-content="Vivamus
sagittis lacus vel augue laoreet rutrum faucibus.">

            <div class="input-group-btn">
              <button class="btn btn-default" type="button" id="btnZipSearch" onclick="submitSearchInZipCode()">
                <i class="glyphicon glyphicon-search"></i>
              </button>
            </div>
          </div>
        </form>

        <li><a href="${contextPath}/businessRegistration"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
        <li><a href="${contextPath}/signin"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </ul>
    </div>
  </div>
</nav>



</body>
</html>

