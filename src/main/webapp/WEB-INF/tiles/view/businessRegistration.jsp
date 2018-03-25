<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Registration Form</title>
<script>
    $( document ).ready(function() {

        $('#searchInput').hide();

    });
</script>
  </head>
  <%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <body>

  <form:form method="post" action="/registerUser" commandName="individualAccount">
	  <form:hidden path="type" />
	  <input id="type" name="type" type="hidden" value="Business"/>
<div class="container" style="width:70%">
<div class="row vertical-center-row" >

<div class="panel-body">

<div class="col-md-12 col-sm-12">
	<div class="form-group col-md-6 col-sm-6">
            <label for="name">Name*	</label>
		<form:input path="businessName" type="text" class="form-control input-sm" id="name" placeholder=""></form:input>
        </div>
        <div class="form-group col-md-6 col-sm-6">
                    <label for="businessType">Type*	</label>
                    <form:select path ="" id="businessType" name="businessType" class="form-control">
                         <option value="-1">Select</option>
                          <option value="1">Bar Only</option>
                          <option value="2">Restaurant Only</option>
                          <option value="3">Sports Bar</option>
						 <option value="4">Pub</option>
                          <option value="10">Pub/Tavern</option>
                           <option value="11">Pub/Lounge</option>
                           <option value="6">MicroBrew</option>
                           <option value="7">Diner</option>

                      </form:select>
		</div>

        <div class="form-group col-md-6 col-sm-6">
                    <label for="mobile">Contact#*</label>
			<form:input path="contectPhone"  type="text" class="form-control input-sm" id="mobile" placeholder=""></form:input>
                </div>
        <div class="form-group col-md-6 col-sm-6">
            <label for="email">Email</label>
			<form:input path ="emailAddress" type="email" class="form-control input-sm" id="email" placeholder="" ></form:input>
        </div>


<c:forEach  items="${individualAccount.accountAddresList}" varStatus="address">

	<div class="form-group col-md-6 col-sm-6">
	      <label for="addressLine1">Address*</label>
	      <form:textarea path="accountAddresList[0].addressLine1" class="form-control input-sm" id="addressLine1" rows="3"></form:textarea>
	   </div>

	<div class="form-group col-md-6 col-sm-6">
            <label for="city">City*</label>
		<form:input path="accountAddresList[0].city" type="text" class="form-control input-sm" id="city" placeholder=""></form:input>
        </div>

	 <div class="col-md-6">
	  <label  for="state">State</label>
                <form:select path="accountAddresList[0].state" class="form-control" id="state" name="state">
                			<option value="AK">Alaska</option>
                			<option value="AL">Alabama</option>
                			<option value="AR">Arkansas</option>
                			<option value="AZ">Arizona</option>
                			<option value="CA">California</option>
                			<option value="CO">Colorado</option>
                			<option value="CT">Connecticut</option>
                			<option value="DC">District of Columbia</option>
                			<option value="DE">Delaware</option>
                			<option value="FL">Florida</option>
                			<option value="GA">Georgia</option>
                			<option value="HI">Hawaii</option>
                			<option value="IA">Iowa</option>
                			<option value="ID">Idaho</option>
                			<option value="IL">Illinois</option>
                			<option value="IN">Indiana</option>
                			<option value="KS">Kansas</option>
                			<option value="KY">Kentucky</option>
                			<option value="LA">Louisiana</option>
                			<option value="MA">Massachusetts</option>
                			<option value="MD">Maryland</option>
                			<option value="ME">Maine</option>
                			<option value="MI">Michigan</option>
                			<option value="MN">Minnesota</option>
                			<option value="MO">Missouri</option>
                			<option value="MS">Mississippi</option>
                			<option value="MT">Montana</option>
                			<option value="NC">North Carolina</option>
                			<option value="ND">North Dakota</option>
                			<option value="NE">Nebraska</option>
                			<option value="NH">New Hampshire</option>
                			<option value="NJ">New Jersey</option>
                			<option value="NM">New Mexico</option>
                			<option value="NV">Nevada</option>
                			<option value="NY">New York</option>
                			<option value="OH">Ohio</option>
                			<option value="OK">Oklahoma</option>
                			<option value="OR">Oregon</option>
                			<option value="PA">Pennsylvania</option>
                			<option value="PR">Puerto Rico</option>
                			<option value="RI">Rhode Island</option>
                			<option value="SC">South Carolina</option>
                			<option value="SD">South Dakota</option>
                			<option value="TN">Tennessee</option>
                			<option value="TX">Texas</option>
                			<option value="UT">Utah</option>
                			<option value="VA">Virginia</option>
                			<option value="VT">Vermont</option>
                			<option value="WA">Washington</option>
                			<option value="WI">Wisconsin</option>
                			<option value="WV">West Virginia</option>
                			<option value="WY">Wyoming</option>
                		</form:select>
              </div>
            </div>



	<div class="form-group col-md-6 col-sm-6">
            <label for="zipCode">Zipcode</label>
		<form:input path="accountAddresList[0].zipCode" type="text" class="form-control input-sm" id="zipCode" placeholder=""></form:input>
        </div>
	</c:forEach>
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
</body>
</html>