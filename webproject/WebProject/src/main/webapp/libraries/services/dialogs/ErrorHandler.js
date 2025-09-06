//[SERVICE]
'use strict';
var myApp = angular.module('MainWindow');

myApp.controller('ErrorHandlerController', ['$scope', '$uibModalInstance', 'data', 'headers'
                              ,  function($scope, $uibModalInstance, data, headers) {
	
	$scope.data = data; //RestException
	$scope.headers = headers;
	$scope.missingFields = [];
	
	if (esNulo($scope.autorized)){
		$scope.autorized = true;
	}
	
	$scope.isAutorizationProcessError = function(){
		return ($scope.data.autorizationError === true);
	};
	
	$scope.setMissingFieldValidation = function(){
		$scope.missingFields = JSON.parse(decodeURIComponent($scope.headers.error_campos_nulos));
		var d = $scope.missingFields.length;
		for(var c = 0; c < d; c++){
			var missingField = $scope.missingFields[c];
			if (esNulo(missingField.alias)){
				missingField.alias = missingField.path;
			}
		}		
	};
		
	
	$scope.isMissingFieldsValidationError = function(){
		return ($scope.data.validationError === true);
	};
	
	if ($scope.isMissingFieldsValidationError()){
		$scope.setMissingFieldValidation();
	}
	
	$scope.isInvalidDataValidationError = function(){
		return !esNulo($scope.headers.error_campo_novalido);
	};
	
	$scope.isAutorized = function(){
		return ($scope.autorized === true);
	};
	
	$scope.aceptar = function(){
		$uibModalInstance.close();		
	};	
	
}]).factory('errorHandler', [ '$uibModal',  function( $uibModal) {
   return function( data, headers) {	   
     
	   var modalInstance = $uibModal.open({
		   animation: true,
		   templateUrl : 'libraries/services/dialogs/ErrorHandler.html',
		   controller: 'ErrorHandlerController',
		   size: 'md', 
		   resolve : {
	          data : function(){
	           	 return data;
	          }
	   	     ,headers : function(){
	   	    	 return headers;
	   	     }
		   }
	   });
	   
   };
}]);