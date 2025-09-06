//[COMPONENT]
"use strict";
var myApp = angular.module('MainWindow');                                             

myApp.controller('ListadoComboViewModalController', ['$scope', '$uibModalInstance', '$controller', '$stateParams', '$location', '$q', '$state', '$log', '$window', 'projectSite'
    ,'DTOptionsBuilder' , 'showError', 'showConfirmation',  'systemMessage', 'showMessage' 
    , 'CatalogPKService'  ,'listado', 'valorSeleccionado', 'valueColumn', 'labelColumn', 'callback'
                       , function($scope, $uibModalInstance,  $controller, $stateParams, $location, $q,  $state, $log, $window , projectSite
	, DTOptionsBuilder  ,  showError,  showConfirmation ,  systemMessage,  showMessage
	, CatalogPKService,     listado, valorSeleccionado, valueColumn, labelColumn, callback) {
	
    //inicializacion de datatable.
    $scope.dtOptions = DTOptionsBuilder.newOptions()
    .withPaginationType('full_numbers')
    .withSelect({
       style:    'os',
       selector: 'tr'
    });
    
    $scope.valueColumn = valueColumn;
    $scope.labelColumn = labelColumn;
    $scope.listado = listado;    
    $scope.detalleSeleccionado = valorSeleccionado;
    
        
    //definicion de variables.
    $scope.closed = false;

    $scope.setFilaSeleccionada = function(registro){
    	$scope.detalleSeleccionado = registro;
    };
    
    $scope.getLabelSelected = function(){
    	return $scope.getLabel($scope.detalleSeleccionado);
    };
    
    $scope.getLabel = function(registro){
    	return getPropertyPath(registro, $scope.labelColumn);
    };
    
    $scope.getValueSelected = function(){
    	return $scope.getValue($scope.detalleSeleccionado);
    };
    
    $scope.getValue = function(registro){
    	return getPropertyPath(registro, $scope.valueColumn);
    };
    

	$scope.closeWindow = function(){
	    $uibModalInstance.close();
	};
    
    $scope.seleccionar = function(){
    	if (callback != null){
    	    callback($scope.detalleSeleccionado);    		
    	}    		          
       $uibModalInstance.close();    
    };
	
}]);

myApp.factory('ListadoComboViewModal', [ '$uibModal',  function( $uibModal) {
    return function( listado, valorSeleccionado, valueColumn, labelColumn  ,callback ) {	         
 	   var modalInstance = $uibModal.open({
 		      animation: true,
 		      templateUrl : 'libraries/components/ListadoComboViewModal.html',
 		      controller  : 'ListadoComboViewModalController',
 		      size: 'lg', 
 		      resolve : {
 		    	 listado : function(){
 		    		 return listado;
 		    	 }
 	             ,valorSeleccionado : function(){
 	            	 return valorSeleccionado; 
 	             }
 	             , valueColumn   : function(){
 	            	 return valueColumn;
 	             }
 	             , labelColumn   : function(){
 	            	 return labelColumn;
 	             }
 	   		     ,callback : function(){
 	   				   return callback;
 	   			 } 	   			
 		      } 	   
 	   });
 	   
    };
 }]);


