<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>NextGen API client AngularJS example</title>
<script src="static/js/angular.min.js"></script>
<script src="static/AngularJSService/serviceController.js"></script>
<script src="static/AngularJSService/service.js"></script>
<link type="text/css" href="static/css/bootstrap.min.css" rel="stylesheet"/>
</head>

<script>

var app = angular.module('myApp', []);

function MyController($scope, $http){
    
    $scope.getNameDataFromServer = function() {           
        $http({method: 'GET', url: 'springAngularJS.web'}).
        success(function(data, status, headers, config) {
            $scope.name = data;
        }).
        error(function(data, status, headers, config) {
          // called asynchronously if an error occurs
          // or server returns response with an error status.
        });
    
    };
};


function PersonController($scope, $http){
    
    $scope.getPersonDataFromServer = function() {           
        $http({method: 'GET', url: 'springAngularJS.personData'}).
        success(function(data, status, headers, config) {
            $scope.person = data;
            $scope.addresses = data.addresses;
            $scope.phones = data.phones;
            $scope.organization = data.organization;
        }).
        error(function(data, status, headers, config) {
          // called asynchronously if an error occurs
          // or server returns response with an error status.
        });
    
    };
};
    
</script>

</head>
<body data-ng-controller="myServiceController"> 
	
	<%-- <h3>${message} <spring:message code="label.name" /></h3>
	<p><button data-ng-click="getJSONDataFromServer()">Get JSON data from server</button></p>
	<p style="font-weight: bold;">Raw data received form server:</p>
	<p>{{data}}</p>
	<p style="font-weight: bold;">Iterate and align data received form server:</p>
	<div data-ng-repeat="dataDetails in data">Key: {{dataDetails.key}} Values: {{dataDetails.values}}</div>	 --%>

	<div data-ng-app="myApp">
        <!-- <div data-ng-controller="MyController">
            <button data-ng-click="getNameDataFromServer()">Get Name data from server</button>
            <p>First Name : {{name.given}}</p>
            <p>Last Name : {{name.surname}}</p>
        </div> --> 
        
              
        
        <div data-ng-controller="PersonController">
            <button data-ng-click="getPersonDataFromServer()">Get Person data from server</button>
            <p>Person Id : {{person.id}}</p>
            <p>Person version : {{person.version}}</p>
            <p>Person creation : {{person.creation}}</p>
            <p>Person realm: {{person.realm}}</p>
            <p>Person status: {{person.status}}</p>
            <p>Person given Name: {{person.name.given}}</p>
            <p>Person surName: {{person.name.surname}}</p>
            <p>Person addresses:</p>
            <ul>            
            	<li ng-repeat="address in addresses">
            		Streets : 
            		<div ng-repeat="(key, value) in address.streets" style="margin-left: 10px;">
		        		{{value}} <br /> 
		    		</div></li>
			        <!-- Streets: {{ address.street }} 	<br /> -->
			        <li>City: {{ address.city }} 		</li>
			        <li>State: {{ address.state }}		</li>
			        <li>Postal: {{ address.postal }}	</li>
			        <li>Country: {{ address.country }}	</li>
	      	</ul>
            <p>Person language: {{person.language}}</p>
            <p>Person timezone: {{person.timezone}}</p> 
            <p>Person phones: </p>
            <ul>            
            	<li ng-repeat="phone in phones">
            		Type: {{phone.type}} <br>
            		Number: {{phone.number}}
            	</li>
           	</ul>
           	<p>Person title: {{person.title}}</p>
           	<p>Person email: {{person.email}}</p>
           	<p>Person organization: </p>
           	<ul>
           		<li>Id: {{organization.id}}</li>
           		<li>Type: {{organization.type}}</li>
           		<li>Realm: {{organization.realm}}</li>
           	</ul>
        </div>
    </div>
</body>
</html>