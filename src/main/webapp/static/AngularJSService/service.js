var serviceModule = angular.module('sampleService',[]);

	serviceModule.service('sampleService', function($http) {
		
		this.getUserData = function(){
			return $http.get("http://localhost:8080/SpringMVCAngularJSService/getSampleJSONData/JavaHonk");	        
		};	
		
	});