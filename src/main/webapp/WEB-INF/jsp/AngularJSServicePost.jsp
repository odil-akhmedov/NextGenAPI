<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html data-ng-app="formSubmit">
<head>
<meta charset="ISO-8859-1">
<title>NextGen API client AngularJS example</title>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.2.26/angular.min.js"></script>
<script src="static/AngularJSService/serviceController.js"></script>
<script src="static/AngularJSService/service.js"></script>

<script type="text/javascript">
	var app = angular.module('formSubmit', []);
	
	app.controller('FormSubmitController',[ '$scope', '$http', function($scope, $http) {
			
			$scope.list = [];
			$scope.headerText = 'Pass Below JSON Array using AngularJS Spring MVC Controller';
			$scope.formData = [{
			    "creator": "15f23759-7ee0-419f-b281-023da47902f4",
			    "creatorAppId": "15f23759-7ee0-419f-b281-023da47902f4",
			    "creation": 1435001379755,
			    "access_token": "TlRYVlh3K3RCWkF6SEtRK0tMWEFnOXVBUVhBVzV0dytDRTBlQjlNU25mbi9mQ3cwSndUWUVzTkdabXJ5ZnpEY3RKVVFYNm1zK21sS0x3NjJHZU9VeXVrZDlYTWVlUllIU3dEVCtkemtYSDQyODBBcElnMlJud3IxdVUyZ3pYQ2xWUG9VVm50VWtCY09xTEoxcEJvVW5qdXhFVTIvNFVXSlQvRlNudVh4aEVaQVVINUc4UWQvaExmZ1NTZFhuN2k5UlFMQjVvdFcwQXhMQm9uYmtiYmVpL21Bbmp2bFFuN0NXaHNST3R6L2VUWT0=",
			    "expires_in": "1800",
			    "token_type": "bearer",
			    "expirationTime": "1435003179755",
			    "issueTime": "1435001379755"
			},{
			    "creator": "00323759-7ee0-419f-b281-023da4ds02f4",
			    "creatorAppId": "15f23759-7ee0-419f-b281-023da47902f4",
			    "creation": 1435001379999,
			    "access_token": "sssYVlh3K3RCWkF6SEtRK0tMWEFnOXVBUVhBVzV0dytDRTBlQjlNU25mbi9mQ3cwSndUWUVzTkdabXJ5ZnpEY3RKVVFYNm1zK21sS0x3NjJHZU9VeXVrZDlYTWVlUllIU3dEVCtkemtYSDQyODBBcElnMlJud3IxdVUyZ3pYQ2xWUG9VVm50VWtCY09xTEoxcEJvVW5qdXhFVTIvNFVXSlQvRlNudVh4aEVaQVVINUc4UWQvaExmZ1NTZFhuN2k5UlFMQjVvdFcwQXhMQm9uYmtiYmVpL21Bbmp2bFFuN0NXaHNST3R6L2VUWT0=",
			    "expires_in": "3600",
			    "token_type": "bearer",
			    "expirationTime": "1435003179799",
			    "issueTime": "1435001379799"
			}];
			$scope.submit = function() {
				var response = $http.post('angularServiceCallPost', $scope.formData);
				response.success(function(data, status, headers, config) {
					$scope.list.push(data);
				});
				response.error(function(data, status, headers, config) {
					alert( "Exception details: " + JSON.stringify({data: data}));
				});
				
				//Empty list data after process
				$scope.list = [];
				
			};
		}]);
	
	function TokenController($scope, $http){
	    
	    $scope.getTokenDataFromServer = function() {           
	        $http({method: 'GET', url: 'springAngularJS.tokenData'}).
	        success(function(data, status, headers, config) {
	            $scope.token = data;
	        }).
	        error(function(data, status, headers, config) {
	          // called asynchronously if an error occurs
	          // or server returns response with an error status.
	        });
	    
	    };
	};
	
	app.controller('FormSubmitPersonController',[ '$scope', '$http', function($scope, $http) {
		
		$scope.list = [];
			$scope.headerText = 'AngularJS Post Form Spring MVC example: Submit below form';
			$scope.submitPerson = function() {
				
				var formData = {
				        "id": "EKJ4UEA2",
				        "version": 1426040880000,
				        "creation": 1426040880000,
				        "realm": "PLATFORM-COVS",
				        "status": "active",
				        "name": {
				            "given": "bryan",
				            "surname": "idm admin"
				        },
				        "addresses": [
				            {
				                "streets": [
				                    "25800 Northwestern Hwy"
				                ],
				                "city": "Southfield",
				                "state": "MI",
				                "postal": "48076",
				                "country": "US"
				            }
				        ],
				        "language": "en",
				        "timezone": "EST5EDT",
				        "phones": [
				            {
				                "type": "main",
				                "number": "123-123-1234"
				            }
				        ],
				        "email": "junchang.gu@mailsac.covisintrnd.com",
				        "organization": {
				            "id": "OPLATFORM-COVS150202",
				            "type": "organization",
				            "realm": "PLATFORM-COVS"
				        }
				    };
				
				var response = $http.post('angularServiceCallFormPost', formData);
				response.success(function(data, status, headers, config) {
					$scope.list.push(data);
				});
				response.error(function(data, status, headers, config) {
					alert( "Exception details: " + JSON.stringify({data: data}));
				});
				
				//Empty list data after process
				$scope.list = [];
				
			};
		}]);
</script>

</head>
<body>
	<form data-ng-submit="submit()" data-ng-controller="FormSubmitController">
		<h3>{{headerText}}</h3>
		{{formData}}<br><br>		
		<input type="submit" id="submit" value="Submit " /><br>
		
		<h4>You submitted below data through post:</h4>
		 <pre>Data ={{list}}</pre>
	</form>
	
	<div data-ng-controller="TokenController">
         	 <button data-ng-click="getTokenDataFromServer()">Get Token data from server</button>
         	 <p>Access Token: {{token.access_token}}</p>
         	 <p>Access token_type: {{token.token_type}}</p>         	 
     </div>
     <form data-ng-submit="submitPerson()" data-ng-controller="FormSubmitPersonController">
		<h3>{{headerText}}</h3>
		<p>Name: <input type="text" data-ng-model="name"></p>
		<p>Location: <input type="text" data-ng-model="location"></p>
		<p>Phone: <input type="text" data-ng-model="phone"></p>
		<input type="submit" id="submit" value="Submit" /><br>	
		
		<h4>You submitted below data through post:</h4>
		 <pre>Form data ={{list}}</pre>
	</form>
         
</body>
</html>