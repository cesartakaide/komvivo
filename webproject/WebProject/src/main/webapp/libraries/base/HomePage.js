"use strict";
var myApp = angular.module('MainWindow');                                             
//titulo [detalle servicio][GENERADO POR SPAGEN][24/01/2018 04:01:06]
myApp.controller('HomePageController', ['$scope', '$controller', '$stateParams', '$location', '$q', '$state', '$log'
                    ,'DTOptionsBuilder' , 'showError', 'showConfirmation',  'executeAjax', 'systemMessage', 'showMessage' , 'executeAjaxConf' 

                                       , function($scope,  $controller, $stateParams, $location, $q,  $state, $log
					, DTOptionsBuilder , showError   ,  showConfirmation, executeAjax, systemMessage, showMessage, executeAjaxConf
					) {
     //inicializacion de datatable.
    $scope.dtOptions = DTOptionsBuilder.newOptions()
    .withPaginationType('full_numbers')
    .withSelect({
       style:    'os',
       selector: 'tr'
    });    
    
    $scope.init = function(){
    	$log.log('PAGINA PRINCIPAL');
    };
}]);    
