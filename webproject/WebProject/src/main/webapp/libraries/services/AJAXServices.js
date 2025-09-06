//[SERVICE]
'use strict';
var myApp = angular.module('MainWindow');
		
myApp.factory('executeAjax', [ 'showError',  '$http', '$log', '$rootScope', 'projectSite', 'systemMessage'
 , function(showError, $http, $log, $rootScope, projectSite, systemMessage) {
	
    return function executeAjax(parameterData, ajaxPackage, ajaxAction, ajaxMethod, processResultsMethod){
    	var commandMapping = null;
    	if (parameterData != null){
			commandMapping = { 			  
				params  :  [parameterData]
				,method : ajaxMethod 
			    ,id     : 1
		    };			
    	}else{
			commandMapping = { 			  
				params  :  []
				,method : ajaxMethod 
			    ,id     : 1
			};    		
    	};
			        
		$http.defaults.headers.post["Content-Type"] = "application/json-rpc";
		//var projectSite = getConstant.projectName;
		$http.post('/' + projectSite.siteName + '/struts/' + ajaxPackage + '/' + ajaxAction,
				commandMapping).then(function successCallback(response) {
			if (response.data == null){
				showError('NO HAY RESULTADOS');
				return;
			}
			if (response.data.error != null && response.data.error != ""){
				if (response.data.error.message != null){
					showError('ERROR:' + response.data.error.message);
				}else{
					showError('ERROR:' + response.data.error);
				}
				return;
			}
			if (response.data.result.hasErrors){
				if (response.data.result.error.mensajeError != null){
					showError('ERROR:' + response.data.result.error.mensajeError);					
				}
				if (response.data.result.error.message != null){
					showError('ERROR:' + response.data.result.error.message);					
				}
				return;
			}
			systemMessage('Ejecutado exitosamente....', 'INFO');
			// this callback will be called asynchronously
			// when the response is available
			processResultsMethod(response.data.result);
		}, function errorCallback(response) {
			// called asynchronously if an error occurs
			// or server returns response with an error status.
			showError('error al consultar ajax');
		});	
    };
}]);


myApp.factory('executeAjaxConf', [ 'projectSite','executeAjax', 'showConfirmation' 
                               , function(  projectSite, executeAjax, showConfirmation) {
                              	
    return function executeAjaxConf(parameterData, ajaxPackage, ajaxAction, ajaxMethod, processResultsMethod){
        showConfirmation('Esta seguro?', function(){
        	executeAjax(parameterData, ajaxPackage, ajaxAction, ajaxMethod, processResultsMethod);
        });
    };
}]);


