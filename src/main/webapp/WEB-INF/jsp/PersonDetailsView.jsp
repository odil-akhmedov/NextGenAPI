<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Details - NextGen API Client</title>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.26/angular.min.js"></script>
<link type="text/css" href="../static/css/bootstrap.min.css" rel="stylesheet"/>
<link type="text/css" href="../static/css/ng-table.min.css" rel="stylesheet"/>
</head>
<style>
	#personContext {
	margin-left: 15px;
	margin-top: 10px;
	margin-right: 15px;
}
</style>
<script>

var app = angular.module('myApp', []);

function PersonController($scope, $http){
    $scope.editable = false;
	
    $scope.getPersonDataFromServer = function() {           
        $scope.info = angular.fromJson('${person}'); 
    };
    
 	// Change the table cells to fields which the user can edit.
    $scope.makeEditable = function() {
    	$scope.editable = true;
    }

    // Change the table cells to read-only text which the user cannot edit.
    $scope.saveEdits = function() {
    	$scope.editable = false;
    }
}

</script>

</head>
<body>
<a href="./index.jsp">NextGen API Client Home</a>
<div data-ng-app="myApp" class="context" id="personContext">
    <div data-ng-controller="PersonController" data-ng-init="getPersonDataFromServer()">	
    	<table data-toggle="table" data-cache="false" data-row-style="rowStyle" class="table table-bordered">
    <thead>
        <tr>
            <th data-field="id">Id</th>
            <th data-field="version">Version</th>
            <th data-field="creation">Creation</th>
            <th data-field="realm">Realm</th>
            <th data-field="name">Full name</th>
            <th data-field="addresses">Addresses</th>
            <th data-field="language">Language</th>
            <th data-field="timezone">Time zone</th>
            <th data-field="phones">Phones</th>
            <th data-field="title">Title</th>
            <th data-field="email">Email</th>
            <th data-field="organization">Organization</th>
        </tr>
        <tr>
	        <td>{{info.id}}</td>
	        <td>{{info.version}}</td>
	        <td>{{info.creation}}</td>
	        <td>{{info.realm}}</td>
	        <td>
	        	<span ng-if="editable === false" style="color:black">
					{{info.name.given}} {{info.name.surname}}
				</span>
				<span ng-if="editable === true" style="color:black">
					First: <input type="text" data-ng-model="info.name.given"><br>
					Last: <input type="text" data-ng-model="info.name.surname">
				</span>
			</td>
	        <td>
	        	<span ng-if="editable === false" style="color:black">
					<div ng-repeat="address in info.addresses">
			        	<div ng-repeat="(key, value) in address.streets">
			        		{{value}}
		        		</div>
		        		<p> {{address.city}}, {{address.state}} {{address.postal}}, {{address.country}}</p>
		        	</div>
				</span>
				<span ng-if="editable === true" style="color:black">
					<div ng-repeat="(key, address) in info.addresses">
						<table>
			        	<tr ng-repeat="(key, value) in address.streets">
			        		<td>Street {{key + 1}}: </td><td><input type="text" data-ng-model="value"></td>
			        	</tr>
			        	<tr><td>City: </td><td><input type="text" data-ng-model="address.city"></td></tr></tr>
			        	<tr><td>State: </td><td><input type="text" data-ng-model="address.state"></td></tr>
			        	<tr><td>Zip: </td><td><input type="text" data-ng-model="address.postal"></td></tr>
			        	<tr><td>Country: </td><td><input type="text" data-ng-model="address.country"></td></tr>
			        	</table>
		        	</div>
				</span>
		        
	        </td>
	        <td>
	        	<span ng-if="editable === false" style="color:black">
					{{info.language}}
				</span>
				<span ng-if="editable === true" style="color:black">
					<input type="text" data-ng-model="info.language">
				</span>
	        </td>
	        <td>
	        	<span ng-if="editable === false" style="color:black">
					{{info.timezone}}
				</span>
				<span ng-if="editable === true" style="color:black">
					<input type="text" data-ng-model="info.timezone">
				</span>
	        </td>
	        <td>
	        	<span ng-if="editable === false" style="color:black">
					<div ng-repeat="phone in info.phones">
		        		{{phone.type}}: {{phone.number}}
        			</div>
				</span>
				<span ng-if="editable === true" style="color:black">
					<div ng-repeat="phone in info.phones"><table>
		        		<tr><td>
		        			<input type="text" data-ng-model="phone.number">
		        		</td><td>
	        				<select data-ng-model="phone.type">
							<option value="Main">Main</option>
		  					<option value="Mobile">Mobile</option>
		 					<option value="Fax" selected>Fax</option></select>
	 					</td></tr>
        			</table></div>
				</span>
       		</td>
       		<td>{{info.title}}</td>
       		<td>{{info.email}}</td>
       		<td>
  				<p>Id: {{info.organization.id}}</p>
  				<p>Type: {{info.organization.type}}</p>
  				<p>Realm: {{info.organization.realm}}</p>
       		</td>
        </tr>
    </thead>
</table>
<span ng-if="editable === false" style="color:black">
	<button ng-click="makeEditable()">Edit</button>
</span>
<span ng-if="editable === true" style="color:black">
	<button ng-click="saveEdits()">Save</button>
</span>

    </div>
    </div>
    
</body>
</html>