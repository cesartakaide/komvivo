//[SERVICE]
'use strict';
var myApp = angular.module('MainWindow');

myApp.factory('SecurityService', [ 'showError', 'errorHandler',  '$http', '$log', '$rootScope', 'projectSite', 'systemMessage', '$resource'      
                           , function(showError, errorHandler, $http, $log, $rootScope, projectSite, systemMessage, $resource ) {
   	return  $resource(
	    '/' + projectSite.siteName + '/spring/Security/:viewName'
	   , {
	    	viewName : '@viewName'	         
       }
       , {
       validate: {
		   	method:'GET'		        	
		    ,interceptor: {
		   	    responseError : function(response){
		   	       errorHandler(response.data);
		        }
		    }          	
		}           
      }	
	);   
}]);  

