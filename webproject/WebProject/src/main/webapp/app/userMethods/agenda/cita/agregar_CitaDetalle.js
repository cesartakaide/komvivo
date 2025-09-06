'use strict';
var myApp = angular.module('MainWindow');
//[USERMETHOD]
myApp.factory('agregar_CitaDetalle', [ 'showError',  '$http', '$log', '$rootScope', 'projectSite', 'systemMessage' ,'showMessage'
 , function(showError, $http, $log, $rootScope, projectSite, systemMessage , showMessage) {
	return function agregar_CitaDetalle($scope, detalle, detalleSeleccionado){
		detalle.push(detalleSeleccionado);		
	};
}]);	