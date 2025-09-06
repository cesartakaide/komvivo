//[SERVICE]
'use strict';
var myApp = angular.module('MainWindow');
		
myApp.factory('UserDataInitService', [    '$log', '$rootScope', 'projectSite'
                                , function($log, $rootScope, projectSite) {
	return function UserDataInitService(userData){		
		//var userData = projectSite.userData;
		$log.info('INICIANDO USERDATA');
		userData.inited = true;
		var v = userData.methodList.length;
		userData.authorisedMethods = {};
		for (var i=0; i<v; i++){
			var methodData = userData.methodList[i];
			setPropertyPath(userData.authorisedMethods, methodData.serviceName + '.' + methodData.method, true);
		};
		
		userData.authorisedViews = {};
		
		var v = userData.viewList.length;
		for (var i=0; i<v; i++){
			var viewData = userData.viewList[i];
			setPropertyPath(userData.authorisedViews, viewData.viewName, true);
		};
		
		userData.isAuthorisedMethod = function(controllerName, method){
			var b= getPropertyPath(userData.authorisedMethods, controllerName + '.' + method);
			if (b == null){
				return false;
			}else{
				return b;
			};
		};
		
		userData.isAuthorisedView = function(viewName){
			var b= getPropertyPath(userData.authorisedViews, viewName);
			if (b == null){
				return false;
			}else{
				return b;
			};
		};
	};
}]);	