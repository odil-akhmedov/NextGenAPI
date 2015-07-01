<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show User - NextGen API Client</title>
<script src="static/js/jquery-1.9.1.min.js"></script>
<script src="static/js/angular.min.js"></script>
<script src="static/js/bootstrap.min.js"></script>
<script src="static/js/ng-grid.debug.js"></script>
<script src="static/js/jquery.dataTables.min.js"></script>
<script src="static/AngularJSService/serviceController.js"></script>
<script src="static/AngularJSService/service.js"></script>
<link type="text/css" href="static/css/bootstrap.min.css" rel="stylesheet"/>
<link type="text/css" href="static/css/jquery-ui.css" rel="stylesheet"/>
<link type="text/css" href="static/css/ng-grid.css" rel="stylesheet"/>
<link type="text/css" href="static/css/styles.css" rel="stylesheet"/>

<script>
$(document).ready(function(){
    $('#myTable').dataTable();
});


var app = angular.module('restAPI', ['ngGrid']);

app.controller('GridController',function($scope, $window, $http) {
		$scope.actionMessage = '${actionMessage}';
		
		$scope.ShowDetails=function(id) {           
	        $http({method: 'GET', url: 'person/detailed/' + id }).
	        success(function(data, status, headers, config) {
	        	$scope.person = data;
	        }).
	        error(function(data, status, headers, config) {
	          // called asynchronously if an error occurs
	          // or server returns response with an error status.
	        });
	    
	    };   
	  
	  $scope.ShowAdresses = function(addresses){
		  
	  }
	
	    $scope.filterOptions = {
	            filterText: ""/* ,
	            useExternalFilter: false */
	        };
    	    
	        $scope.totalServerItems = 0;
	        $scope.pagingOptions = {
	            pageSizes: [10, 20, 50],
	            pageSize: 10,
	            currentPage: 1
	        };	
	        $scope.setPagingData = function(data, page, pageSize){	
	            var pagedData = data.slice((page - 1) * pageSize, page * pageSize);
	            $scope.myData = pagedData;
	            $scope.totalServerItems = data.length;
	            if (!$scope.$$phase) {
	                $scope.$apply();
	            }
	        };
	        $scope.getPagedDataAsync = function (pageSize, page, searchText) {
	            setTimeout(function () {
	                var data;
	                if (searchText) {
	                    var ft = searchText.toLowerCase();
	                    $http({method: 'GET', url: 'personlist' }).success(function (largeLoad, status, headers, config) {		
	                        data = largeLoad.filter(function(item) {
	                            return JSON.stringify(item).toLowerCase().indexOf(ft) != -1;
	                        });
	                        $scope.setPagingData(data,page,pageSize);
	                    });            
	                } else {
	                	 $http({method: 'GET', url: 'personlist' }).success(function (largeLoad, status, headers, config) {	
	                        $scope.setPagingData(largeLoad, page, pageSize);
	                    });
	                }
	            }, 100);
	        };
	    	
	        $scope.getPagedDataAsync($scope.pagingOptions.pageSize, $scope.pagingOptions.currentPage);
	    	
	        $scope.$watch('pagingOptions', function (newVal, oldVal) {
	            if (newVal !== oldVal && newVal.currentPage !== oldVal.currentPage) {
	              $scope.getPagedDataAsync($scope.pagingOptions.pageSize, $scope.pagingOptions.currentPage, $scope.filterOptions.filterText);
	            }
	        }, true);
	        $scope.$watch('filterOptions', function (newVal, oldVal) {
	            if (newVal !== oldVal) {
	              $scope.getPagedDataAsync($scope.pagingOptions.pageSize, $scope.pagingOptions.currentPage, $scope.filterOptions.filterText);
	            }
	        }, true);
	    	
	        $scope.ActivatePerson = function(status){
	        	if (status == "active")
	        	{
	        		
	        		return '<div class=\"ngCellText\">' + status + ' Testing status</div>';
	        	}
	        	else
	        		return '<div class=\"ngCellText\">' + status + '</div>';
	        };
            
	        //all the actions
	        $scope.actions = [
	                              {name: 'activate'},
	                              {name: 'suspend'},
	                              {name: 'unsuspend'}	                                      
	                          ];
	        
	        //available actions from status 'Active'            
            $scope.activeActions = [
                                    {name: 'suspend'}
            						];
	        
          	//available actions from status 'Suspended'            
            $scope.suspendActions = [
                                    {name: 'unsuspend'}
            						];
          	
           //available actions from status 'Pending'            
            $scope.pendingActions = [
                                    {name: 'activate'}
            						];

            $scope.onPersonActionsChange = function(actionName, personId) {
            	$window.location.href = 'person/' + actionName + '/' + personId;
            }
	        
	        $scope.gridOptions = {
	            data: 'myData',
	            enablePaging: true,
	    		showFooter: true,
	            totalServerItems: 'totalServerItems',
	            pagingOptions: $scope.pagingOptions,
	            filterOptions: $scope.filterOptions,
	            jqueryUITheme: true,
	            columnDefs: [ 
                {
	            	displayName:'#', 
	            	cellTemplate: '<div>{{$parent.$index + 1}}</div>',
	            	width: '20px',
	            	rowHeight: '100px'
           		},{
	            	field: 'id',
	            	displayName: 'Id',
	            	width: '90px',
	            	rowTemplate: '<div ng-style="{\'height\': \'100px\'}" ng-repeat="col in renderedColumns" ng-class="col.colIndex()" class="ngCell {{col.cellClass}}" ng-cell></div>',
	            	cellTemplate: '<a href="PersonDetailsView/{{row.entity.id}}"><div class=\"ngCellText\">{{row.getProperty(col.field)}}</div></a>'
	            },{
	            	field: 'version',
	            	displayName: 'Version',
	            	width: '130px'
	            },{
	            	field: 'creation',
	            	displayName: 'Creation',
	            	width: '130px'
	            }, {
	            	field: 'realm',
	            	displayName: 'Realm',
	            	width: '140px'
	            },{
	            	field: 'status',
	            	displayName: 'Status', 
	            	cellTemplate: 	'<div ng-switch on="row.getProperty(col.field)">' +
						            	'<div ng-switch-when="active">{{row.getProperty(col.field)}}'+ '<br />Actions:' +
											'<form ng-submit=\"onPersonActionsChange(menu.name, row.entity.id)\">' +
												'<select ng-model=\"menu\" ng-options=\"a.name for a in activeActions\">' +
												'</select>' +
										      '<br />'+
										      '<button type=\"submit\">Submit</button></form>' +
					                	'</div>' +
						            	'<div ng-switch-when="suspended">{{row.getProperty(col.field)}}'+ '<br />Actions:' +
											'<form ng-submit=\"onPersonActionsChange(menu.name, row.entity.id)\">' +
												'<select ng-model=\"menu\" ng-options=\"a.name for a in suspendActions\">' +
												'</select>' +
										      '<br />'+
										      '<button type=\"submit\">Submit</button></form>' +
						                '</div>' +
						            	'<div ng-switch-when="pending">{{row.getProperty(col.field)}}'+ '<br />Actions:' +
											'<form ng-submit=\"onPersonActionsChange(menu.name, row.entity.id)\">' +
												'<select ng-model=\"menu\" ng-options=\"a.name for a in pendingActions\">' +
												'</select>' +
										      '<br />'+
										      '<button type=\"submit\">Submit</button></form>' +
						                '</div>' +						                
						                '<div ng-switch-default class="grid">{{row.getProperty(col.field)}}'+ '<br />Actions:' +
											'<form ng-submit=\"onPersonActionsChange(menu.name, row.entity.id)\">' +
												'<select ng-model=\"menu\" ng-options=\"a.name for a in actions\">' +
												'</select>' +
								      		'<br />'+
								      		'<button type=\"submit\">Submit</button></form>' +
						                 '</div>' +
					              	'</div>' 
	            },{
	            	field: 'name',
	            	displayName: 'Fullname',
	            	cellTemplate: '<div class=\"ngCellText\">{{row.getProperty(col.field).given}} {{row.getProperty(col.field).surname}}</div>'
	            },{
	            	field: 'addresses',
	            	displayName: 'Addresses',
	            	cellTemplate: '<div class=\"ngCellText\"><div ng-repeat=\"address in row.getProperty(col.field)\"><ul ng-repeat=\"(key, value) in address.street\"><li>{{value}}</li></ul> <p>{{address.city}}, {{address.state}} {{address.postal}}, {{address.country}}<p></div></div>'
	            }, {
	            	field: 'language',
	            	displayName: 'Lang',
	            	width: '60px'	            	
	            },{
	            	field: 'timezone',
	            	displayName: 'Timezone'	            	
	            }, {
	            	field: 'phones',
	            	displayName: 'Phones',
	            	cellTemplate: '<div class=\"ngCellText\"><div ng-repeat=\"phone in row.getProperty(col.field)\"><p>{{phone.type}}: {{phone.number}}<p></div></div>'
	            }, {
	            	field: 'title',
	            	displayName: 'Title',
	            	cellTemplate: '<div class=\"ngCellText\">{{row.getProperty(col.field)}}</div>'
	            }, {
	            	field: 'email',
	            	displayName: 'Email'
	            }, {
	            	field: 'organization',
	            	displayName: 'Organization',
	            	cellTemplate: '<p></p><br /><div class=\"ngCellText\"><p>Id: {{row.getProperty(col.field).id}}</p><p>Type: {{row.getProperty(col.field).type}}</p><p>Realm: {{row.getProperty(col.field).realm}}</p></div>'
	            }]
	        };
	    
	});
    
</script>

</head>
<body>
<a href="./index.jsp">NextGen API Client Home</a>
<div data-ng-app="restAPI">
    <div class="context">
 		<div ng-controller="GridController">
 			<p>{{actionMessage}}</p>
   			Search: <input ng-model="filterOptions.filterText" >
   		<div class="gridStyle" ng-grid="gridOptions"></div>
		</div>
</div>
</body>
</html>