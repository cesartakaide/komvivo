//[SERVICE]
'use strict';
var myApp = angular.module('MainWindow');

myApp.controller('MensajeErrorController', ['$scope', '$uibModalInstance', 'mensajeError'
                              ,  function($scope, $uibModalInstance, mensajeError) {
		
	
	$scope.dato = {
		texto : mensajeError		
	};
	
	$scope.click = function(){
		$uibModalInstance.close();		
	};
		
}]).factory('showError', [ '$uibModal', '$log', '$rootScope', function( $uibModal, $log, $rootScope) {
   return function(mensaje) {	   
       $log.error(mensaje);
       var message = {
    		systemMessage : mensaje
    		,messageType  : 'ERROR'
       }
       $rootScope.$broadcast('footer_system_message_update', message);
	   var modalInstance = $uibModal.open({
		      animation: true,
		      templateUrl : 'libraries/services/dialogs/ShowError.html',
		      controller: 'MensajeErrorController',
		      size: 'md',
		      resolve : {
		    	  mensajeError : function(){		    		  		    		 
		    		  return mensaje;
		    	  }
		      }
	   });
   };
}]);

