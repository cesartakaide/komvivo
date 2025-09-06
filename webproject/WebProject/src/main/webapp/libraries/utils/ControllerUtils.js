"use strict";

//programacion de botones.
//function cmdButtonCallbackBind(opcion, functAceptar, $scope){
//	$scope.$emit('MAIN-enableButton', { name : opcion });
//	$scope.$on('onClickEvent_' + opcion, function(evt){
//	   functAceptar(evt);
//	});
//}

function cmdButtonCallbackBind(buttonMetadata, functAceptar, $scope, $log){
	//validar si el boton se encuentra habilitado.	
	
	if (buttonMetadata.authorised){
	    $scope.$emit('MAIN-enableButton', { name : buttonMetadata.buttonName });
	    $scope.$on('onClickEvent_' + buttonMetadata.buttonName, function(evt){
	       functAceptar(evt);
	    });
	}else{
		$log.info('BOTON (' + buttonMetadata.buttonName + ') SE ENCUENTRA DESHABILITADO');
	};
};


function inicializacionPantalla($scope, $stateParams, $location ){	
	
	$scope.$emit('MAIN-disableAll');
	$location.replace();
	
	/*var reset = $stateParams.reset;
	if (reset){
		$scope.$emit('resetNavigationBar');
	}	
	
	var linkItemData = {
		urlValue :	$stateParams.urlValue
		,linkAlias :	$stateParams.linkAlias
		,linkType  :   $stateParams.linkType
		,urlParams :	$stateParams.urlParams
		,stateParams : $stateParams
	};
	$scope.$emit('addLinkItem', linkItemData);	*/
	
}
/*
function inicializacionPantallaMantto($scope, $log, defaultDataFunction){	
	cmdButtonCallbackBind('HelpScreen', function(evt){
		alert('ESTA ES LA PANTALLA DE AYUDA de ' + $stateParams.linkAlias);
	}, $scope);
	
	if ($scope.operacion != null && $scope.operacionMantto != null){
		//activar el boton correspondiente.
		if ($scope.operacion == 'I'){
			cmdButtonCallbackBind('Agregar', $scope.operacionMantto, $scope);
			if (defaultDataFunction != null){
				defaultDataFunction($scope);
			}
		}
		if ($scope.operacion == 'U'){
			cmdButtonCallbackBind('Actualizar', $scope.operacionMantto, $scope);
			$scope.consulta();
		}
		if ($scope.operacion == 'D'){
			cmdButtonCallbackBind('Eliminar', $scope.operacionMantto, $scope);
			$scope.consulta();
		}			
	}else{
		$log.info('OPERACION NO DEFINIDA');
	}
}*/

function initGrid($scope, columnDefs){
	var gridData = { enableRowSelection: true, enableRowHeaderSelection: false };
    gridData.data = [];
	gridData.columnDefs = columnDefs;	
	gridData.multiSelect = false;
	gridData.modifierKeysToMultiSelect = false;
	gridData.noUnselect = true;
	gridData.onRegisterApi = function( gridApi ) {
		gridData.gridApi = gridApi;
    };
    return gridData;
}

function getFromGrid(gridData){
	var fila= gridData.gridApi.selection.getSelectedRows();
	return fila[0];
}