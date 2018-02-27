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
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script>


  </script>
  <style>
    body {
      font: 14px Montserrat, sans-serif;
      line-height: 1.8;
      color: #f5f6f7;
    }
    label{
      color:black;
    }
    p {font-size: 16px;}
    .margin {margin-bottom: 45px;}
    .bg-1 {
      /* Green */
      color: #ffffff;
    }
    .bg-2 {
      background-color: lightblue; /* Dark Blue */
      color: #ffffff;
    }
    .bg-3 {
      background-color: #ffffff; /* White */
      color: #555555;
    }
    .bg-4 {
      background-color: #2f2f2f; /* Black Gray */
      color: #fff;
    }
    .container-fluid {
      padding-top: 70px;
      padding-bottom: 70px;
    }
    .navbar {
      padding-top: 15px;
      padding-bottom: 15px;
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
<!-- Special version of Bootstrap that only affects content wrapped in .bootstrap-iso -->
<link rel="stylesheet" href="https://formden.com/static/cdn/bootstrap-iso.css" />

<!-- Inline CSS based on choices in "Settings" tab -->
<style>.bootstrap-iso .formden_header h2, .bootstrap-iso .formden_header p, .bootstrap-iso form{font-family: Arial, Helvetica, sans-serif; color: black}.bootstrap-iso form button, .bootstrap-iso form button:hover{color: white !important;} .asteriskField{color: red;}</style>

<!-- HTML Form (wrapped in a .bootstrap-iso div) -->
<div class="bootstrap-iso">
  <div class="container-fluid">
    <div class="row">
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
  </div>
</div>



</body>
</html>

