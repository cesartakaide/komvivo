//[SERVICE]
'use strict';
var myApp = angular.module('MainWindow');
		
myApp.factory('getcatalog', [ '$http', '$log', 'projectSite',  function($http, $log, projectSite) {
	
	return function getcatalog (catalogDomain, catalogName, catalogDetail, catalogReferences, postMethod){
		var catalogPK = {
			name : catalogName	
			,domain : catalogDomain
			,referencias : catalogReferences
		};		
			
		catalogDetail.length=0;
		
		var commandMapping = { 			  
				params  :  [catalogPK]
				,method : 'getDetail' 
			    ,id     : 1
		};			
		
		$http.defaults.headers.post["Content-Type"] = "application/json-rpc";
		//var projectSite = getConstant.projectName;
		$http.post('/'+ projectSite.siteName + '/struts/json_services/CatalogDataAction',commandMapping)
		   .then(function successCallback(response) {
			if (response.data == null){
				alert('NO HAY RESULTADOS');
				$log.error('NO HAY RESULTADOS');
				return;
			}
			if (response.data.error != null && response.data.error != ""){
				alert('ERROR:' + response.data.error.message);
				$log.error('ERROR:' + response.data.error.message);
				return;
			}
			
			var catDetailList = response.data.result;						
			
			angular.forEach(catDetailList
					, function(value, key){
						catalogDetail.push ({
							  shortCode : value.shortCode
							 ,description : value.description
							 ,mappedValues : value.mappedValues
			    });
			});
			
			if (postMethod != null){
				postMethod(catDetailList);
			}
			
		}, function errorCallback(response) {
			// called asynchronously if an error occurs
			// or server returns response with an error status.
			alert('error al consultar catalogo (' + catalogDomain + "-" + catalogName + ')');
			$log.error('error al consultar ajax');
		});			

	};
}]);

