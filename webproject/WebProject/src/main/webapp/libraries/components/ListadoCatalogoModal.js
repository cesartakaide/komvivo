//[COMPONENT]
"use strict";
var myApp = angular.module('MainWindow');                                             

myApp.controller('ListadoCatalogoModalController', ['$scope', '$controller', '$stateParams', '$location', '$q', '$state', '$log', '$window', 'projectSite'
    ,'DTOptionsBuilder' , 'showError', 'showConfirmation',  'systemMessage', 'showMessage' 
    , 'CatalogPKService'  ,'catalogPK', 'callback'
                       , function($scope,  $controller, $stateParams, $location, $q,  $state, $log, $window , projectSite
	, DTOptionsBuilder  ,  showError,  showConfirmation ,  systemMessage,  showMessage
	, CatalogPKService,  catalogPK, callback) {
	
    //inicializacion de datatable.
    $scope.dtOptions = DTOptionsBuilder.newOptions()
    .withPaginationType('full_numbers')
    .withSelect({
       style:    'os',
       selector: 'tr'
    });    
    
    $scope.catalogPK = catalogPK;
    $scope.listado = [];    
    $scope.detalleSeleccionado = {};
        
    //definicion de variables.
    $scope.closed = false;
    
    $scope.init = function(){
    	CatalogPKService.list($scope.catalogPK, function(resp){
    		copyArray(resp, $scope.listado); 
    	});
    };
    
    $scope.setFilaSeleccionada = function(registro){
    	$scope.detalleSeleccionado = registro;
    };

    $scope.init();

	$scope.closeWindow = function(){
	    $uibModalInstance.close();
	};
    
    $scope.seleccionar = function(){
       callBack($scope.detalleSeleccionado);           
       $uibModalInstance.close();    
    };
	
}]);

myApp.factory('ListadoCatalogoModal', [ '$uibModal',  function( $uibModal) {
    return function( catalogPK  ,callBack ) {	         
 	   var modalInstance = $uibModal.open({
 		      animation: true,
 		      templateUrl : 'libraries/components/ListadoCatalogoModal.html',
 		      controller  : 'ListadoCatalogoModalController',
 		      size: 'lg', 
 		      resolve : {
 		    	 catalogPK : function(){
 		    		  return catalogPK;
 		    	 }
 	   		     ,callBack : function(){
 	   				   return callBack;
 	   			 } 	   			
 		      } 	   
 	   });
 	   
    };
 }]);


