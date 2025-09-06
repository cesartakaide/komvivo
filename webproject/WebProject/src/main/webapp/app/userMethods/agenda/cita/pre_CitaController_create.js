'use strict';
var myApp = angular.module('MainWindow');
//[USERMETHOD]
myApp.factory('pre_CitaController_create', [ 'showError',  '$http', '$log', '$rootScope', 'projectSite', 'systemMessage' ,'showMessage'
 , function(showError, $http, $log, $rootScope, projectSite, systemMessage , showMessage) {
	return function pre_CitaController_create($scope, parametro, detalle){
		//parametro  --> com.erp.operaciones.agenda.beans.Cita
		
		//5	0	ORTODONCIA
		//6	0	ODONTOLOGIA
		if (parametro.empresaArea.correlativo == 5){
			setPropertyPath(parametro, 'recurso.tipoRecurso', 'UBICACION');  //ubicacion
		} 
		if (parametro.empresaArea.correlativo == 6){
			setPropertyPath(parametro, 'recurso.tipoRecurso', 'EMPLEADO');  //empleado
		}
		setPropertyPath(parametro, 'detalle', detalle);
	};
}]);	
