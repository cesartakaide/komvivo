<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">
<html>
<head>


  <script type="text/javascript" src="libraries/frameworks/jquery2.1/jquery.js"></script>  
  <script type="text/javascript" src="libraries/frameworks/bootstrap/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="libraries/frameworks/bootstrap/css/bootstrap.min.css">
  
  <script type="text/javascript" src="libraries/frameworks/datatables/datatables.min.js"></script>
  <link rel="stylesheet" href="libraries/frameworks/datatables/datatables.min.css">
  <link rel="stylesheet" href="libraries/frameworks/datatables/Select-1.1.2/css/select.dataTables.min.css">
  <link rel="stylesheet" href="libraries/frameworks/datatables/Select-1.1.2/css/select.bootstrap.min.css">
  
  <script type="text/javascript" src="libraries/frameworks/angular/angular.js"></script>
  <script type="text/javascript" src="libraries/frameworks/angular/angular-route.js"></script>
  <script type="text/javascript" src="libraries/frameworks/angular/angular-resource.js"></script>
  <script type="text/javascript" src="libraries/frameworks/angular/angular-ui-router.min.js"></script>   
       
  <script type="text/javascript" src="libraries/frameworks/angular/grid/ui-grid.js"></script>
  <script type="text/javascript" src="libraries/frameworks/angular/ui-bootstrap-tpls-1.3.2.js"></script>  
       
  <script type="text/javascript" src="libraries/frameworks/angular/angular-datatables/angular-datatables.min.js"></script>
  <link rel="stylesheet" href="libraries/frameworks/angular/angular-datatables/css/angular-datatables.min.css">  
  <script type="text/javascript" src="libraries/frameworks/angular/angular-datatables/plugins/select/angular-datatables.select.min.js"></script>
  
  <script type="text/javascript" src="libraries/frameworks/bootstrap/fileInput/js/fileinput.min.js"></script>
  <link rel="stylesheet" href="libraries/frameworks/bootstrap/fileInput/css/fileinput.min.css">  
  
  <link rel="stylesheet" href="libraries/frameworks/angular/grid/ui-grid.css">
  
  <script type="text/javascript" src="libraries/frameworks/bootstrap/datepicker/js/bootstrap-datepicker.min.js"></script>
  <link rel="stylesheet" href="libraries/frameworks/bootstrap/datepicker/css/bootstrap-datepicker.min.css">    



  <script type="text/javascript" src="libraries/utils/AppConfig.js"></script>
  <script type="text/javascript" src="libraries/utils/ControllerUtils.js"></script>
  <script type="text/javascript" src="libraries/utils/ScriptUtils.js"></script>

  <script type="text/javascript">
    angular.element(document.getElementsByTagName('head')).append(angular.element('<base href="' + window.location.pathname + '" />'));
  </script> 

<style>
    input {
        max-width: 100%;
    }
    select {
        max-width: 100%;
    }  
</style>

</head>

     
<body ng-app="MainWindow">
   <div class="container-fluid" ng-controller="MainController" ng-init="init()">
   <div class="row">
      <div class="col-xs-12">
      <nav class="navbar navbar-default">
        <div class="container-fluid">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#"></a>
          </div>  
            <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
               <li class="active"><a href="/WEBMyErpProject/main">Home</a></li>
               <li class="dropdown">
                  <a href="#" onClick="return false;" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Administracion<span class="caret"></span></a>
				  <ul class="dropdown-menu">
                     <li><a ui-sref="ListadoArea_fromMenu">listado de areas</a></li>                     
                     <li><a ui-sref="ListadoEmpleado_fromMenu">listado de empleados</a></li>                     
                     <li><a ui-sref="ListadoImpresora_fromMenu">listado impresora</a></li>                     
                     <li><a ui-sref="ListadoPlanilla_fromMenu">listado de planilla</a></li>                     
                     <li><a ui-sref="ListadoTerminal_fromMenu">listado de terminales</a></li>                     
                     <li><a ui-sref="ListadoUbicacion_fromMenu">listado de ubicaciones</a></li>                     
                  </ul>
               </li>
               <li class="dropdown">
                  <a href="#" onClick="return false;" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Entidades<span class="caret"></span></a>
				  <ul class="dropdown-menu">
                     <li><a ui-sref="ListadoCliente_fromMenu">clientes</a></li>                     
                     <li><a ui-sref="ListadoDireccion_fromMenu">direcciones</a></li>                     
                     <li><a ui-sref="ListadoEvento_fromMenu">eventos</a></li>                     
                     <li><a ui-sref="ListadoPersona_fromMenu">personas</a></li>                     
                  </ul>
               </li>
               <li class="dropdown">
                  <a href="#" onClick="return false;" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Operaciones<span class="caret"></span></a>
				  <ul class="dropdown-menu">
                     <li><a ui-sref="DespliegueAgendaParametros_fromMenu">agenda del dia</a></li>                     
                     <li><a ui-sref="ListadoCuentaXCobrar_fromMenu">listado cuenta x cobrar</a></li>                     
                     <li><a ui-sref="ListadoFacturas_fromMenu">facturacion</a></li>                     
                     <li><a ui-sref="ListadoPresupuesto_fromMenu">listado presupuestos</a></li>                     
                     <li><a ui-sref="ListadoProducto_fromMenu">productos</a></li>                     
                     <li><a ui-sref="ListadoServicios_fromMenu">servicios</a></li>                     
                  </ul>
               </li>
            </ul>                     
          </div><!--/.nav-collapse -->
        </div><!--/.container-fluid -->
      </nav>           
   </div>
   <div class="row">
  	  	<div class="col-xs-1">
  	  	  <!-- barra de botones. -->	  	    	  	  
  	  	  <div class="row" ng-repeat="boton in botones">
	         <a href="#"  onclick="return false;" ng-if="boton.enabled" popover-placement="right"  uib-popover="{{boton.title}}" popover-trigger="'mouseenter'" >	          
	            <img ng-src="{{boton.iconSrc}}" ng-click="click(boton)" width="60px" height="60px"><br><label>{{boton.title}}</label>
	         </a>
	         
	         <img ng-src="{{boton.iconDisabledSrc}}" ng-if="!boton.enabled"  width="60px" height="60px">
          </div>
  	  	</div>
  	  	<div class="col-xs-11">		 
  	  	   <div class="row"> 	
			   <ol class="breadcrumb">  
			      <li class="breadcrumb-item"><a href="/WEBMyErpProject/main">Home</a></li>      
	              <li class="breadcrumb-item" ng-repeat="linkItem in navigationHistory.itemList">	                 	                 
	                 <a ng-if="linkItem.asLink" ui-sref="#" onClick="return false;"  ng-click="linkItem.onClick()" >{{linkItem.getLinkAlias()}}</a>
	                 <label ng-if="!linkItem.asLink">{{linkItem.getLinkAlias()}} </label>	                 	                 
	              </li>
	           </ol>
           </div>
           <div class="row">
              <div class="panel panel-default">
                <div ui-view="content" class="panel-body">		   		   
		   		</div>
		   		<div ui-view="footer" class="panel-footer">		   		   
		   		</div>		   		
	          </div>
	       </div>
        </div>
      </div>
   </div>
<script type="text/javascript">
var myApp = angular.module('MainWindow',['ui.bootstrap','ui.grid', 'ui.router'
                                       , 'ui.grid.selection', 'datatables', 'datatables.select'
                                       , 'ngResource']);
</script>     

 
   
    


<script type="text/javascript">
//inicializacion de constantes.
var projectSiteData = {
    siteName           : 'WEBMyERPProject'
    ,projectUserMethodRootPath        :'/app/userMethods'
    ,reportGeneratorServlet : 'reportGenerator'
	,sourceDeliveryServlet  : 'sourceDelivery'
	,appBaseDir             : 'libraries'
	,autorizationDisabled : true

         
    ,viewList   : [
    ]    
}
myApp.constant('projectSite',projectSiteData);
//temporal.
var actualUser = {
    userName : '[NO USER]'
};
myApp.value('userData', actualUser);

myApp.controller('MainController', ['$transitions', '$rootScope', '$scope', '$location', '$log', 'projectSite', 'showMessage', 'NavigationHistoryService', 'UserDataInitService'
                          ,function ($transitions,  $rootScope, $scope,  $location, $log, projectSite, showMessage, NavigationHistoryService, UserDataInitService) {   
    $scope.$location = $location;   
    
    $scope.initBreadCumbs = function(){
    	$scope.linkItems=[];     	
    };
   
    $scope.$on('MAIN-disableAll', function(event, arg){
    	var f = $scope.botones.length;
    	for (var i=0; i<f; i++){
    		if ($scope.botones[i].enabled){
    			$scope.botones[i].enabled = false;    			
    		}
    	}    	
    });
    
    $scope.$on('MAIN-enableButton', function(event, arg){
    	var buttonName = arg.name;
    	var f = $scope.botones.length;
    	for (var i=0; i<f; i++){
    		if ($scope.botones[i].name == buttonName){
    			$scope.botones[i].enabled = true;
    			return;
    		}
    	}
    	$log.info('BOTON (' + buttonName + ') NO ENCONTRADO');
    });    
    
    $scope.click = function(botonPresionado){
    	$log.info('BOTON PRESIONADO:' + botonPresionado.name);
    	$scope.$emit('cmdButtonClick_' + botonPresionado.name, botonPresionado);
    };    
    
	$scope.$on('addLinkItem', function(event, arg){
		var itemName =arg.linkAlias;
		var url= arg.urlValue;
		var urlParams = arg.urlParams;
		var stateParams = arg.stateParams;
		
		//$scope.addItem(itemName, url, urlParams, stateParams);
		addItem($scope, itemName, url, urlParams, stateParams);
	});
	
	$scope.$on('resetNavigationBar', function(event, arg){
    	$scope.initBreadCumbs();
	});
    
		
	$scope.$on('MAIN-enableButton', function(event, arg){
		$scope.$broadcast('MENUBAR-enableButton', arg);
	});
    
	$scope.linkItemClick = function(linkItemSeleccionado){
		linkItemClick($scope, linkItemSeleccionado);
	};
	
	$scope.navigationHistory = {};
	NavigationHistoryService($scope.navigationHistory);	
    
   
    $scope.init = function(){
   		$scope.initBreadCumbs();
   		$scope.botones  = [
        {
             name : 'boton_revertir'             	
    	  	,iconSrc : 'libraries/icons/minus.png'
    	  	,iconDisabledSrc : 'libraries/icons/minus_disabled.png'
    	  	,title   : 'Revertir'    
    	   	,enabled : false
    	  }
  ,      {
             name : 'boton_aceptar'             	
    	  	,iconSrc : 'libraries/icons/accept.png'
    	  	,iconDisabledSrc : 'libraries/icons/accept_disabled.png'
    	  	,title   : 'Aceptar'    
    	   	,enabled : false
    	  }
  ,      {
             name : 'boton_actualizar'             	
    	  	,iconSrc : 'libraries/icons/update.png'
    	  	,iconDisabledSrc : 'libraries/icons/update_disabled.png'
    	  	,title   : 'Actualizar'    
    	   	,enabled : false
    	  }
  ,      {
             name : 'boton_detalle'             	
    	  	,iconSrc : 'libraries/icons/detail.png'
    	  	,iconDisabledSrc : 'libraries/icons/detail_disabled.png'
    	  	,title   : 'Detalle'    
    	   	,enabled : false
    	  }
  ,      {
             name : 'boton_generar'             	
    	  	,iconSrc : 'libraries/icons/upload.png'
    	  	,iconDisabledSrc : 'libraries/icons/plus_disabled.png'
    	  	,title   : 'Generar'    
    	   	,enabled : false
    	  }
  ,      {
             name : 'boton_cancelar'             	
    	  	,iconSrc : 'libraries/icons/minus.png'
    	  	,iconDisabledSrc : 'libraries/icons/minus_disabled.png'
    	  	,title   : 'Cancelar'    
    	   	,enabled : false
    	  }
  ,      {
             name : 'boton_agregar'             	
    	  	,iconSrc : 'libraries/icons/plus.png'
    	  	,iconDisabledSrc : 'libraries/icons/plus_disabled.png'
    	  	,title   : 'Agregar'    
    	   	,enabled : false
    	  }
  ,      {
             name : 'boton_informacion'             	
    	  	,iconSrc : 'libraries/icons/info.png'
    	  	,iconDisabledSrc : 'libraries/icons/info_disabled.png   '
    	  	,title   : 'Informacion'    
    	   	,enabled : false
    	  }
  ,      {
             name : 'boton_eliminar'             	
    	  	,iconSrc : 'libraries/icons/minus.png'
    	  	,iconDisabledSrc : 'libraries/icons/minus_disabled.png'
    	  	,title   : 'Eliminar'    
    	   	,enabled : false
    	  }
  ,      {
             name : 'boton_upload'             	
    	  	,iconSrc : 'libraries/icons/upload.png'
    	  	,iconDisabledSrc : 'libraries/icons/plus_disabled.png         	'
    	  	,title   : 'Upload'    
    	   	,enabled : false
    	  }
  ,      {
             name : 'boton_download'             	
    	  	,iconSrc : 'libraries/icons/download.png'
    	  	,iconDisabledSrc : 'libraries/icons/download_disabled.png'
    	  	,title   : 'Download'    
    	   	,enabled : false
    	  }
  ,      {
             name : 'boton_ayuda'             	
    	  	,iconSrc : 'libraries/icons/help.png'
    	  	,iconDisabledSrc : 'libraries/icons/help_disabled.png'
    	  	,title   : '"Pantalla de ayuda"'    
    	   	,enabled : false
    	  }
       ];	
       
       $log.info('INICIALIZANDO BARRA DE BOTONES');    	    	

       //habilitar comunicacion de los botones.
    	$scope.botones.forEach(function(boton){
    		$log.info('HACIENDO DEPLOY DEL BOTON:' + boton.name);
    		var name = boton.name;		
    		$scope.$on('cmdButtonClick_' + name, function(event, arg){
    			$log.info('RETRANSMITIENDO');
    			$scope.$broadcast('onClickEvent_' + name);
    		});	
    	});
    	
    };   
    
    $transitions.onStart({}, function(transition){
       $log.log('TRANSITION (start)'); 	   
 	   var destinyState = transition.params('to'); 
 	   var destinyParams = transition.$to();
 	   if (destinyState.urlValue == 'nullState'){
 		   transition.abort(); 		 
 	   }else{
 	 	   //procesar transicion.
 	 	   $scope.navigationHistory.addItem(destinyParams.name, destinyState);
 	   }    	    	   
    });   
    
    $transitions.onError({}, function(transition){
 	   $log.log('TRANSITION (ERROR)');
 	   showMessage('PANTALLA NO ENCONTRADA O NO ESTA AUTORIZADO');
 	   return false;
    });   
          
}]);




myApp.config(['$stateProvider', '$urlRouterProvider'
    , function($stateProvider,   $urlRouterProvider) {      
     
     //carga de todos los links.
     //tomar en cuenta que se deben barrer unicamente las pantallas habilitadas para este CANAL.
     addRoute('libraries/base', 'ListadoHorario', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoHorario&TYPE=SCREEN_PAGE', 'listado de horario'
        , [   ]
, $stateProvider, false);     
     addRoute('libraries/base', 'DetalleCuentaBancaria', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=DetalleCuentaBancaria&TYPE=SCREEN_PAGE', 'detalle cuenta bancaria'
        , ['state','idCuentaBancaria'   ]
, $stateProvider, false);     
     addRoute('libraries/base', 'ListadoNitModal', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoNitModal&TYPE=SCREEN_PAGE', 'listado de nits'
        , [   ]
, $stateProvider, false);     
     addRoute('libraries/base', 'ListadoEmpleadoServicioModal', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoEmpleadoServicioModal&TYPE=SCREEN_PAGE', 'listado de servicios por empleado modal'
        , ['idEmpleado','idServicio'   ]
, $stateProvider, false);     
     addRoute('libraries/base', 'ListadoEvento', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoEvento&TYPE=SCREEN_PAGE', 'listado de eventos'
        , [   ]
, $stateProvider, false);     
     addRoute('libraries/base', 'ListadoUbicacion', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoUbicacion&TYPE=SCREEN_PAGE', 'listado de ubicacion'
        , [   ]
, $stateProvider, false);     
     addRoute('libraries/base', 'InformacionCita', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=InformacionCita&TYPE=SCREEN_PAGE', 'informacion de cita'
        , ['state','idRecurso','tipoRecurso','idEmpresaArea','fecha','idHorarioDetalle','idCita'   ]
, $stateProvider, false);     
     addRoute('libraries/base', 'DetalleEmpleadoPlanilla', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=DetalleEmpleadoPlanilla&TYPE=SCREEN_PAGE', 'detalle de planilla'
        , ['state','idPlanilla','idEmpleado'   ]
, $stateProvider, false);     
     addRoute('libraries/base', 'DetalleClienteModal', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=DetalleClienteModal&TYPE=SCREEN_PAGE', 'detalle cliente modal'
        , ['idCliente'   ]
, $stateProvider, false);     
     addRoute('libraries/base', 'DetalleTerminal', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=DetalleTerminal&TYPE=SCREEN_PAGE', 'detalle terminal'
        , ['state','idTerminal'   ]
, $stateProvider, false);     
     addRoute('libraries/base', 'IngresoRapidoPersonaModal', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=IngresoRapidoPersonaModal&TYPE=SCREEN_PAGE', 'creacion rapida de persona'
        , [   ]
, $stateProvider, false);     
     addRoute('libraries/base', 'ListadoOrdenCliente', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoOrdenCliente&TYPE=SCREEN_PAGE', 'listado orden cliente'
        , [   ]
, $stateProvider, false);     
     addRoute('libraries/base', 'DetalleHorario', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=DetalleHorario&TYPE=SCREEN_PAGE', 'Detalle de horarios'
        , ['state','idHorario'   ]
, $stateProvider, false);     
     addRoute('libraries/base', 'ListadoFacturas', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoFacturas&TYPE=SCREEN_PAGE', 'listado de facturas'
        , [   ]
, $stateProvider, false);     
     addRoute('libraries/base', 'ListadoProductoModal', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoProductoModal&TYPE=SCREEN_PAGE', 'listado modal de productos'
        , [   ]
, $stateProvider, false);     
     addRoute('libraries/base', 'DetalleCuentaXCobrar', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=DetalleCuentaXCobrar&TYPE=SCREEN_PAGE', 'detalle cuenta por cobrar'
        , ['state','idCuentaXCobrar'   ]
, $stateProvider, false);     
     addRoute('libraries/base', 'DetalleUbicacion', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=DetalleUbicacion&TYPE=SCREEN_PAGE', 'Detalle ubicacion'
        , ['state','idUbicacion'   ]
, $stateProvider, false);     
     addRoute('libraries/base', 'DetalleProducto', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=DetalleProducto&TYPE=SCREEN_PAGE', 'detalle producto'
        , ['state','idProducto'   ]
, $stateProvider, false);     
     addRoute('libraries/base', 'ListadoTipoServicio', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoTipoServicio&TYPE=SCREEN_PAGE', 'listado de tipo servicio'
        , [   ]
, $stateProvider, false);     
     addRoute('libraries/base', 'ListadoOrdenServicioClienteModal', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoOrdenServicioClienteModal&TYPE=SCREEN_PAGE', 'listado orden servicio modal'
        , ['idCliente'   ]
, $stateProvider, false);     
     addRoute('libraries/base', 'DetalleEmpleado', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=DetalleEmpleado&TYPE=SCREEN_PAGE', 'detalle de empleado'
        , ['state','idEmpleado'   ]
, $stateProvider, false);     
     addRoute('libraries/base', 'ListadoCatalogoMunicipios', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoCatalogoMunicipios&TYPE=SCREEN_PAGE', 'listado municipios'
        , ['pais','departamento'   ]
, $stateProvider, false);     
     addRoute('libraries/base', 'ListadoCitasPorDiaHorarioDetalleModal', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoCitasPorDiaHorarioDetalleModal&TYPE=SCREEN_PAGE', 'listado de citas'
        , ['idEmpresaArea','fecha','idHorarioDetalleInicio','idHorarioDetalleFinal'   ]
, $stateProvider, false);     
     addRoute('libraries/base', 'ListadoTerminal', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoTerminal&TYPE=SCREEN_PAGE', 'listado terminal'
        , [   ]
, $stateProvider, false);     
     addRoute('libraries/base', 'DetalleReferenciaPersonalModal', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=DetalleReferenciaPersonalModal&TYPE=SCREEN_PAGE', 'detalle cuenta bancaria'
        , ['state','idPersona','idReferencia'   ]
, $stateProvider, false);     
     addRoute('libraries/base', 'InformacionFactura', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=InformacionFactura&TYPE=SCREEN_PAGE', 'informacion de facturas'
        , ['state','idFactura','idCita','idCliente','nombreCliente','tipoAsociado'   ]
, $stateProvider, false);     
     addRoute('libraries/base', 'DetalleArea', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=DetalleArea&TYPE=SCREEN_PAGE', 'detalle de area'
        , ['state','idArea'   ]
, $stateProvider, false);     
     addRoute('libraries/base', 'ListadoProducto', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoProducto&TYPE=SCREEN_PAGE', 'listado de productso'
        , [   ]
, $stateProvider, false);     
     addRoute('libraries/base', 'ListadoServicioModal', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoServicioModal&TYPE=SCREEN_PAGE', 'listado servicio modal'
        , [   ]
, $stateProvider, false);     
     addRoute('libraries/base', 'ListadoAreaModal', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoAreaModal&TYPE=SCREEN_PAGE', 'listado de area modal'
        , [   ]
, $stateProvider, false);     
     addRoute('libraries/base', 'DetalleServicio', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=DetalleServicio&TYPE=SCREEN_PAGE', 'detalle de servicio'
        , ['state','idServicio'   ]
, $stateProvider, false);     
     addRoute('libraries/base', 'ListadoPersonaModal', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoPersonaModal&TYPE=SCREEN_PAGE', 'listado de personas modal'
        , [   ]
, $stateProvider, false);     
     addRoute('libraries/base', 'ListadoDireccionModal', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoDireccionModal&TYPE=SCREEN_PAGE', 'listado de direcciones'
        , [   ]
, $stateProvider, false);     
     addRoute('libraries/base', 'ListadoCuentaBancariaPersona', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoCuentaBancariaPersona&TYPE=SCREEN_PAGE', 'listado cuenta bancaria persona modal'
        , ['idPersona','noAsignada'   ]
, $stateProvider, false);     
     addRoute('libraries/base', 'DetalleEvento', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=DetalleEvento&TYPE=SCREEN_PAGE', 'detalle de eventos'
        , ['state','idEvento'   ]
, $stateProvider, false);     
     addRoute('libraries/base', 'DetalleImpresora', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=DetalleImpresora&TYPE=SCREEN_PAGE', 'detalle de impresora'
        , ['state','idImpresora'   ]
, $stateProvider, false);     
     addRoute('libraries/base', 'ListadoCatalogoDepartamentos', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoCatalogoDepartamentos&TYPE=SCREEN_PAGE', 'listado departamentos'
        , ['pais'   ]
, $stateProvider, false);     
     addRoute('libraries/base', 'DetalleMedioContactoModal', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=DetalleMedioContactoModal&TYPE=SCREEN_PAGE', 'detalle medio contacto'
        , ['state','idPersona','idMedioContacto'   ]
, $stateProvider, false);     
     addRoute('libraries/base', 'IngresoFormaPagoModal', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=IngresoFormaPagoModal&TYPE=SCREEN_PAGE', 'forma de pago'
        , ['state','tipoFormaPago','idDocumento'   ]
, $stateProvider, false);     
     addRoute('libraries/base', 'ListadoEmpleadoModal', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoEmpleadoModal&TYPE=SCREEN_PAGE', 'listado de empleados modal'
        , [   ]
, $stateProvider, false);     
     addRoute('libraries/base', 'AsociarEventoPersonaModal', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=AsociarEventoPersonaModal&TYPE=SCREEN_PAGE', 'listado evento modal'
        , ['idPersona','idEventoPersona'   ]
, $stateProvider, false);     
     addRoute('libraries/base', 'ListadoArea', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoArea&TYPE=SCREEN_PAGE', 'listado de areas'
        , [   ]
, $stateProvider, false);     
     addRoute('libraries/base', 'ListadoCatalogoZonas', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoCatalogoZonas&TYPE=SCREEN_PAGE', 'listado zonas'
        , ['pais','departamento','municipio'   ]
, $stateProvider, false);     
     addRoute('libraries/base', 'DetalleMovCuentaXCobrarModal', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=DetalleMovCuentaXCobrarModal&TYPE=SCREEN_PAGE', 'detalle movimiento cuenta por cobrar'
        , ['idMovCuentaXCobrar'   ]
, $stateProvider, false);     
     addRoute('libraries/base', 'AsociarCuentaPersonaModal', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=AsociarCuentaPersonaModal&TYPE=SCREEN_PAGE', 'asociar cuenta a persona'
        , ['idPersona'   ]
, $stateProvider, false);     
     addRoute('libraries/base', 'DetalleOrdenCliente', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=DetalleOrdenCliente&TYPE=SCREEN_PAGE', 'detalle orden servicio'
        , ['state','idOrdenCliente'   ]
, $stateProvider, false);     
     addRoute('libraries/base', 'DetalleEmpresaArea', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=DetalleEmpresaArea&TYPE=SCREEN_PAGE', 'detalle cuenta bancaria'
        , ['state','idEmpresaArea'   ]
, $stateProvider, false);     
     addRoute('libraries/base', 'ListadoImpresora', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoImpresora&TYPE=SCREEN_PAGE', 'listado de impresoras'
        , [   ]
, $stateProvider, false);     
     addRoute('libraries/base', 'DespliegueAgendaParametros', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=DespliegueAgendaParametros&TYPE=SCREEN_PAGE', 'parametros despliegue agenda'
        , [   ]
, $stateProvider, false);     
     addRoute('libraries/base', 'ListadoTipoProducto', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoTipoProducto&TYPE=SCREEN_PAGE', 'listado de tipo producto'
        , [   ]
, $stateProvider, false);     
     addRoute('libraries/base', 'DespliegueAgenda', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=DespliegueAgenda&TYPE=SCREEN_PAGE', 'agenda de citas'
        , ['idHorario','empresaArea','fechaAgenda'   ]
, $stateProvider, false);     
     addRoute('libraries/base', 'DetalleCliente', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=DetalleCliente&TYPE=SCREEN_PAGE', 'detalle cliente'
        , ['state','idCliente'   ]
, $stateProvider, false);     
     addRoute('libraries/base', 'ListadoCliente', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoCliente&TYPE=SCREEN_PAGE', 'listado de cliente'
        , [   ]
, $stateProvider, false);     
     addRoute('libraries/base', 'DetalleReferenciaExterna', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=DetalleReferenciaExterna&TYPE=SCREEN_PAGE', 'listado referencia externa'
        , ['state','idPersona'   ]
, $stateProvider, false);     
     addRoute('libraries/base', 'ListadoPresupuesto', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoPresupuesto&TYPE=SCREEN_PAGE', 'listado presupuesto'
        , [   ]
, $stateProvider, false);     
     addRoute('libraries/base', 'ListadoPersona', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoPersona&TYPE=SCREEN_PAGE', 'listado persona'
        , [   ]
, $stateProvider, false);     
     addRoute('libraries/base', 'ListadoServiciosExternosModal', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoServiciosExternosModal&TYPE=SCREEN_PAGE', 'listado servicio externos'
        , [   ]
, $stateProvider, false);     
     addRoute('libraries/base', 'ListadoCitas', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoCitas&TYPE=SCREEN_PAGE', 'listado de citas'
        , [   ]
, $stateProvider, false);     
     addRoute('libraries/base', 'DetallePresupuesto', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=DetallePresupuesto&TYPE=SCREEN_PAGE', 'detalle presupuesto'
        , ['state','idPersona','idPresupuesto'   ]
, $stateProvider, false);     
     addRoute('libraries/base', 'ListadoServicios', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoServicios&TYPE=SCREEN_PAGE', 'listado de servicios'
        , [   ]
, $stateProvider, false);     
     addRoute('libraries/base', 'DetalleTipoProducto', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=DetalleTipoProducto&TYPE=SCREEN_PAGE', 'detalle tipo producto'
        , ['state','idTipoProducto'   ]
, $stateProvider, false);     
     addRoute('libraries/base', 'ListadoEmpleado', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoEmpleado&TYPE=SCREEN_PAGE', 'listado de empleados'
        , [   ]
, $stateProvider, false);     
     addRoute('libraries/base', 'ListadoEmpresaAreaModal', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoEmpresaAreaModal&TYPE=SCREEN_PAGE', 'detalle cuenta bancaria'
        , [   ]
, $stateProvider, false);     
     addRoute('libraries/base', 'GeneraPlanilla', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=GeneraPlanilla&TYPE=SCREEN_PAGE', 'generar planilla'
        , ['state','idPlanilla'   ]
, $stateProvider, false);     
     addRoute('libraries/base', 'DetallePersona', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=DetallePersona&TYPE=SCREEN_PAGE', 'detalle de personas'
        , ['state','idPersona'   ]
, $stateProvider, false);     
     addRoute('libraries/base', 'ListadoPlanilla', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoPlanilla&TYPE=SCREEN_PAGE', 'listado de planilla'
        , [   ]
, $stateProvider, false);     
     addRoute('libraries/base', 'DetalleTipoServicio', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=DetalleTipoServicio&TYPE=SCREEN_PAGE', 'detalle tipo servicio'
        , ['state','idTipoServicio'   ]
, $stateProvider, false);     
     addRoute('libraries/base', 'ListadoCuentaBancaria', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoCuentaBancaria&TYPE=SCREEN_PAGE', 'listado cuenta bancaria'
        , [   ]
, $stateProvider, false);     
     addRoute('libraries/base', 'ListadoDireccion', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoDireccion&TYPE=SCREEN_PAGE', 'listado de direccion'
        , [   ]
, $stateProvider, false);     
     addRoute('libraries/base', 'DetalleDireccion', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=DetalleDireccion&TYPE=SCREEN_PAGE', 'detalle direccion'
        , ['state','idDireccion'   ]
, $stateProvider, false);     
     addRoute('libraries/base', 'ListadoEmpresaArea', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoEmpresaArea&TYPE=SCREEN_PAGE', 'listado empresa area'
        , [   ]
, $stateProvider, false);     
     addRoute('libraries/base', 'ListadoCuentaXCobrarModal', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoCuentaXCobrarModal&TYPE=SCREEN_PAGE', 'listado cuenta por cobrar'
        , [   ]
, $stateProvider, false);     
     addRoute('libraries/base', 'ListadoClienteModal', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoClienteModal&TYPE=SCREEN_PAGE', 'listado de cliente modal'
        , [   ]
, $stateProvider, false);     
     addRoute('libraries/base', 'ListadoCuentaXCobrar', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoCuentaXCobrar&TYPE=SCREEN_PAGE', 'listado cuenta x cobrar'
        , [   ]
, $stateProvider, false);     

     //cargar los los links a los que se hace referencia desde el menu.
     addRoute('libraries/base', 'ListadoArea_fromMenu', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoArea&TYPE=SCREEN_PAGE', 'listado de areas'
         , [   ]
, $stateProvider, false);                             
     addRoute('libraries/base', 'ListadoEmpleado_fromMenu', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoEmpleado&TYPE=SCREEN_PAGE', 'listado de empleados'
         , [   ]
, $stateProvider, false);                             
     addRoute('libraries/base', 'ListadoImpresora_fromMenu', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoImpresora&TYPE=SCREEN_PAGE', 'listado de impresoras'
         , [   ]
, $stateProvider, false);                             
     addRoute('libraries/base', 'ListadoPlanilla_fromMenu', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoPlanilla&TYPE=SCREEN_PAGE', 'listado de planilla'
         , [   ]
, $stateProvider, false);                             
     addRoute('libraries/base', 'ListadoTerminal_fromMenu', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoTerminal&TYPE=SCREEN_PAGE', 'listado terminal'
         , [   ]
, $stateProvider, false);                             
     addRoute('libraries/base', 'ListadoUbicacion_fromMenu', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoUbicacion&TYPE=SCREEN_PAGE', 'listado de ubicacion'
         , [   ]
, $stateProvider, false);                             
     addRoute('libraries/base', 'ListadoCliente_fromMenu', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoCliente&TYPE=SCREEN_PAGE', 'listado de cliente'
         , [   ]
, $stateProvider, false);                             
     addRoute('libraries/base', 'ListadoDireccion_fromMenu', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoDireccion&TYPE=SCREEN_PAGE', 'listado de direccion'
         , [   ]
, $stateProvider, false);                             
     addRoute('libraries/base', 'ListadoEvento_fromMenu', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoEvento&TYPE=SCREEN_PAGE', 'listado de eventos'
         , [   ]
, $stateProvider, false);                             
     addRoute('libraries/base', 'ListadoPersona_fromMenu', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoPersona&TYPE=SCREEN_PAGE', 'listado persona'
         , [   ]
, $stateProvider, false);                             
     addRoute('libraries/base', 'DespliegueAgendaParametros_fromMenu', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=DespliegueAgendaParametros&TYPE=SCREEN_PAGE', 'parametros despliegue agenda'
         , [   ]
, $stateProvider, false);                             
     addRoute('libraries/base', 'ListadoCuentaXCobrar_fromMenu', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoCuentaXCobrar&TYPE=SCREEN_PAGE', 'listado cuenta x cobrar'
         , [   ]
, $stateProvider, false);                             
     addRoute('libraries/base', 'ListadoFacturas_fromMenu', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoFacturas&TYPE=SCREEN_PAGE', 'listado de facturas'
         , [   ]
, $stateProvider, false);                             
     addRoute('libraries/base', 'ListadoPresupuesto_fromMenu', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoPresupuesto&TYPE=SCREEN_PAGE', 'listado presupuesto'
         , [   ]
, $stateProvider, false);                             
     addRoute('libraries/base', 'ListadoProducto_fromMenu', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoProducto&TYPE=SCREEN_PAGE', 'listado de productso'
         , [   ]
, $stateProvider, false);                             
     addRoute('libraries/base', 'ListadoServicios_fromMenu', 'sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoServicios&TYPE=SCREEN_PAGE', 'listado de servicios'
         , [   ]
, $stateProvider, false);                             

     addRoute('libraries/base', 'OtherWisePage', 'libraries/base/OtherWisePage.html', 'OtherWisePage'
        , []  , $stateProvider, false);
     
     addRoute('libraries/base', 'HomePage', 'libraries/base/HomePage.html', 'HomePage'
         , [] , $stateProvider, false);
     
     addRoute('libraries/base', 'nullState', 'libraries/base/HomePage.html', 'HomePage'
             , [] , $stateProvider, false);               
          
     $urlRouterProvider.when('/', '/HomePage');     
     $urlRouterProvider.when('', '/HomePage');     
     $urlRouterProvider.otherwise('/OtherWisePage');     
     
}]);

</script>


<!-- servicios -->
   <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ManttoRestPrototype.js&DIRECTORY=/libraries/services&TYPE=LIBRARY"></script>
   <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=catalogServices.js&DIRECTORY=/libraries/services&TYPE=LIBRARY"></script>
   <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=UserDataInitService.js&DIRECTORY=/libraries/services&TYPE=LIBRARY"></script>
   <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ViewContextInitializer.js&DIRECTORY=/libraries/services&TYPE=LIBRARY"></script>
   <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=fileUploadService.js&DIRECTORY=/libraries/services&TYPE=LIBRARY"></script>
   <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=confirmDialogService.js&DIRECTORY=/libraries/services/dialogs&TYPE=LIBRARY"></script>
   <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=EnumRestService.js&DIRECTORY=/libraries/services&TYPE=LIBRARY"></script>
   <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=SecurityService.js&DIRECTORY=/libraries/services&TYPE=LIBRARY"></script>
   <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ErrorHandler.js&DIRECTORY=/libraries/services/dialogs&TYPE=LIBRARY"></script>
   <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=CatalogRestService.js&DIRECTORY=/libraries/services&TYPE=LIBRARY"></script>
   <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=enumDataService.js&DIRECTORY=/libraries/services&TYPE=LIBRARY"></script>
   <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=showErrorService.js&DIRECTORY=/libraries/services/dialogs&TYPE=LIBRARY"></script>
   <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=AJAXServices.js&DIRECTORY=/libraries/services&TYPE=LIBRARY"></script>
   <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=systemMessage.js&DIRECTORY=/libraries/services&TYPE=LIBRARY"></script>
   <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=NavigationHistoryService.js&DIRECTORY=/libraries/services&TYPE=LIBRARY"></script>
   <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ShowMessage.js&DIRECTORY=/libraries/services/dialogs&TYPE=LIBRARY"></script>
   <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ReportService.js&DIRECTORY=/libraries/services&TYPE=LIBRARY"></script>

<!-- components -->
   <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoComboViewModal.js&DIRECTORY=/libraries/components&TYPE=VIEW_COMPONENT"></script>
   <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=buttonField.js&DIRECTORY=/libraries/components&TYPE=VIEW_COMPONENT"></script>
   <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=checkField.js&DIRECTORY=/libraries/components&TYPE=VIEW_COMPONENT"></script>
   <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=enumCombo.js&DIRECTORY=/libraries/components&TYPE=VIEW_COMPONENT"></script>
   <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=comboCatalog.js&DIRECTORY=/libraries/components&TYPE=VIEW_COMPONENT"></script>
   <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=searchCatalog.js&DIRECTORY=/libraries/components&TYPE=VIEW_COMPONENT"></script>
   <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=searchButton.js&DIRECTORY=/libraries/components&TYPE=VIEW_COMPONENT"></script>
   <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=InformacionSistema.js&DIRECTORY=/libraries/components&TYPE=VIEW_COMPONENT"></script>
   <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=checkListEnumCombo.js&DIRECTORY=/libraries/components/rest&TYPE=VIEW_COMPONENT"></script>
   <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=checkListCatalogCombo.js&DIRECTORY=/libraries/components/rest&TYPE=VIEW_COMPONENT"></script>
   <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=enumCombo.js&DIRECTORY=/libraries/components/rest&TYPE=VIEW_COMPONENT"></script>
   <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=listCombo.js&DIRECTORY=/libraries/components&TYPE=VIEW_COMPONENT"></script>
   <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=datepicker.js&DIRECTORY=/libraries/components&TYPE=VIEW_COMPONENT"></script>
   <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=checkListEnumCombo.js&DIRECTORY=/libraries/components&TYPE=VIEW_COMPONENT"></script>
   <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=textfield.js&DIRECTORY=/libraries/components&TYPE=VIEW_COMPONENT"></script>
   <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=listComboModal.js&DIRECTORY=/libraries/components&TYPE=VIEW_COMPONENT"></script>
   <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoCatalogoModal.js&DIRECTORY=/libraries/components&TYPE=VIEW_COMPONENT"></script>
   <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=checkListCatalogCombo.js&DIRECTORY=/libraries/components&TYPE=VIEW_COMPONENT"></script>
   <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=comboCatalog.js&DIRECTORY=/libraries/components/rest&TYPE=VIEW_COMPONENT"></script>
   <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=uploadfile.js&DIRECTORY=/libraries/components&TYPE=VIEW_COMPONENT"></script>
   <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=linkField.js&DIRECTORY=/libraries/components&TYPE=VIEW_COMPONENT"></script>
   <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=labelField.js&DIRECTORY=/libraries/components&TYPE=VIEW_COMPONENT"></script>
   <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=timepicker.js&DIRECTORY=/libraries/components&TYPE=VIEW_COMPONENT"></script>

<!-- usermethods -->
   <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=DetallePersonaPostLoad&DIRECTORY=/app/userMethods/persona&TYPE=USERMETHOD"></script>    
   <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=AcumularDetallePresupuestoServicio&DIRECTORY=/app/userMethods/presupuesto&TYPE=USERMETHOD"></script>    
   <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=EliminarDetalleReferenciaExterna&DIRECTORY=/app/userMethods/personaReferencia&TYPE=USERMETHOD"></script>    
   <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=HorarioDetalle_eliminarDetalleHorario&DIRECTORY=/app/userMethods/agenda/horario&TYPE=USERMETHOD"></script>    
   <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=pre_CitaController_create&DIRECTORY=/app/userMethods/agenda/cita&TYPE=USERMETHOD"></script>    
   <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=DireccionView_RefreshZona&DIRECTORY=/app/userMethods/direccion&TYPE=USERMETHOD"></script>    
   <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=eliminar_CitaDetalle&DIRECTORY=/app/userMethods/agenda/cita&TYPE=USERMETHOD"></script>    
   <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=AcumularDetalleReferenciaExterna&DIRECTORY=/app/userMethods/personaReferencia&TYPE=USERMETHOD"></script>    
   <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=DireccionView_onLoad&DIRECTORY=/app/userMethods/direccion&TYPE=USERMETHOD"></script>    
   <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=DetalleCliente_setearCuentaXCobrar&DIRECTORY=/app/userMethods/cliente&TYPE=USERMETHOD"></script>    
   <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=agregar_CitaDetalle&DIRECTORY=/app/userMethods/agenda/cita&TYPE=USERMETHOD"></script>    
   <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=DireccionView_RefreshDepartamento&DIRECTORY=/app/userMethods/direccion&TYPE=USERMETHOD"></script>    
   <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=DireccionView_RefreshMunicipio&DIRECTORY=/app/userMethods/direccion&TYPE=USERMETHOD"></script>    
   <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=AcumularDetallePresupuestoProducto&DIRECTORY=/app/userMethods/presupuesto&TYPE=USERMETHOD"></script>    
   <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=EliminarDetallePresupuestoServicio&DIRECTORY=/app/userMethods/presupuesto&TYPE=USERMETHOD"></script>    
   <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=DetalleHorario_onLoad&DIRECTORY=/app/userMethods/agenda/horario&TYPE=USERMETHOD"></script>    
   <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=pre_creaPresupuesto&DIRECTORY=/app/userMethods/presupuesto&TYPE=USERMETHOD"></script>    
   <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=EliminarDetallePresupuestoProducto&DIRECTORY=/app/userMethods/presupuesto&TYPE=USERMETHOD"></script>    
   <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=HorarioDetalle_agregarDetalleHorario&DIRECTORY=/app/userMethods/agenda/horario&TYPE=USERMETHOD"></script>    

<!-- servicios -->
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=EstudiosController&TYPE=CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=OcupacionController&TYPE=CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=DocumentoController&TYPE=CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=NitController&TYPE=CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=PlanillaTotalController&TYPE=CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ClienteController&TYPE=CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=FormaPagoController&TYPE=CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=OrdenServicioController&TYPE=CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ServicioController&TYPE=CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=EmpleadoDescuentoController&TYPE=CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=AbonoCargoDispersionController&TYPE=CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=MovimientoCuentaXCobrarController&TYPE=CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=HorarioDetalleController&TYPE=CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=PersonaController&TYPE=CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=EmpresaAreaController&TYPE=CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=PersonaReferenciaController&TYPE=CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=FacturacionController&TYPE=CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=EmpleadoController&TYPE=CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ClienteNotaController&TYPE=CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=DetalleFacturaController&TYPE=CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=CartaController&TYPE=CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=CuentaBancariaController&TYPE=CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=EstadoPlanillaController&TYPE=CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=MovimientoController&TYPE=CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=TipoProductoController&TYPE=CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=PresupuestoAOrdenController&TYPE=CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=TerminalAreaController&TYPE=CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=DetalleCitaController&TYPE=CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=PresupuestoDetalleServicioController&TYPE=CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=HorarioController&TYPE=CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=EmpresaController&TYPE=CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=EmpleadoHoraExtraController&TYPE=CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=OrdenClienteController&TYPE=CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=PersonaEventoController&TYPE=CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=SucursalServicioController&TYPE=CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=EmpleadoComisionController&TYPE=CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=TerminalController&TYPE=CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=PersonaDireccionController&TYPE=CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ServicioEmpleadoController&TYPE=CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=SistemaController&TYPE=CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=SucursalController&TYPE=CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=CreaEmpleadoController&TYPE=CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=AgendaHorarioDetalleController&TYPE=CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=AutorizacionController&TYPE=CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=PersonaCuentaBancariaController&TYPE=CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=MedioContactoController&TYPE=CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=DireccionController&TYPE=CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ProductoController&TYPE=CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=EventoController&TYPE=CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ReporteController&TYPE=CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=AreaController&TYPE=CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=CuentaXCobrarController&TYPE=CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=PresupuestoDetalleProductoController&TYPE=CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ClienteCartaController&TYPE=CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ProductoPrecioController&TYPE=CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ServicioEmpleadoUbicacionController&TYPE=CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=PresupuestoController&TYPE=CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=TipoServicioController&TYPE=CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=AgendaTotalController&TYPE=CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ServicioPrecioController&TYPE=CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ReferenciaPersonalController&TYPE=CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=CitaController&TYPE=CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=OrdenProductoController&TYPE=CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=TipoPlanillaController&TYPE=CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ImpresoraController&TYPE=CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=AreaImpresoraController&TYPE=CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=UbicacionController&TYPE=CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=PersonaReferenciaDetalleController&TYPE=CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=PlanillaEmpleadoController&TYPE=CONTROLLER"></script>

<!-- view controllers -->
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoHorario&TYPE=SCREEN_CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=DetalleCuentaBancaria&TYPE=SCREEN_CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoNitModal&TYPE=SCREEN_CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoEmpleadoServicioModal&TYPE=SCREEN_CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoEvento&TYPE=SCREEN_CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoUbicacion&TYPE=SCREEN_CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=InformacionCita&TYPE=SCREEN_CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=DetalleEmpleadoPlanilla&TYPE=SCREEN_CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=DetalleClienteModal&TYPE=SCREEN_CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=DetalleTerminal&TYPE=SCREEN_CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=IngresoRapidoPersonaModal&TYPE=SCREEN_CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoOrdenCliente&TYPE=SCREEN_CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=DetalleHorario&TYPE=SCREEN_CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoFacturas&TYPE=SCREEN_CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoProductoModal&TYPE=SCREEN_CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=DetalleCuentaXCobrar&TYPE=SCREEN_CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=DetalleUbicacion&TYPE=SCREEN_CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=DetalleProducto&TYPE=SCREEN_CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoTipoServicio&TYPE=SCREEN_CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoOrdenServicioClienteModal&TYPE=SCREEN_CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=DetalleEmpleado&TYPE=SCREEN_CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoCatalogoMunicipios&TYPE=SCREEN_CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoCitasPorDiaHorarioDetalleModal&TYPE=SCREEN_CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoTerminal&TYPE=SCREEN_CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=DetalleReferenciaPersonalModal&TYPE=SCREEN_CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=InformacionFactura&TYPE=SCREEN_CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=DetalleArea&TYPE=SCREEN_CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoProducto&TYPE=SCREEN_CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoServicioModal&TYPE=SCREEN_CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoAreaModal&TYPE=SCREEN_CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=DetalleServicio&TYPE=SCREEN_CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoPersonaModal&TYPE=SCREEN_CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoDireccionModal&TYPE=SCREEN_CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoCuentaBancariaPersona&TYPE=SCREEN_CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=DetalleEvento&TYPE=SCREEN_CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=DetalleImpresora&TYPE=SCREEN_CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoCatalogoDepartamentos&TYPE=SCREEN_CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=DetalleMedioContactoModal&TYPE=SCREEN_CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=IngresoFormaPagoModal&TYPE=SCREEN_CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoEmpleadoModal&TYPE=SCREEN_CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=AsociarEventoPersonaModal&TYPE=SCREEN_CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoArea&TYPE=SCREEN_CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoCatalogoZonas&TYPE=SCREEN_CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=DetalleMovCuentaXCobrarModal&TYPE=SCREEN_CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=AsociarCuentaPersonaModal&TYPE=SCREEN_CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=DetalleOrdenCliente&TYPE=SCREEN_CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=DetalleEmpresaArea&TYPE=SCREEN_CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoImpresora&TYPE=SCREEN_CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=DespliegueAgendaParametros&TYPE=SCREEN_CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoTipoProducto&TYPE=SCREEN_CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=DespliegueAgenda&TYPE=SCREEN_CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=DetalleCliente&TYPE=SCREEN_CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoCliente&TYPE=SCREEN_CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=DetalleReferenciaExterna&TYPE=SCREEN_CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoPresupuesto&TYPE=SCREEN_CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoPersona&TYPE=SCREEN_CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoServiciosExternosModal&TYPE=SCREEN_CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoCitas&TYPE=SCREEN_CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=DetallePresupuesto&TYPE=SCREEN_CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoServicios&TYPE=SCREEN_CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=DetalleTipoProducto&TYPE=SCREEN_CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoEmpleado&TYPE=SCREEN_CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoEmpresaAreaModal&TYPE=SCREEN_CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=GeneraPlanilla&TYPE=SCREEN_CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=DetallePersona&TYPE=SCREEN_CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoPlanilla&TYPE=SCREEN_CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=DetalleTipoServicio&TYPE=SCREEN_CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoCuentaBancaria&TYPE=SCREEN_CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoDireccion&TYPE=SCREEN_CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=DetalleDireccion&TYPE=SCREEN_CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoEmpresaArea&TYPE=SCREEN_CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoCuentaXCobrarModal&TYPE=SCREEN_CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoClienteModal&TYPE=SCREEN_CONTROLLER"></script>
    <script type="text/javascript" src="sourceDelivery?CHANNEL=WEB_DESKTOP&DOMAIN=ERP&NAME=ListadoCuentaXCobrar&TYPE=SCREEN_CONTROLLER"></script>

<script type="text/javascript" src="libraries/base/header.js"></script>
<script type="text/javascript" src="libraries/base/footer.js"></script>
<script type="text/javascript" src="libraries/base/home.js"></script>
<script type="text/javascript" src="libraries/base/OtherWisePage.js"></script>
<script type="text/javascript" src="libraries/base/HomePage.js"></script>

</body>
</html>

