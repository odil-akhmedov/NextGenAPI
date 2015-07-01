var serviceModule = angular.module('serviceModule', ['sampleService']);
	
	serviceModule.controller('myServiceController', function($scope, sampleService) {
	    
	    $scope.getJSONDataFromServer = function() {
	    	
	    	 sampleService.getUserData().success(function(data, status, headers, config) {
	         	$scope.data = data;	        	
	         }).error(function(data, status, headers, config) {
	 	          alert("Error Ocurred:"+status);
	 	     });
	    };
	
	});