<%--
  Created by IntelliJ IDEA.
  User: skvpsid
  Date: 11/28/2017
  Time: 1:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
      background-color: orange; /* Green */
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

<!-- Navbar -->
<nav class="navbar navbar-default">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">Logo</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#section1">About Us</a></li>
        <li><a href="#section2">Reviews</a></li>
        <li><a href="#section3">Help</a></li>
      </ul>
    </div>
  </div>
</nav>

<!-- First Container -->
<div id="section1" class="container-fluid bg-1 text-center" >
  <div class="container"></div>
  <div class="container">
    <div class="row ">
      <div class="col-md-4 col-md-offset-7 ">
        <div class="panel panel-default bg-1 ">
          <div class="panel-heading"> <strong class="">Login</strong>

          </div>
          <div class="panel-body">
            <div class="form-group">
              <label label-default="" for="inputEmail3" class="col-sm-4 control-label ">Email</label>
              <div class="col-sm-8">
                <input class="form-control" id="inputEmail3" placeholder="Email" required="" type="email">
              </div>
            </div>
            <div class="form-group">
              <label label-default="" for="inputPassword3" class="col-sm-4 control-label">Password</label>
              <div class="col-sm-8">
                <input class="form-control" id="inputPassword3" placeholder="Password" required="" type="password">
              </div>
            </div>
            <div class="form-group">
              <div class="col-sm-offset-3 col-sm-9">
                <div class="checkbox">
                  <label label-default="" class="" style="color:black">
                    <input class="" type="checkbox" >Remember me</label>
                </div>
              </div>
            </div>
            <div class="form-group last">
              <div class="col-sm-offset-3 col-sm-9">
                <button type="submit" class="btn btn-success btn-sm">Sign in</button>
                <button type="reset" class="btn btn-default btn-sm" style="background:lightblue;color:white">Reset</button>
              </div>
            </div>
          </div>
          <div class="panel-footer" style="color:black">Not Registered? <a href="#myModal" data-toggle="modal" class="lnk">Register here</a>

          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="container">
  <!-- Trigger the modal with a button -->



  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" style="color:red">SignUp as...</h4>
          <div  class="btn-group">

            <h1 class="text-center"><a href="#myBusiness" role="button" class="btn btn-primary" data-toggle="modal" data-target="#myBusiness">Business</a></h1>

            <h1 class="text-center"><a href="#myUser" role="button" class="btn btn-primary" data-toggle="modal" data-target="#myUser">Individual</a></h1>



          </div>


          <div class="modal-footer">
            <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
          </div>
        </div>
      </div>
    </div>
  </div>

</div>
<!--START-->


<!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
<div id="myUser" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
  <div class="modal-dialog">

    <div class="container">
      <div class="row centered-form">
        <div class="col-xs-12 col-sm-8 col-md-4 col-sm-offset-2 col-md-offset-1">
          <div class="panel panel-default">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <div class="panel-body">
              <form role="form">
                <div class="row">
                  <div class="col-xs-6 col-sm-6 col-md-6">
                    <div class="form-group">
                      <input name="first_name" id="first_name" class="form-control input-sm" placeholder="First Name" type="text">
                    </div>
                  </div>
                  <div class="col-xs-6 col-sm-6 col-md-6">
                    <div class="form-group">
                      <input name="last_name" id="last_name" class="form-control input-sm" placeholder="Last Name" type="text">
                    </div>
                  </div>
                </div>

                <div class="form-group">
                  <input name="email" id="email" class="form-control input-sm" placeholder="Email Address" type="email">
                </div>

                <div class="row">
                  <div class="col-xs-6 col-sm-6 col-md-6">
                    <div class="form-group">
                      <input name="password" id="password" class="form-control input-sm" placeholder="Password" type="password">
                    </div>
                  </div>
                  <div class="col-xs-6 col-sm-6 col-md-6">
                    <div class="form-group">
                      <input name="password_confirmation" id="password_confirmation" class="form-control input-sm" placeholder="Confirm Password" type="password">
                    </div>
                  </div>
                </div>

                <div class="row submit-row" >
                  <div class="btn-group btn-group-justified" role="group" aria-label="...">

                    <div class="btn-group" role="group">
                      <button type="button" data-dismiss="modal" class="btn btn-danger">Cancel</button>
                    </div>
                    <div class="btn-group" role="group">
                      <button type="button" class="btn btn-primary">Register</button>
                    </div>
                  </div>
                </div><!--row-->

              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>


<!-- ###################################################################### -->

<div id="myBusiness" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
  <div class="modal-dialog">

    <div class="container">
      <div class="row centered-form">
        <div class="col-xs-12 col-sm-8 col-md-4 col-sm-offset-2 col-md-offset-1">
          <div class="panel panel-default">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <div class="panel-body">
              <form role="form">
                <div class="form-group">
                  <label class="col-sm-10 control-label" for="textinput">Business Details</label>
                </div>
                <div class="form-group">
                  <input name="businessname" id="businessname" class="form-control input-sm" placeholder="Business Name" type="text">
                </div>
                <!-- Street Address -->
                <div class="row">
                  <div class="col-xs-6 col-sm-6 col-md-6">
                    <div class="form-group">
                      <input name="street1" id="street1" class="form-control input-sm" placeholder="Street Address1" type="text">
                    </div>
                  </div>
                  <div class="col-xs-6 col-sm-6 col-md-6">
                    <div class="form-group">
                      <input name="street2" id="street2" class="form-control input-sm" placeholder="Street Address2" type="text">
                    </div>
                  </div>
                </div>
                <!-- City & State -->
                <div class="row">
                  <div class="col-xs-6 col-sm-6 col-md-6">
                    <div class="form-group">
                      <input name="city" id="city" class="form-control input-sm" placeholder="City" type="text">
                    </div>
                  </div>
                  <div class="col-xs-6 col-sm-6 col-md-6">
                    <div class="form-group">
                      <input name="state" id="state" class="form-control input-sm" placeholder="State" type="text">
                    </div>
                  </div>
                </div>
                <!-- Country & Zipcode -->
                <div class="row">
                  <div class="col-xs-6 col-sm-6 col-md-6">
                    <div class="form-group">
                      <select name="country" type="text" value="" class="form-control" required="required">
                        <option selected="selected" disabled="disabled" value="">Select Country</option>
                        <option value="8">
                          ALBANIA
                        </option><option value="12">
                        ALGERIA
                      </option><option value="20">
                        ANDORRA
                      </option><option value="24">
                        ANGOLA
                      </option><option value="28">
                        ANTIGUA AND BARBUDA
                      </option><option value="31">
                        AZERBAIJAN
                      </option><option value="32">
                        ARGENTINA
                      </option><option value="36">
                        AUSTRALIA
                      </option><option value="40">
                        AUSTRIA
                      </option><option value="44">
                        BAHAMAS
                      </option><option value="48">
                        BAHRAIN
                      </option><option value="51">
                        ARMENIA
                      </option><option value="52">
                        BARBADOS
                      </option><option value="56">
                        BELGIUM
                      </option><option value="60">
                        BERMUDA
                      </option><option value="64">
                        BHUTAN
                      </option><option value="68">
                        BOLIVIA
                      </option><option value="70">
                        BOSNIA-HERZEGOVINA
                      </option><option value="72">
                        BOTSWANA
                      </option><option value="76">
                        BRAZIL
                      </option>
                      </select>
                    </div>
                  </div>
                  <div class="col-xs-6 col-sm-6 col-md-6">
                    <div class="form-group">
                      <input name="zipcode" id="zipcode" class="form-control input-sm" placeholder="Zipcode" type="text">
                    </div>
                  </div>
                </div>
                <!-- Contact Details -->
                <div class="form-group">
                  <label class="col-sm-10 control-label" for="textinput">Contact Details</label>
                </div>
                <!-- Contact Person Name -->
                <div class="form-group">
                  <input name="contact_name" id="contact_name" class="form-control input-sm" placeholder="Contact Person Name" type="text">
                </div>

                <!-- Email -->
                <div class="form-group">
                  <input name="email" id="email" class="form-control input-sm" placeholder="Email Address" type="email">
                </div>
                <!-- Mobile# -->
                <div class="form-group">
                  <input name="mobile" id="mobile" class="form-control input-sm" placeholder="Mobile#" type="text">
                </div>
                <!-- Work# -->
                <div class="form-group">
                  <input name="work" id="work" class="form-control input-sm" placeholder="Work#" type="text">
                </div>
                <div class="row">
                  <div class="col-xs-6 col-sm-6 col-md-6">
                    <div class="form-group">
                      <input name="password" id="password" class="form-control input-sm" placeholder="Password" type="password">
                    </div>
                  </div>
                  <div class="col-xs-6 col-sm-6 col-md-6">
                    <div class="form-group">
                      <input name="password_confirmation" id="password_confirmation" class="form-control input-sm" placeholder="Confirm Password" type="password">
                    </div>
                  </div>
                </div>

                <div class="row submit-row" >
                  <div class="btn-group btn-group-justified" role="group" aria-label="...">

                    <div class="btn-group" role="group">
                      <button type="button" data-dismiss="modal" class="btn btn-danger">Cancel</button>
                    </div>
                    <div class="btn-group" role="group">
                      <button type="button" class="btn btn-primary">Register</button>
                    </div>
                  </div>
                </div><!--row-->

              </form>
            </div>
          </div>
        </div>


      </div>
    </div>
  </div>
</div>


<!-- ###################################################################### -->



<!-- END -->

<!-- Second Container -->
<div id="section2" class="container-fluid bg-2 text-center">
  <h3 class="margin">Reviews</h3>
  <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. </p>
  <a href="#" class="btn btn-default btn-lg">
    <span class="glyphicon glyphicon-search"></span> Search
  </a>
</div>

<!-- Third Container (Grid) -->
<div id="section3" class="container-fluid bg-3 text-center">
  <h3 class="margin">Where To Find Me?</h3><br>
  <div class="row">
    <div class="col-sm-4">
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
      <img src="birds1.jpg" class="img-responsive margin" style="width:100%" alt="Image">
    </div>
    <div class="col-sm-4">
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
      <img src="birds2.jpg" class="img-responsive margin" style="width:100%" alt="Image">
    </div>
    <div class="col-sm-4">
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
      <img src="birds3.jpg" class="img-responsive margin" style="width:100%" alt="Image">
    </div>
  </div>
</div>

<!-- Footer -->
<footer class="container-fluid bg-4 text-center">
  <p>Theme Made By <a href="">PriyaSujith</a></p>
</footer>

</body>
</html>

