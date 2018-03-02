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


  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

  <style>

  </style>
</head>
<body>
<script>
    $( document ).ready(function() {
        $( "#guestLogin" ).click(function() {
            $( "#loginForm" ).submit();
        });
    });


</script>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>


<!-- First Container -->
<div id="section1" class="container-fluid bg-1 text-center" >
  <div class="container"></div>
  <div class="container">
    <div class="row ">
      <div class="col-md-4 col-md-offset-7 ">
        <div class="panel panel-default bg-1 ">
          <div class="panel-heading"> <strong class="">Login</strong>

          </div>
          <form:form id="loginForm" method="post" action="/login" modelAttribute="loginAccount">

          <div class="panel-body">
            <div class="form-group">
              <label label-default="" for="inputUser" class="col-sm-4 control-label ">Email</label>
              <div class="col-sm-8">
                <form:input path="userName" class="form-control" id="inputUser" placeholder="UserName" required="" type="text"/>
              </div>
            </div>
            <div class="form-group">
              <label label-default="" for="inputPassword" class="col-sm-4 control-label">Password</label>
              <div class="col-sm-8">
                <form:input path="accountPassword" class="form-control" id="inputPassword" placeholder="Password" required="" type="password"/>
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
          </form:form>
           <table align="center">
                          <tr>
                              <td style="font-style: italic; font-weight:bold;color: red;">${message}</td>
                          </tr>
                      </table>
          <div class="panel-footer" style="color:black">Not Registered? <a href="#myUser" data-toggle="modal" class="lnk">Register here</a></div>
          <button type="button" class="btn btn-link" id="guestLogin">Continue As Guest</button>
          <div class="panel-footer" style="color:black">Promote Your Business? <a href="${contextPath}/businessRegistration" data-toggle="modal" class="lnk">Register here</a></div>

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

            <h1 class="text-center"><a href="businessRegistration.jsp" role="button" class="btn btn-primary" data-toggle="modal" data-target="#businessReg">Business</a></h1>

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

<%--@elvariable id="individualAccount" type=""--%>
<form:form method="post" action="/registerUser" commandName="individualAccount">
  <form:hidden path="type" />
  <input id="type" name="type" type="hidden" value="Individual"/>
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
                  <form:input path="userName" pathname="email" id="userName" class="form-control input-sm" placeholder="Email Address" type="email"/>
                </div>

                <div class="row">
                  <div class="col-xs-6 col-sm-6 col-md-6">
                    <div class="form-group">
                      <form:input path="accountPassword" name="password" id="accountPassword" class="form-control input-sm" placeholder="Password" type="password"/>
                    </div>
                  </div>
                  <div class="col-xs-6 col-sm-6 col-md-6">
                    <div class="form-group">
                      <input name="password_confirmation" id="password_confm" class="form-control input-sm" placeholder="Confirm Password" type="password">
                    </div>
                  </div>
                </div>

                <div class="row submit-row" >
                  <div class="btn-group btn-group-justified" role="group" aria-label="...">

                    <div class="btn-group" role="group">
                      <button type="button" data-dismiss="modal" class="btn btn-danger">Cancel</button>
                    </div>
                    <div class="btn-group" role="group">
                      <button type="submit" class="btn btn-primary">Register</button>
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
</form:form>


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



</body>
</html>

