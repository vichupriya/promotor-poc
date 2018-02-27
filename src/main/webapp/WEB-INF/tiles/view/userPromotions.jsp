<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8' />
    <title>Display a popup</title>



    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        body { margin:0; padding:0; }
        #map { position:absolute; top:0; bottom:0; width:100%; }
        .row{
            padding-top:25px;
        }


        card {
            display: block;
            margin-bottom: 20px;
            line-height: 1.42857143;
            background-color: #fff;
            border-radius: 2px;
            box-shadow: 0 2px 5px 0 rgba(0,0,0,0.16),0 2px 10px 0 rgba(0,0,0,0.12);
            transition: box-shadow .25s;
        }
        .card:hover {
            box-shadow: 0 8px 17px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
        }
        .img-card {
            width: 100%;
            height:200px;
            border-top-left-radius:2px;
            border-top-right-radius:2px;
            display:block;
            overflow: hidden;
        }
        .img-card img{
            width: 100%;
            height: 200px;
            object-fit:cover;
            transition: all .25s ease;
        }
        .card-content {
            padding:15px;
            text-align:left;
        }
        .card-title {
            margin-top:0px;
            font-weight: 700;
            font-size: 1.65em;
        }
        .card-title a {
            color: #000;
            text-decoration: none !important;
        }
        .card-read-more {
            border-top: 1px solid #D4D4D4;
        }
        .card-read-more a {
            text-decoration: none !important;
            padding:10px;
            font-weight:600;
            text-transform: uppercase
        }
    </style>
</head>

<body>
<script>
    var milesSelected;
    var resturantTypeSelected;
    $('#businessType').on('change', function() {
        $("#promotions").empty();
        resturantTypeSelected = $('#businessType').find(":selected").text();
        milesSelected = $('#mileselect').find(":selected").text();
        url ='https://promoprofiler.cfapps.io/promotions/search/'+pos.lat+':'+pos.lng+'/'+milesSelected+'/'+resturantTypeSelected;
        $.getJSON( url, function( data ) {



            $.each(data,function (i,promotions) {


                var content = '<div class="col-xs-12 col-sm-4">\n' +
                    '            <div class="card">\n' +
                    '                <a class="img-card" href="http://www.fostrap.com/">\n' +
                    '                    <img src="https://png.pngtree.com/thumb_back/fw800/back_pic/05/14/55/8259a74b3207b2b.jpg"/>\n' +
                    '                </a>\n' +
                    '                <br />\n' +
                    '                <div class="card-content">\n' +
                    '                    <h4 class="card-title">\n' +
                    '                        <a href="http://www.fostrap.com/">\n'+promotions.promotionDescription+
                    '                        </a>\n' +
                    '                    </h4>\n' +
                    '                    <div class="">\n' +
                    '                        New Delhi, 2005, Petrol\n' +
                    '                    </div>\n' +
                    '                </div>\n' +
                    '                <div class="card-read-more">\n' +
                    '                    <a class="btn btn-link btn-block" href="http://www.fostrap.com/">\n' +
                    '                        Details\n' +
                    '                    </a>\n' +

                    '                </div>\n' +
                    '            </div>\n' +
                    '        </div>';
                $("#promotions").append(content);
            });
        });
    })
    $('#mileselect').on('change', function() {
        $("#promotions").empty();
        milesSelected = $('#mileselect').find(":selected").text();
        url ='https://promoprofiler.cfapps.io/promotions/search/'+pos.lat+':'+pos.lng+'/'+milesSelected+'/'+resturantTypeSelected;
        $.getJSON( url, function( data ) {



            $.each(data,function (i,promotions) {


                var content = '<div class="col-xs-12 col-sm-4">\n' +
                    '            <div class="card">\n' +
                    '                <a class="img-card" href="http://www.fostrap.com/">\n' +
                    '                    <img src="https://png.pngtree.com/thumb_back/fw800/back_pic/05/14/55/8259a74b3207b2b.jpg"/>\n' +
                    '                </a>\n' +
                    '                <br />\n' +
                    '                <div class="card-content">\n' +
                    '                    <h4 class="card-title">\n' +
                    '                        <a href="http://www.fostrap.com/">\n'+promotions.promotionDescription+
                    '                        </a>\n' +
                    '                    </h4>\n' +
                    '                    <div class="">\n' +
                    '                        New Delhi, 2005, Petrol\n' +
                    '                    </div>\n' +
                    '                </div>\n' +
                    '                <div class="card-read-more">\n' +
                    '                    <a class="btn btn-link btn-block" href="http://www.fostrap.com/">\n' +
                    '                        Details\n' +
                    '                    </a>\n' +

                    '                </div>\n' +
                    '            </div>\n' +
                    '        </div>';
                $("#promotions").append(content);
            });
        });
    })
    var url;
    var pos;
    $( document ).ready(function() {
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(function(position) {
                pos = {
                    lat: position.coords.latitude,
                    lng: position.coords.longitude
                };


                var milesSelected=20;
                milesSelected = $('#mileselect').find(":selected").text();
                url ='https://promoprofiler.cfapps.io/promotions/search/'+pos.lat+':'+pos.lng+'/'+milesSelected+'/'+resturantTypeSelected;
                $.getJSON( url, function( data ) {
                         $.each(data,function (i,promotions) {


                        var content = '<div class="col-xs-12 col-sm-4">\n' +
                            '            <div class="card">\n' +
                            '                <a class="img-card" href="http://www.fostrap.com/">\n' +
                            '                    <img src="https://png.pngtree.com/thumb_back/fw800/back_pic/05/14/55/8259a74b3207b2b.jpg"/>\n' +
                            '                </a>\n' +
                            '                <br />\n' +
                            '                <div class="card-content">\n' +
                            '                    <h4 class="card-title">\n' +
                            '                        <a href="http://www.fostrap.com/">\n'+promotions.promotionDescription+
                            '                        </a>\n' +
                            '                    </h4>\n' +
                            '                    <div class="">\n' +
                            '                        New Delhi, 2005, Petrol\n' +
                            '                    </div>\n' +
                            '                </div>\n' +
                            '                <div class="card-read-more">\n' +
                            '                    <a class="btn btn-link btn-block" href="http://www.fostrap.com/">\n' +
                            '                        Details\n' +
                            '                    </a>\n' +

                            '                </div>\n' +
                            '            </div>\n' +
                            '        </div>';
                        $("#promotions").append(content);
                    });
                }).done(function (data) {
                    if(data.length ==0)
                        $("#promotions").empty();
                    $.each(data,function (i,promotions) {


                        var content = '<div class="col-xs-12 col-sm-4">\n' +
                            '            <div class="card">\n' +
                            '                <a class="img-card" href="http://www.fostrap.com/">\n' +
                            '                    <img src="https://png.pngtree.com/thumb_back/fw800/back_pic/05/14/55/8259a74b3207b2b.jpg"/>\n' +
                            '                </a>\n' +
                            '                <br />\n' +
                            '                <div class="card-content">\n' +
                            '                    <h4 class="card-title">\n' +
                            '                        <a href="http://www.fostrap.com/">\n'+promotions.promotionDescription+
                            '                        </a>\n' +
                            '                    </h4>\n' +
                            '                    <div class="">\n' +
                            '                        New Delhi, 2005, Petrol\n' +
                            '                    </div>\n' +
                            '                </div>\n' +
                            '                <div class="card-read-more">\n' +
                            '                    <a class="btn btn-link btn-block" href="http://www.fostrap.com/">\n' +
                            '                        Details\n' +
                            '                    </a>\n' +

                            '                </div>\n' +
                            '            </div>\n' +
                            '        </div>';
                        $("#promotions").append(content);
                    });
                });

// map.setCenter(pos);
            }, function() {
                handleLocationError(true, infoWindow, map.getCenter());
            });
        } else {
// Browser doesn't support Geolocation
            handleLocationError(false, infoWindow, map.getCenter());

        }



    });
</script>

<div class="container">
    <div class="row" id="promotions">

    </div>
</div>




</body>
</html>