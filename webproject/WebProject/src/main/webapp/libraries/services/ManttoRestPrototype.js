//[SERVICE]
'use strict';
var myApp = angular.module('MainWindow');

myApp.factory('RestServiceInit', [ 'showError',  '$http', '$log', '$rootScope', 'projectSite', 'systemMessage', '$resource'
 , function(showError, $http, $log, $rootScope, projectSite, systemMessage, $resource) {
	   return function (resourceUrl, primaryKeyPath){
		   var url = "";
		   var primaryKey = null;
		   if (primaryKeyPath != null){
			   url = '/' + projectSite.siteName + '/spring/' + resourceUrl + '/:' + primaryKeyPath;
			   primaryKey = { primaryKeyPath : '@' + primaryKeyPath }
		   }else{
			   url = '/' + projectSite.siteName + '/spring/' + resourceUrl;
			   primaryKey = null;
		   }
		   
		   
		   return  $resource(
				  url
			      , primaryKey
			      , {		   
			        update: {
			            method: 'PUT'
			            ,interceptor: {
			                responseError : function(response){
			            	  showError('ERROR' + response.data.message);
			            	}
			            }
			        }
			        ,get:    {
			        	method:'GET'		        	
			            ,interceptor: {
			           	    responseError : function(response){
			           		   showError('ERROR:' + response.data.message);
			           	    }
			            }          	
			        }
			        ,post:   {
			        	method:'POST'
			            ,interceptor: {
			                responseError : function(response){
			            	   showError('ERROR:' + response.data.message);
			                }
			            }          		
			        }                
			        ,remove: {
			        	method:'DELETE'
			            ,interceptor: {
			           	    responseError : function(response){
			           		   showError('ERROR:' + response.data.message);
			           	    }
			            }          		
			        }
			      }
			   );
		  
		   
	 };
}]);
 