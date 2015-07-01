<!DOCTYPE html>
<html data-ng-app="formSubmit">
<head>
<meta charset="ISO-8859-1">
<title>AngularJS Post Form Spring MVC example</title>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.8/angular.min.js"></script>
<script type="text/javascript">
	var app = angular.module('formSubmit', []);
	
	app.controller('FormSubmitController',[ '$scope', '$http', function($scope, $http) {
			
		$scope.list = [];
			$scope.headerText = 'AngularJS Post Form Spring MVC example: Submit below form';
			$scope.submit = function() {
				
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
		<p>Name: <input type="text" data-ng-model="name"></p>
		<p>Location: <input type="text" data-ng-model="location"></p>
		<p>Phone: <input type="text" data-ng-model="phone"></p>
		<input type="submit" id="submit" value="Submit" /><br>	
		
		<h4>You submitted below data through post:</h4>
		 <pre>Form data ={{list}}</pre>
	</form>
</body>
</html>