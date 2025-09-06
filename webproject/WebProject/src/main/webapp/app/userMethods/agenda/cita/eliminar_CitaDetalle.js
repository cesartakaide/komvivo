'use strict';
var myApp = angular.module('MainWindow');
//[USERMETHOD]
myApp.factory('eliminar_CitaDetalle', [ 'showError',  '$http', '$log', '$rootScope', 'projectSite', 'systemMessage' ,'showMessage'
 , function(showError, $http, $log, $rootScope, projectSite, systemMessage , showMessage) {
	return function eliminar_CitaDetalle($scope, detalle, detalleSeleccionado){
       var c = detalle.length;
       for (var i =0; i < c; i++){
    	   if (detalle[i].ordenServicio.correlativo == detalleSeleccionado.ordenServicio.correlativo){
    		   detalle.splice(i,1);
    	   };
       };		
	};
}]);	
