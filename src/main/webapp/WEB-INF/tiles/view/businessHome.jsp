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
	  <script src="/js/utility.js"></script>
  </head>

  <%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <body>
  <script>
      var localDateTimeString;
      $( document ).ready(function() {
          var date = new Date();
          var month = date.getMonth()+1;
          var monthValue = (month<=9)?"0"+month:month;
          var day =  date.getDate();
          var dayValue = (day<=9)?"0"+day:day;
          var hours =  date.getHours();
          var hoursValue = (hours<=9)?"0"+hours:hours;

          var mints =  date.getMinutes();
          var mintsValue = (mints<=9)?"0"+mints:mints;
          var defaultStartTime  = date.getFullYear()+"-"+monthValue+"-"+dayValue+"T"+hoursValue+":"+mintsValue+":00";
          $("#starttimecontrol").val(defaultStartTime);
          $("#startTime").val(new Date(defaultStartTime).toISOString());
		  //$("#starttimecontrol").val(defaultStartTime);
          $("#promoFilterInput").on("keyup", function() {
              var value = $(this).val().toLowerCase();
              $("#promotions tr").filter(function() {
                  $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
              });
          });
          $('.edit_promo').click(function () {

              var promoDesc = $(this).closest("tr").find('td:eq(1)').text();
              var promoId = $(this).closest("tr").find('td:eq(0)').text();
              var startDate  = $(this).closest("tr").find('td:eq(2)').text();
              var endDate = $(this).closest("tr").find('td:eq(3)').text();

              $("#promoDesc").val($.trim(promoDesc));
              $("#promoIdHidden").val($.trim(promoId));

             $('#myTab a[href="#createPromo"]').tab('show');


          });
          $( "#logoutbtn").show();
          $( "#loginbtn").hide();

		  $('#searchInput').hide();

      });

      function setStartTime(){

          var startDateTime = new Date($("#starttimecontrol").val());
         /* $("#startTime").val(startDateTime.toISOString());*/
          $("#startTime").val(getFormattedDate(startDateTime));

      }

      function setEndTime(){
          var endDateTime = new Date($("#endtimecontrol").val());
        //  $("#endTime").val(endDateTime.toISOString());
          $("#endTime").val(getFormattedDate(endDateTime));
      }
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
				  <li class="list-group-item text-right"><span class="pull-left"><strong>Business</strong></span> <c:out value="${account.businessName}"/></li>
				  <li class="list-group-item text-right"><span class="pull-left"><strong>Logined As</strong></span><c:out value="${account.userName}"/></li>

			  </ul>


		  </div><!--/col-3-->
		  <div class="col-sm-9">

			  <ul class="nav nav-tabs" id="myTab">
				  <li class="active"><a href="#home" data-toggle="tab">Home</a></li>
				  <li><a href="#createPromo" data-toggle="tab">Create Promotion</a></li>
				  <li><a href="#settings" data-toggle="tab">Settings</a></li>
			  </ul>

			  <div class="tab-content" style="color:black">
				  <div class="tab-pane active" id="home">
					  <div class="table-responsive">
						  <p>Type something below to search for promotions:</p>
						  <input class="form-control" id="promoFilterInput" type="text" placeholder="Search..">
						  <table class="table table-striped">
							  <thead>
							  <tr>
								  <th>#</th>
								  <th>Description</th>
								  <th>StartDate</th>
								  <th>EndDate</th>
								  <th>Number Of hits </th>
								  <th>Actions</th>
							  </tr>
							  </thead>
							  <c:forEach items="${accountPromotionList}" var="promotion">
								  <c:out value="${pr.name}"/>
								  <c:out value="${userForm.address}"/>
								  <tbody id="promotions">
								  <tr>
									  <td>
										  <c:out value="${promotion.promotionId}"/>
									  </td>
									  <td>
										  <c:out value="${promotion.promotionDescription}"/>
									  </td>
									  <td>
										  <c:out value="${promotion.startTime}"/>
									  </td>
									  <td>
										  <c:out value="${promotion.endTime}"/>
									  </td>
									  <td>
										 11
									  </td>
									  <td>
										  <input class="edit_promo" type="button" value="Edit">
									  </td>

								  </tr>

								  </tbody>
							  </c:forEach>

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
				  <div class="tab-pane" id="createPromo">

					  <h2></h2>

					  <form:form method="post" action="/createPromotion" modelAttribute="promotion">


						  <!-- HTML Form (wrapped in a .bootstrap-iso div) -->
						  <div class="bootstrap-iso">
							  <div class="container-fluid">
								  <div class="row">
									  <div class="col-md-6 col-sm-6 col-xs-12">

										  <div class="form-group ">
											  <form:input path="promotionId" type="hidden" id="promoIdHidden"></form:input>
											  <label class="control-label " for="promoTitle">
												  Title
											  </label>
											  <input type="text" id="promoTitle">
											  <label class="control-label " for="message">
												  Description
											  </label>
											  <form:textarea path="promotionDescription" class="form-control" cols="40" id="promoDesc" name="message" rows="5" ></form:textarea>

										  </div>
										  <div class="form-group ">
											  <label class="control-label " >
												  Promote Between
											  </label>
											  <div class="well">
												  <div class="form-group row">
													  <label for="startTime" class="col-2 col-form-label">Start Time</label>
													  <div class="col-10">
														  <input path="startTimeAsDate" class="form-control" type="datetime-local"    id="starttimecontrol" onchange='setStartTime()'></input>
														  <form:input path="startTime" class="form-control" type="hidden"   value="" id="startTime"></form:input>
													  </div>
												  </div>
												  <div class="form-group row">
													  <label for="endtime" class="col-2 col-form-label">End Time</label>
													  <div class="col-10">
                                                                                                              <input  class="form-control" type="datetime-local"    id="endtimecontrol" onchange='setEndTime()'></input>
														  <form:input path="endTime" class="form-control" type="hidden" value="" id="endTime"></form:input>
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
					  <form:form method="post" action="/account" commandName="individualAccount" >
					  <form:input path="id" type="hidden"></form:input>
						  <form:hidden path="type" />
						  <input id="type" name="type" type="hidden" value="Business"/>
						  <div class="container" style="width:70%">
							  <div class="row vertical-center-row" >

								  <div class="panel-body">

									  <div class="col-md-12 col-sm-12">



										  <div class="form-group col-md-6 col-sm-6">
											  <label for="mobile">Contact#*</label>
											  <form:input path="contectPhone"  type="text" class="form-control input-sm" id="mobile" placeholder=""></form:input>
										  </div>
										  <div class="form-group col-md-6 col-sm-6">
											  <label for="email">Email</label>
											  <form:input path ="emailAddress" type="email" class="form-control input-sm" id="email" placeholder="" ></form:input>
										  </div>



									  <div class="form-group col-md-6 col-sm-6">
										  <label for="userName">UserName*</label>
										  <form:input path="userName" pathname="userName" id="userName" class="form-control input-sm" type="text"/>

									  </div>
									  <div class="form-group col-md-6 col-sm-6">
										  <label for="accountPassword">Password*</label>
										  <form:input path="accountPassword" name="password" id="accountPassword" class="form-control input-sm" placeholder="Password" type="password"/>
									  </div>
									  <div class="form-group col-md-6 col-sm-6">
										  <label for="rpassword">Retype Password*</label>
										  <input type="password" class="form-control input-sm" id="rpassword" placeholder="">
									  </div>


									  <div class="form-group col-md-3 col-sm-3">
										  <label for="photo">BusinessLogo*</label>
										  <input type="file" id="photo">
									  </div>
									  <div class="col-md-6 col-sm-6">
										  <input type="submit" class="btn btn-primary" value="Submit"/>

									  </div>
								  </div>
							  </div>


						  </div>
					  </form:form>

				  </div>

			  </div><!--/tab-pane-->
		  </div><!--/tab-content-->

	  </div><!--/col-9-->
  </div></div><!--/row-->

  </body>
</html>