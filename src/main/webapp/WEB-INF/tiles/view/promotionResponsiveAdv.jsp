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
#searchResultContainer{
    height:auto;
}
body {
    color: #555;
    font-family: Avenir Next,Calibri,Helvetica,Roboto,sans-serif;
    font-size: 15px;
    font-weight: 400;
    line-height: 1.6;
}
h1, h2, h3,  h5 {
    margin: 0;
    margin-bottom: .5em;
    padding: 0;
    color: #222;
    font-size: 25px;
    font-weight: 400;
    line-height: 1.25;
}

h4 {
    margin: 0;
    margin-bottom: .5em;
    padding: 0;
    color: rebeccapurple;
    font-size: 15px;
    font-weight: 400;
    line-height: 1.25;
}
h6 {
    margin: 0;
    margin-bottom: .5em;
    padding: 0;
    color: #222;
    font-size: 15px;
    font-weight: 400;
    line-height: 1.25;
}

.code-attached-copy .button {
    display: inline-block;
    width: auto;
    padding: 1.2em .75em;
    border-top-left-radius: 0;
    border-bottom-left-radius: 0;
    vertical-align: middle;
}
#cardAddress{
    height: 1px;
}
#promoDesc{
    border: thin;
    color: orangered;
}
.offer-code{
    border: solid;

}
svg.icon {
    display: inline-block;
    width: 1em;
    height: 1em;
    font-style: normal;
    vertical-align: top;-align: top;
}
.offer-redemption-content {
    margin: 0 auto 1em;
    text-align: center;
}
        /* General sizing */
        ul.dropdown-lr {
            width: 150px;
        }

        /* mobile fix */
        @media (max-width: 768px) {

            }
        .dropdown-lr label {
            color: #eee;
        }
.modal-close, .modal-header .close {
    z-index: 18;
    display: block;
    position: absolute;
    top: .5em;
    right: .5em;
    color: #24b7e3;
    fill: #24b7e3;
    font-size: 20px;
    cursor: pointer;
}
.img-rounded{
    height: 80px;
}
#promoCard{
    background:white ;
    border: 2px;
    border-style: outset;
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


            height: 550px;
            width: auto;
            overflow: hidden;


        }

    #noPromoAlert {
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
    }
        #searchWithfilterBtn{
            width: 70px;
            height:30px;
            align-content: center;
        }
   #searchPanel{
       background-color: orange;
       padding: 5px;

       height: 40px;
       width: auto;
   }
     #promotype{

         border-color: rebeccapurple;
         border-style: solid;
         border-width: 1px;


     }
       #btnPanel {
            display: flex;
            justify-content: center;
            align-items: center;
        }

/*Business Card Css */
.business-card {
    border: 1px solid #cccccc;
    background: #f8f8f8;
    padding: 10px;
    border-radius: 4px;
    margin-bottom: 10px;

}
.profile-img {
    height: 120px;
    background: white;
}
.job {
    color: #666666;
    font-size: 17px;
}
.mail {
    font-size: 16px;
}
@media print{

    #print-view{
        display:block;

    }

    #searchResultContainer {
        visibility:hidden;
    }
   #promoFooter{
        visibility:hidden;
    }
   #promoActions{
       visibility:hidden;
   }

}
#cardContainer{
    background-color: lightblue;
    height: 150px;
    width: 400px;
    overflow-y: auto;
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
            distanceSelected=$('#mileselect').find(":selected").text();
            getPromotions();
        })
        $('#searchWithfilterBtn').on('click', function() {
            distanceSelected=$('#mileselect').find(":selected").text();
            getPromotions();
        })

        
    });
    function submitSearchFromModal(){
        userZip= $("#cityzip").val();
      //  distanceSelected=$('#mileselect').find(":selected").text();
        searchTypeCode="SEARCH_IN_ZIPCODE";
        getPromotions();
        searchTypeCode="";
    }
   function printPromo(){
       var printView = $("#print-view");
       printView.innerHTML = printContent;
       window.print();
   }
</script>

<div class="container-fluid" id="searchResultContainer">

<div class="row" style="background-color: orange;padding:2px">



        <div class="col-sm-2 col-md-2 col-lg-2 col-md-offset-4" id="btnPanel">
            <div class="dropdown">
                <button class="btn btn-warning dropdown-toggle" type="button" data-toggle="dropdown" id="promotype">Where do you want to go?
                    <span class="caret"></span></button>
                <ul class="dropdown-menu">
                    <li>
                        <a href="#" class="small" data-value=-1" tabIndex="-1">
                            <input type="checkbox" id="all"/>&nbsp;All
                        </a>
                    </li>
                    <li>
                        <a href="#" class="small" data-value="1" tabIndex="-1">
                            <input type="checkbox" id="resturantOnly" />&nbsp;Resturant Only
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

                        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp <button type="button" id="searchWithfilterBtn" class="btn btn-info" >Apply</button>

                    </li>
                </ul>
            </div>
            <select class="form-control" id="mileselect" style="font-size: 12px;background-color: orange;width:100px;color: white">
                <option>How Far?</option>
                <option>With in blocks of me</option>
                <option>1 to 2 Miles</option>
                <option>2 to 5 Miles</option>
                <option>More Than 5 Miles</option>
            </select>
        </div>






</div>
    <div class="row">
        <div class="col-xs-6 col-sm-3">.col-xs-6 .col-sm-3</div>
        <div class="col-xs-6 col-sm-3">.col-xs-6 .col-sm-3</div>

        <!-- Add the extra clearfix for only the required viewport -->
        <div class="clearfix visible-xs-block"></div>

        <div class="col-xs-6 col-sm-3">.col-xs-6 .col-sm-3</div>

    </div>
    <div class="row" >
        <div class="col-sm-3" style="" id="cardContainer"></div>
        <div class="clearfix visible-xs-block"></div>
    <div class="col-sm-6" ><div id="map"></div></div>
      <div class="col-sm-4" style="">.col-sm-3</div>
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
<div id="noPromoAlert" class="alert alert-warning alert-dismissable fade in">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    <strong style="color: red">No Active Promotions Going On!</strong>
</div>
<div class="modal fade" id="promoInfoModal" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">


            <div class="modal-header"><span class="modal-close js-close" data-dismiss="modal" aria-label="Close"><svg class="icon icon-close"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#icon-close"></use></svg></span></div>
            <div class="modal-body">

                <div class="business-card" style="background-color: white;border: 0px">
                    <div class="media">
                        <div class="media-left">
                            <img class="media-object img-circle profile-img" src="http://s3.amazonaws.com/37assets/svn/765-default-avatar.png">

                        </div>

                        <div class="media-body" id="promoBusinessInfo">

                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer" id="promoActions" style="text-align: center">
                <button type="button" class="btn btn-warning" >Download</button>
                <button type="button" class="btn btn-warning" onclick="printPromo()">Print</button>
                <button type="button" class="btn btn-warning" > <div class="mail"><a href="mailto:">Email</a> </div></button>

            </div>
        </div>

    </div>
</div>


</body>
</html>
