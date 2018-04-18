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

<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
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
carbonads {
    position: static;
    display: block;
    max-width: 400px;
    padding: 15px 15px 15px 160px;
    margin: 2rem 0;
    overflow: hidden;
    font-size: 13px;
    line-height: 1.4;
    text-align: left;
    background-color: rgba(0,0,0,.05);
}
body {
    color: #555;
    font-family: Avenir Next,Calibri,Helvetica,Roboto,sans-serif;
    font-size: 15px;
    font-weight: 400;
    line-height: 1.6;
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


    #noPromoAlert {
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
    }




.profile-img {
    height: 120px;
    background: white;
}

.mail {
    font-size: 16px;
}
#print-view{
    display:block;
    visibility: hidden;
}
@media print{

    #print-view{
        display:block;
        visibility: visible;
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
   #headerContainer{
       visibility:hidden;
   }

}
#map{


    height: 550px;



}

#cardContainer{
    background-color: white;
    height: auto;
    width: auto;
    overflow-y: scroll;

}
    </style>

</head>
<body>

<script>
    var lat;
    var lng;
   // watchUserPosition();
    $( document ).ready(function() {

        $( "body" ).click(function( event ) {
            var target = $( event.target );
            if ( target.is( "button" ) ) {
                var promotion = target.attr("value");
                preparePromoModal(promotion);
            }


        });
        $("#noPromoAlert").hide();


        $('#mileselect').on('change', function() {
            distanceSelected=$('#mileselect').find(":selected").text();
            getPromotions();
        })
        $('#searchWithfilterBtn').on('click', function() {
            distanceSelected=$('#mileselect').find(":selected").text();
            getPromotions();
        })
        $("#all").change(function ()
            {
                $('input:checkbox').not(this).prop('checked', this.checked);

            }
        );
        
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

 /*  function promoCardEvent(){
       var promoId= $("#promoInfoBtn").val();

       alert(dataArray[promoId]);
       var promoContents= dataArray[promoId].split(":");
       displayPromoInfoModal(promoContents[0],promoContents[1]);
   }*/
</script>

<div class="container-fluid" id="searchResultContainer">


    <div class="row">
        <!--   <div class="col-xs-6 col-sm-3">.col-xs-6 .col-sm-3</div>
           <div class="col-xs-6 col-sm-3">.col-xs-6 .col-sm-3</div>
   -->
           <!-- Add the extra clearfix for only the required viewport -->
        <div class="clearfix visible-xs-block"></div>

        <!--  <div class="col-xs-6 col-sm-3">.col-xs-6 .col-sm-3</div> -->

    </div>

    <div class="row" >
        <div class="col-sm-3 col-md-5 col-lg-3" style="" >
            <div class="container" >
            <div class="list-group" id="cardContainer">

                </div>
            </div>

        </div>

    <div class="col-sm-6 col-md-7 col-lg-7" id="map"></div>

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
    <strong style="color: red">No Active Promotions!</strong>
</div>
<div class="modal fade" id="promoInfoModal" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">


            <div class="modal-header"><span class="modal-close js-close" data-dismiss="modal" aria-label="Close"><svg class="icon icon-close"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#icon-close"></use></svg></span></div>
            <div class="modal-body">

                <div class="business-card" style="background-color: white;border: 0px" id="promoDetailModal">
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
                <button type="button" class="btn btn-warning" onclick="takeScreenShot()">Download</button>
                <button type="button" class="btn btn-warning" onclick="printPromo()">Print</button>
                <button type="button" class="btn btn-warning" > <div class="mail"><a href="mailto:" id="promoEmailLink">Email</a> </div></button>

            </div>
        </div>

    </div>
</div>


</body>
</html>
