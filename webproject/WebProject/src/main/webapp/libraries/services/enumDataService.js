//[SERVICE]
'use strict';
var myApp = angular.module('MainWindow');
		
myApp.factory('getEnumData', [ '$http', '$log', 'executeAjax',  function($http, $log, executeAjax) {
	return function getEnumData(enumClass, postMethod){
		executeAjax(enumClass, 'json_services', 'EnumDataJSON', 'getEnumData', postMethod);
	};
}]);
