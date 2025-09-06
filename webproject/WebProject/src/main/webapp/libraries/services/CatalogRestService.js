//[SERVICE]
'use strict';
var myApp = angular.module('MainWindow');

myApp.factory('CatalogService', [ 'showError',  '$http', '$log', '$rootScope', 'projectSite', 'systemMessage', '$resource'      
                           , function(showError, $http, $log, $rootScope, projectSite, systemMessage, $resource ) {
   	return  $resource(
	    '/' + projectSite.siteName + '/spring/catalog_data/list/:domain/:name'
	   , {
	         domain : '@domain'
	        ,name   : '@name'
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


myApp.factory('CatalogPKService', [ 'showError',  '$http', '$log', '$rootScope', 'projectSite', 'systemMessage', '$resource'      
    , function(showError, $http, $log, $rootScope, projectSite, systemMessage, $resource ) {
return  $resource(
      '/' + projectSite.siteName + '/spring/catalog_data/fullPK'
     , {}
     , {
       list: {
          method:'POST'
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




myApp.factory('CatalogDetailService', [ 'showError',  '$http', '$log', '$rootScope', 'projectSite', 'systemMessage', '$resource'      
                                  , function(showError, $http, $log, $rootScope, projectSite, systemMessage, $resource ) {
     return  $resource(
        '/' + projectSite.siteName + '/spring/catalog_data/detail/:domain/:name/:shortCode'
       , {
            domain      : '@domain'
           ,name        : '@name'
           ,shortCode   : '@shortCode'
         }
       , {
          detail: {
             method:'GET'		        	
       	        ,interceptor: {
       		         responseError : function(response){
       		            showError('ERROR:' + response.data.message);
       		         }
       		     }          	
       	     }                                 
        }
   	);   
}]);

myApp.factory('CatalogDetailMappingService', [ 'showError',  '$http', '$log', '$rootScope', 'projectSite', 'systemMessage', '$resource'      
                                        , function(showError, $http, $log, $rootScope, projectSite, systemMessage, $resource ) {
     return  $resource(
        '/' + projectSite.siteName + '/spring/catalog_data/detailMapping/:domain/:name/:mappingName/:mappingValue'
        , {
             domain        : '@domain'
            ,name          : '@name'
            ,mappingName   : '@mappingName'
            ,mappingValue  : '@mappingValue'
         }
       , {
             detail: {
             method:'GET'		        	
            ,interceptor: {
                responseError : function(response){
                   showError('ERROR:' + response.data.message);
                }
             }          	
            }                                 
        }
     );   
}]);




