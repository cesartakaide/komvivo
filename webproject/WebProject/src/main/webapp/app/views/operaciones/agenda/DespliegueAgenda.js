//[CUSTOM_CONTROLLER]
"use strict";
var myApp = angular.module('MainWindow');                                             
//titulo [agenda]
myApp.controller('DespliegueAgendaController', ['$scope', '$controller', '$stateParams', '$location', '$q', '$state', '$log'
                    ,'DTOptionsBuilder' , 'showError', 'showConfirmation',  'executeAjax', 'systemMessage', 'showMessage' , 'executeAjaxConf'    //servicios
//importacion de controladores     
                    , 'AgendaTotalController'
                    , 'EmpresaAreaController'
                    , 'ListadoEmpresaAreaController'
                    , 'ListadoSucursalController'
                    , 'DetalleClienteModal'
                                       , function($scope,  $controller, $stateParams, $location, $q,  $state, $log
					, DTOptionsBuilder , showError, showConfirmation, executeAjax, systemMessage, showMessage, executeAjaxConf
                    , AgendaTotalController
                    , EmpresaAreaController
                    , ListadoEmpresaAreaController
                    , ListadoSucursalController
                    , DetalleClienteModal
					) {
     //inicializacion de datatable.
    $scope.dtOptions = DTOptionsBuilder.newOptions()
    .withPaginationType('full_numbers')
    .withSelect({
       style:    'os',
       selector: 'tr'
    });    
        
    //definicion de variables.
    $scope.readOnly = false;
    $scope.parametro = {};  // com.erp.operaciones.agenda.beans.AgendaTotal
    $scope.criterio ={};
    $scope.listadoRecursos = [];
    $scope.listadoAreaEmpresa = [];    
    $scope.listadoHorarioDetalle = [];
    $scope.empresaAreaCriterio = {};
    
    $scope.horarioDetalle = [];
    $scope.activeTab = 0;
    
    $scope.agendaDetailCriterio ={
    	idHorario       : $stateParams.idHorario
    	,empresaArea    : $stateParams.empresaArea
    	,fechaAgenda    : $stateParams.fechaAgenda    	
    };
    
    
    $scope.init = function(){
    	inicializacionPantalla($scope, $stateParams,$location);
    	    	
        $scope.consulta();    	
    };
    
    $scope.consulta = function(){    	
    	AgendaTotalController.detail($scope.agendaDetailCriterio, function(resp){
    		//resp --> AgendaTotal
    		$scope.parametro = resp;
    		$scope.listadoHorarioDetalle = resp.horarioDetalle;
    	});
    };
    
    $scope.detalleCliente = function(idCliente){
    	DetalleClienteModal(idCliente, function(){
    		
    	});
    };
    
    $scope.tieneCita = function(agendaHorarioDetalle){
    	return (agendaHorarioDetalle.citaAsignada != null);
    };

}]);
