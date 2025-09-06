//[SERVICE]
'use strict';
var myApp = angular.module('MainWindow');

myApp.controller('MensajeConfirmacionController', ['$scope', '$uibModalInstance', 'systemMessage'
                                                   ,  'message', 'functionPointer'
                                   ,  function($scope, $uibModalInstance , systemMessage
                                  		        ,  message, functionPointer) {                	
      $scope.dato = {     		
          mensaje : message
          ,acepta : false
      };
                	
      $scope.aceptar = function(){    	
      	$scope.dato.acepta = true;      
      	functionPointer();
        $uibModalInstance.close();
      };
      
      $scope.cancelar = function(){    	
      	$scope.dato.acepta = false;
      	systemMessage('Operacion cancelada....');
      	$uibModalInstance.close();  
      };
  }]);

  myApp.factory('showConfirmation', [ '$uibModal',  function( $uibModal) {
     return function( message, functionPointer) {	   
       
  	   var modalInstance = $uibModal.open({
  		      animation: true,
  		      templateUrl : 'libraries/services/dialogs/ConfirmModalPage.html',
  		      controller: 'MensajeConfirmacionController',
  		      size: 'md', 
  		      resolve : {
  	             message : function(){
  	            	 return message;
  	             }
  	             ,functionPointer : function(){
  	            	 return functionPointer;
  	             }
  		      }
  	   });
  	   
     };
  }]);
  