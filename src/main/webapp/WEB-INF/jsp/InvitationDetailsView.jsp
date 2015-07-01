<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Invitation Details - NextGen API Client</title>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.26/angular.min.js"></script>
<link type="text/css" href="../static/css/bootstrap.min.css" rel="stylesheet"/>
<link type="text/css" href="../static/css/ng-table.min.css" rel="stylesheet"/>
</head>
<style>
	#invitationContext {
	margin-left: 15px;
	margin-top: 10px;
	margin-right: 15px;
}
</style>
<script>

var app = angular.module('myApp', []);

function InvitationController($scope, $http){
    
    $scope.getInvitationDataFromServer = function() {           
        $scope.info = angular.fromJson('${invitation}'); 
    };
};
</script>

</head>
<body>
<a href="./index.jsp">NextGen API Client Home</a>
<div data-ng-app="myApp" class="context" id="invitationContext">
    <div data-ng-controller="InvitationController" data-ng-init="getInvitationDataFromServer()">	
    	<table data-toggle="table" data-cache="false" data-row-style="rowStyle" class="table table-bordered">
    <thead>
        <tr>
            <th data-field="id">Invitation Id</th>
            <th data-field="version">Version</th>
            <th data-field="creation">Creation</th>
            <th data-field="realm">Realm</th>
            <th data-field="email">Email</th>
            <th data-field="invitor">Invitor</th>
            <th data-field="targetOrganization">Organization</th>
            <th data-field="invitationCode">Invitation code</th>
        </tr>
        <tr>
	        <td>{{info.id}}</td>
	        <td>{{info.version}}</td>
	        <td>{{info.creation}}</td>
	        <td>{{info.realm}}</td>
	        <td>{{info.email}}</td>
	        <td>
	        	<p>Id: {{info.invitor.id}}</p>
		        <p>Type: {{info.invitor.type}}</p>
		        <p>Realm: {{info.invitor.realm}}</p> 
       		</td>
       		<td>
	        	<p>Id: {{info.targetOrganization.id}}</p>
		        <p>Type: {{info.targetOrganization.type}}</p>
		        <p>Realm: {{info.targetOrganization.realm}}</p> 
       		</td>
       		<td>{{info.invitationCode}}</td>
        </tr>
    </thead>
</table>
    </div>
    </div>
</body>
</html>