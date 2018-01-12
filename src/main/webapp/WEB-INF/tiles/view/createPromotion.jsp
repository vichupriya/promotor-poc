<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Registration Form</title>

  </head>
  <%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <body>
  <form:form method="post" action="/createPromotion" modelAttribute="promotion">
  <!-- Special version of Bootstrap that only affects content wrapped in .bootstrap-iso -->
  <link rel="stylesheet" href="https://formden.com/static/cdn/bootstrap-iso.css" />

  <!-- Inline CSS based on choices in "Settings" tab -->
  <style>.bootstrap-iso .formden_header h2, .bootstrap-iso .formden_header p, .bootstrap-iso form{font-family: Arial, Helvetica, sans-serif; color: black}.bootstrap-iso form button, .bootstrap-iso form button:hover{color: white !important;} .asteriskField{color: red;}</style>

  <!-- HTML Form (wrapped in a .bootstrap-iso div) -->
  <div class="bootstrap-iso">
      <div class="container-fluid">
          <div class="row">
              <div class="col-md-6 col-sm-6 col-xs-12">

                      <div class="form-group ">
                          <label class="control-label " for="message">
                              Description
                          </label>
                          <form:textarea path="promotionDescription" class="form-control" cols="40" id="message" name="message" rows="10"></form:textarea>
                      </div>
                      <div class="form-group ">
                          <label class="control-label " >
                              Promote Between
                          </label>
                          <div class="well">
                              <div class="form-group row">
                                  <label for="startTime" class="col-2 col-form-label">Start Time</label>
                                  <div class="col-10">
                                      <form:input path="startTime" class="form-control" type="datetime-local" value="2011-08-19T13:45:00" id="startTime"></form:input>
                                  </div>
                              </div>
                              <div class="form-group row">
                                  <label for="endtime" class="col-2 col-form-label">End Time</label>
                                  <div class="col-10">
                                      <input class="form-control" type="datetime-local" value="2011-08-19T13:45:00" id="endtime">
                                  </div>
                              </div>
                          </div>
                      </div>

                      <div class="form-group">
                          <div>
                              <button class="btn btn-primary " name="submit" type="submit">
                                  Submit
                              </button>
                          </div>
                      </div>

              </div>
          </div>
      </div>
  </div>
</form:form>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  </body>
</html>