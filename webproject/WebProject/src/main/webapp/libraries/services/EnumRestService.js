//[SERVICE]
'use strict';
var myApp = angular.module('MainWindow');

myApp.factory('EnumService', [ 'showError',  '$http', '$log', '$rootScope', 'projectSite', 'systemMessage', '$resource'      
                           , function(showError, $http, $log, $rootScope, projectSite, systemMessage, $resource ) {
   	return  $resource(
	    '/' + projectSite.siteName + '/spring/enum_data/:enumClass'
	   , {
	    	enumClass : '@enumClass'	        
       }
       , {
         list: {
			method:'GET'
			,isArray : true
			,interceptor: {
			    responseError : function(response){
			       showError('ERROR:' + response.data.message);
			   }
			}          	
	     }                                 
      }
	);   
}]);
