<!DOCTYPE html>
<!--  Created by John Nagelkirk of Lochbridge for Covisint for NextGen.  -->
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create User - NextGen API Client</title>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.8/angular.min.js"></script>
<script src="static/AngularJSService/serviceController.js"></script>
<script src="static/AngularJSService/service.js"></script>
<!-- <link type="text/css" href="static/css/bootstrap.min.css" rel="stylesheet"/> -->
<script type="text/javascript">

	// See http://hello-angularjs.appspot.com/angularjs-http-service-ajax-post-json-data-code-example

	angular.module('createPersonApp', [])
	.controller('PersonSubmitController', ['$scope', '$http', function ($scope, $http) {
		$scope.success = "untried";
		$scope.headerText = "Create a Person";
		
		// This is the custom Person data.
		$scope.prefix = "Ms";
		$scope.given = "Malika";
		$scope.middle = "P";
		$scope.surname = "Hendrickson";
		$scope.suffix = "";
		$scope.street1 = "21735 Gates Street";
		$scope.street2 = "";
		$scope.street3 = "";
		$scope.city = "Beverly Hills";
		$scope.state = "MI";
		$scope.postal = "48025";
		$scope.country = "US";
		$scope.email = "malika.hendrickson@covisint.com";
		$scope.phone1Type = "Main";
		$scope.phone1Num = "248-676-1570";
		$scope.phone2Type = "Fax";
		$scope.phone2Num = "248-996-5679";
		
		$scope.submitPersonVersionBeta = function() {
			var personData = {
//			    "realm": "PLATFORM-COVS",
//			    "status": "active",
			    "name": {
			        "prefix": $scope.prefix,
			        "given": $scope.given,
			        "middle": $scope.middle,
			        "surname": $scope.surname,
			        "suffix": $scope.suffix
			    },
			    "addresses": [
			        {
			            "streets": [
			                $scope.street1,
			                $scope.street2,
			                $scope.street3
			            ],
			            "city": $scope.city,
			            "state": $scope.state,
			            "postal": $scope.postal,
			            "country": $scope.country,
			            "type": "main"
			        }
			      
			    ],
			    "language": "en",
			    "timezone": "EST5EDT",
			    "phones": [
			        {
			            "type": $scope.phone1Type,
			            "number": $scope.phone1Num
			        },
			        {
			            "type": $scope.phone2Type,
			            "number": $scope.phone2Num
			        }
			    ],
			    "title": "User",
			    "email": $scope.email,
			    "organization": {
			    "id": "OPLATFORM-COVS150202",
			    "type": "organization",
			    "realm": "PLATFORM-COVS"
				},
			    "currency": "USD"
			};
			
			// Writing it to the server
			var res = $http.post('createPersonPostVersionBeta', personData);
			res.success(function(data, status, headers, config) {
				// Data is the JSON returned after a successful POST.
				$scope.message = data;
				$scope.success = true;
//				$scope.success = "The person data was sucessfully submitted and a new person has been added.";
			});
			res.error(function(data, status, headers, config) {
				$scope.success = false// "There was an error while submitting the person data, and the request did not complete.";
				alert("failure message: " + JSON.stringify({data: data}));
			});
		};
	}]);
</script>
</head>
<body>
<a href="./index.jsp">NextGen API Client Home</a>
<div data-ng-app="createPersonApp"><div data-ng-controller="PersonSubmitController">
	<form data-ng-submit="submitPersonVersionBeta()">
		<h2>{{headerText}}</h2>
		<table style="text-align:right">
			<tr><td>Prefix:</td><td><input type="text" data-ng-model="prefix"></td></tr>
			<tr><td>First Name:</td><td><input type="text" data-ng-model="given"></td></tr>
			<tr><td>Middle Initial:</td><td><input type="text" data-ng-model="middle"></td></tr>
			<tr><td>Last Name:</td><td><input type="text" data-ng-model="surname"></td></tr>
	 		<tr><td>Suffix:</td><td><input type="text" data-ng-model="suffix"></td></tr>
	 		<tr><td>Street:</td><td><input type="text" data-ng-model="street1"></td></tr>
	 		<tr><td>City:</td><td><input type="text" data-ng-model="city"></td></tr>
	 		<tr><td>State:</td><td><input type="text" data-ng-model="state"></td></tr>
	 		<tr><td>Zip:</td><td><input type="text" data-ng-model="postal"></td></tr>
	 		<tr><td>Country:</td><td><input type="text" data-ng-model="country"></td></tr>
	 		<tr><td>Email:</td><td><input type="email" data-ng-model="email"></td></tr>
			<tr><td>Phone 1 Number:</td>
				<td><input type="text" data-ng-model="phone1Num"></td>
				<td>Type:</td>
				<td><select data-ng-model="phone1Type">
					<option value="Main" selected>Main</option>
  					<option value="Mobile">Mobile</option>
 					<option value="Fax">Fax</option></select></td></tr>
			<tr><td>Phone 2 Number:</td><td><input type="text" data-ng-model="phone2Num"></td>
				<td>Type:</td><!-- <td><input type="text" data-ng-model="phone2Type"></td> -->
				<td><select data-ng-model="phone2Type">
					<option value="Main">Main</option>
  					<option value="Mobile">Mobile</option>
 					<option value="Fax" selected>Fax</option></select></td></tr>
		</table><br>
		<input type="submit" id="submit" value="Submit" /><br>
		<span ng-if="success === 'untried'" style="color:black">
       		
	    </span>
		<span ng-if="success === true" style="color:green">
       		The person data was successfully submitted and a new person has been added.
	    </span>
	    <span ng-if="success === false" style="color:red">
       		There was an error while submitting the person data, and the request did not complete. Make sure all the data is accurate and then try again.
	    </span>
		<!--<h4>You submitted below data through post:</h4>
		<pre>Form data ={{message}}</pre>-->
	</form>
</div></div>

</body>
</html>