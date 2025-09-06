//[SERVICE]
'use strict';
var myApp = angular.module('MainWindow');

myApp.controller('ShowMessageController', ['$scope', '$uibModalInstance', 'systemMessage'
                                                   ,  'message'
                                   ,  function($scope, $uibModalInstance , systemMessage
                                  		        ,  message) {                	
      $scope.dato = {     		
          mensaje : message
      };
                	
      $scope.aceptar = function(){    	      	      	
          $uibModalInstance.close();
      };
      
}]);

myApp.factory('showMessage', [ '$uibModal',  function( $uibModal) {
       return function( message) {	   
       
  	   var modalInstance = $uibModal.open({
  		      animation: true,
  		      templateUrl : 'libraries/services/dialogs/ShowMessage.html',
  		      controller: 'ShowMessageController',
  		      size: 'md', 
  		      resolve : {
  	             message : function(){
  	            	 return message;
  	             }
  		      }
  	   });
  	   
     };
}]);
  