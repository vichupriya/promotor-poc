<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Registration Form</title>
<style></style>

	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  </head>

  <%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <body>
  <script>

      /****/
  </script>
  <hr>
  <div class="container" style="color:black">
	  <div class="row">
		  <div class="col-sm-10"><h1></h1></div>
		  <div class="col-sm-2"><a href="/users" class="pull-right"><img title="profile image" class="img-circle img-responsive" src="http://www.gravatar.com/avatar/28fd20ccec6865e2d5f0e1f4446eb7bf?s=100"></a></div>
	  </div>
	  <div class="row">
		  <div class="col-sm-3"><!--left col-->

			  <ul class="list-group">
				  <li class="list-group-item text-muted">Profile</li>
				  <li class="list-group-item text-right"><span class="pull-left"><strong>Joined</strong></span> 2.13.2014</li>
				  <li class="list-group-item text-right"><span class="pull-left"><strong>Last seen</strong></span> Yesterday</li>
				  <li class="list-group-item text-right"><span class="pull-left"><strong>Real name</strong></span> Joseph Doe</li>

			  </ul>


		  </div><!--/col-3-->
		  <div class="col-sm-9">

			  <ul class="nav nav-tabs" id="myTab">
				  <li class="active"><a href="#home" data-toggle="tab">Home</a></li>
				  <li><a href="#messages" data-toggle="tab">Create Promotion</a></li>
				  <li><a href="#settings" data-toggle="tab">Settings</a></li>
			  </ul>

			  <div class="tab-content" style="color:black">
				  <div class="tab-pane active" id="home">
					  <div class="table-responsive">
						  <table class="table table-striped">
							  <thead>
							  <tr>
								  <th>#</th>
								  <th>Description</th>
								  <th>StartDate</th>
								  <th>Number Of hits </th>
								  <th>Actions</th>
							  </tr>
							  </thead>
							  <tbody id="items">
								<tr>
									<td>
										1
									</td>
									<td>
										lunch 30% Off
									</td>
									<td>
										1/8/2017
									</td>
									<td>
										100
									</td>
									<td>
										<input type="button" value="Edit">
									</td>

								</tr>
								<tr>
									<td>
										1
									</td>
									<td>
										lunch 30% Off
									</td>
									<td>
										1/8/2017
									</td>
									<td>
										100
									</td>
									<td>
										<input type="button" value="ReActivate">
									</td>

								</tr>
							  </tbody>
						  </table>
						  <hr>
						  <div class="row">
							  <div class="col-md-4 col-md-offset-4 text-center">
								  <ul class="pagination" id="myPager"></ul>
							  </div>
						  </div>
					  </div><!--/table-resp-->

					  <hr>



				  </div><!--/tab-pane-->
				  <div class="tab-pane" id="messages">

					  <h2></h2>

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

				  </div><!--/tab-pane-->
				  <div class="tab-pane" id="settings">


					  <hr>
					  <form class="form" action="##" method="post" id="registrationForm">
						  <div class="form-group">

							  <div class="col-xs-6">
								  <label for="first_name"><h4>First name</h4></label>
								  <input type="text" class="form-control" name="first_name" id="first_name" placeholder="first name" title="enter your first name if any.">
							  </div>
						  </div>
						  <div class="form-group">

							  <div class="col-xs-6">
								  <label for="last_name"><h4>Last name</h4></label>
								  <input type="text" class="form-control" name="last_name" id="last_name" placeholder="last name" title="enter your last name if any.">
							  </div>
						  </div>

						  <div class="form-group">

							  <div class="col-xs-6">
								  <label for="phone"><h4>Phone</h4></label>
								  <input type="text" class="form-control" name="phone" id="phone" placeholder="enter phone" title="enter your phone number if any.">
							  </div>
						  </div>

						  <div class="form-group">
							  <div class="col-xs-6">
								  <label for="mobile"><h4>Mobile</h4></label>
								  <input type="text" class="form-control" name="mobile" id="mobile" placeholder="enter mobile number" title="enter your mobile number if any.">
							  </div>
						  </div>
						  <div class="form-group">

							  <div class="col-xs-6">
								  <label for="email"><h4>Email</h4></label>
								  <input type="email" class="form-control" name="email" id="email" placeholder="you@email.com" title="enter your email.">
							  </div>
						  </div>
						  <div class="form-group">

							  <div class="col-xs-6">
								  <label for="email"><h4>Location</h4></label>
								  <input type="email" class="form-control" id="location" placeholder="somewhere" title="enter a location">
							  </div>
						  </div>
						  <div class="form-group">

							  <div class="col-xs-6">
								  <label for="password"><h4>Password</h4></label>
								  <input type="password" class="form-control" name="password" id="password" placeholder="password" title="enter your password.">
							  </div>
						  </div>
						  <div class="form-group">

							  <div class="col-xs-6">
								  <label for="password2"><h4>Verify</h4></label>
								  <input type="password" class="form-control" name="password2" id="password2" placeholder="password2" title="enter your password2.">
							  </div>
						  </div>
						  <div class="form-group">
							  <div class="col-xs-12">
								  <br>
								  <button class="btn btn-lg btn-success" type="submit"><i class="glyphicon glyphicon-ok-sign"></i> Save</button>
								  <button class="btn btn-lg" type="reset"><i class="glyphicon glyphicon-repeat"></i> Reset</button>
							  </div>
						  </div>
					  </form>
				  </div>

			  </div><!--/tab-pane-->
		  </div><!--/tab-content-->

	  </div><!--/col-9-->
  </div><!--/row-->

  </body>
</html>