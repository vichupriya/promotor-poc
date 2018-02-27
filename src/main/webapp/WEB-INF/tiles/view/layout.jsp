<%--
  Created by IntelliJ IDEA.
  User: skvpsid
  Date: 11/28/2017
  Time: 1:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
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
<div><tiles:insertAttribute name="header" /></div>
        <div style="float:left;padding:10px;width:15%;"><tiles:insertAttribute name="menu" /></div>
        <div style="float:left;padding:10px;width:80%;border-left:1px solid pink;">
        <tiles:insertAttribute name="body" /></div>
        <div style="clear:both"><tiles:insertAttribute name="footer" /></div>
</body>
</html>

