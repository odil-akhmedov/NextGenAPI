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
.mediumWidth {
	width: 120px;
}
.smallWidth {
	width: 50px;
}
</style>
<script>

var app = angular.module('myApp', []);

function PersonController($scope, $http){
    $scope.editable = false;
    $scope.success = "untried";
	
    $scope.getPersonDataFromServer = function() {           
        $scope.info = angular.fromJson('${person}'); 
    };
    
 	// Change the table cells to fields which the user can edit.
    $scope.makeEditable = function() {
    	$scope.editable = true;
    };

//    // Change the table cells to read-only text which the user cannot edit.
//    $scope.saveEdits = function() {
//    	$scope.editable = false;
//    };
    
	// Writing it to the server
	$scope.saveEdits = function() {
		$scope.editable = false;
		var personData = {
		    "id": $scope.info.id, //"I56D1C87",
		    "version": $scope.info.version, //1435095502000,
		    "creator": $scope.info.creator, //"CRS_ROOT",
		    "creation": $scope.info.creation, //1435095502000,
		    "realm": $scope.info.realm, //"PLATFORM-COVS",
		    "status": $scope.info.status, //"active",
		    "name": $scope.info.name, /*{
		        "prefix": "Mr.",
		        "given": "Aarav",
		        "surname": "Kolisidious"
		    },*/
		    "addresses": $scope.info.addresses, /* [
		        {
		            "streets": [
		                "86 W Rincon Ave",
						"APT 20"
		            ],
		            "city": "Campbell",
		            "state": "CA",
		            "postal": "95008",
		            "country": "US",
		            "type": "main"
		        }
		    ], */
		    "language": $scope.info.language, //"en",
		    "timezone": $scope.info.timezone, //"EST5EDT",
		    "phones": $scope.info.phones, /* [
		        {
		            "type": "main",
		            "number": "248-767-1570"
		        },
		        {
		            "type": "fax",
		            "number": "248-669-5679"
		        }
		    ],*/
		    "title": $scope.info.title, //"User",
		    "email": $scope.info.email, //"aarav.kolis@desantis.org",
		    "organization": $scope.info.organization, /* {
			   "id": "OPLATFORM-COVS10779993",
			   "type": "organization",
			   "realm": "PLATFORM-COVS"
			},*/
		    "currency": $scope.info.currency //"USD"
		};
		var res = $http.post('updatePersonPut/' + personData.id, personData);
		res.success(function(data, status, headers, config) {
			// Data is the JSON returned after a successful POST.
			$scope.success = true;
		});
		res.error(function(data, status, headers, config) {
			$scope.success = false
			alert("failure message: " + JSON.stringify({data: data}));
		});
	};
	
	$scope.addStreet = function() {
		info.addresses.streets.push("");
		var streetsObj = document.getElementById("streets");
		streetsObj.parentNode.removeChild("streets");
	}
}

</script>

</head>
<body>
<a href="../index.jsp">NextGen API Client Home</a>
<div data-ng-app="myApp" class="context" id="personContext">
    <div data-ng-controller="PersonController" data-ng-init="getPersonDataFromServer()">
    <form data-ng-submit="submitPersonEdit()">
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
					First: <input type="text" data-ng-model="info.name.given" class="mediumWidth"><br>
					Last: <input type="text" data-ng-model="info.name.surname" class="mediumWidth">
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
			        	<span id="streets"><tr ng-repeat="(key, value) in address.streets">
			        		<td>Street {{key + 1}}: </td><td><input type="text" data-ng-model="address.streets[key]" class="mediumWidth"></td>
			        	</tr></span>
			        	<tr><td colspan="2"><button ng-click="addStreet()">Add Street</button></td></tr>
			        	<tr><td>City: </td><td><input type="text" data-ng-model="address.city" class="mediumWidth"></td></tr>
			        	<tr><td>State: </td><td><input type="text" data-ng-model="address.state" class="mediumWidth"></td></tr>
			        	<tr><td>Zip: </td><td><input type="text" data-ng-model="address.postal" class="mediumWidth"></td></tr>
			        	<tr><td>Country: </td><td><input type="text" data-ng-model="address.country" class="mediumWidth"></td></tr>
			        	</table>
		        	</div>
				</span>
		        
	        </td>
	        <td>
	        	<span ng-if="editable === false" style="color:black">
					{{info.language}}
				</span>
				<span ng-if="editable === true" style="color:black">
					<input type="text" data-ng-model="info.language" class="smallWidth">
				</span>
	        </td>
	        <td>
	        	<span ng-if="editable === false" style="color:black">
					{{info.timezone}}
				</span>
				<span ng-if="editable === true" style="color:black">
					<input type="text" data-ng-model="info.timezone" class="mediumWidth">
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
		        			<input type="text" data-ng-model="phone.number" class="mediumWidth">
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
       		<td>
       			<span ng-if="editable === false" style="color:black">
					{{info.email}}
				</span>
				<span ng-if="editable === true" style="color:black">
					Email: <input type="email" data-ng-model="info.email" class="mediumWidth">
				</span>
       		</td>
       		<td>
  				<p>Id: {{info.organization.id}}</p>
  				<p>Type: {{info.organization.type}}</p>
  				<p>Realm: {{info.organization.realm}}</p>
       		</td>
        </tr>
    </thead>
</table>
<span ng-if="editable === false" style="color:black">
	<!--<input type="submit" id="submit" value="Edit">-->
	<button ng-click="makeEditable()">Edit</button>
</span>
<span ng-if="editable === true" style="color:black">
	<input ng-click="saveEdits()" type="submit" id="submit" value="Save">
	<!--<button ng-click="saveEdits()">Save</button>-->
</span>

<span ng-if="success === 'untried'" style="color:black">
     		
</span>
<span ng-if="success === true" style="color:green">
	The changes were successfully submitted.
</span>
<span ng-if="success === false" style="color:red">
	There was an error while submitting the changes, and the request did not complete. Make sure all the data is accurate and then try again.
</span>

</form>
    </div>
    </div>
    
</body>
</html>