<!DOCTYPE html>
<!--  Created by John Nagelkirk of Lochbridge for Covisint for NextGen.  -->
<html>
<head>
<meta charset="ISO-8859-1">
<title>Invite User - NextGen API Client</title>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.8/angular.min.js"></script>
<script src="static/AngularJSService/serviceController.js"></script>
<script src="static/AngularJSService/service.js"></script>
<!-- <link type="text/css" href="static/css/bootstrap.min.css" rel="stylesheet"/> -->
<script type="text/javascript">

	// See http://hello-angularjs.appspot.com/angularjs-http-service-ajax-post-json-data-code-example

	angular.module('createInviteApp', [])
	.controller('InviteSubmitController', ['$scope', '$http', function ($scope, $http) {
		$scope.success = "untried";
		$scope.headerText = "Create an Invite";
		
		// This is the custom Invite data.
		$scope.email = "raji.nair@covisint.com";
		$scope.invitorId = "TUZC83C5";
		$scope.invitorType = "person";
		$scope.inviteeId = "I56D1C87";
		$scope.inviteeType = "person";
		$scope.orgId = "OPLATFORM-COVS150202";
		$scope.orgType = "organization";
		
		$scope.submitInvite = function() {
			var inviteData = {
				"creator": "CRS_Root",
			    "realm": "PLATFORM-COVS",
			    "email": $scope.email,
			    "invitor": {
			        "id": $scope.invitorId,
			        "type": $scope.invitorType
			    },
			    "invitee": {
			        "id": $scope.inviteeId,
			        "type": $scope.inviteeType
			    },
			    "targetOrganization": {
			        "id": $scope.orgId,
			        "type": $scope.orgType
			    }
			};
			
			// Writing it to the server
			var res = $http.post('createInvitePost', inviteData);
			res.success(function(data, status, headers, config) {
				// Data is the JSON returned after a successful POST.
				$scope.message = data;
				$scope.success = true;
//				$scope.success = "The invite data was sucessfully submitted and a new invite has been added.";
			});
			res.error(function(data, status, headers, config) {
				$scope.success = false// "There was an error while submitting the invite data, and the request did not complete.";
				alert("failure message: " + JSON.stringify({data: data}));
			});
		};
	}]);
</script>
</head>
<body>
<a href="./index.jsp">NextGen API Client Home</a>
<div data-ng-app="createInviteApp"><div data-ng-controller="InviteSubmitController">
	<form data-ng-submit="submitInvite()">
		<h2>{{headerText}}</h2>
		<table style="text-align:right">
			<tr><td>Email:</td><td><input type="email" data-ng-model="email"></td></tr>
			<tr><td>Invitor ID:</td>
				<td><input type="text" data-ng-model="invitorId"></td>
				<td>Type:</td>
				<td><!--<td><input type="text" data-ng-model="invitorType"></td>--><select data-ng-model="invitorType">
					<option value="Person" selected>person</option>
 					<option value="Organization">organization</option></select></td></tr>
			<tr><td>Invitee ID:</td>
				<td><input type="text" data-ng-model="inviteeId"></td>
				<td>Type:</td>
				<td><!--<td><input type="text" data-ng-model="inviteeType"></td>--><select data-ng-model="inviteeType">
					<option value="Person" selected>person</option>
 					<option value="Organization">organization</option></select></td></tr>
 			<tr><td>Organization ID:</td>
				<td><input type="text" data-ng-model="orgId"></td>
				<td>Type:</td>
				<td><!--<td><input type="text" data-ng-model="orgType"></td>--><select data-ng-model="orgType">
					<option value="Person">person</option>
 					<option value="Organization" selected>organization</option></select></td></tr>
		</table><br>
		<input type="submit" id="submit" value="Submit" /><br>
		<span ng-if="success === 'untried'" style="color:black">
       		
	    </span>
		<span ng-if="success === true" style="color:green">
       		The invite data was successfully submitted and a new invite has been sent.
	    </span>
	    <span ng-if="success === false" style="color:red">
       		There was an error while submitting the invite data, and the request did not complete. Make sure all the data is accurate and then try again.
	    </span>
		<!--<h4>You submitted below data through post:</h4>
		<pre>Form data ={{message}}</pre>-->
	</form>
</div></div>

</body>
</html>