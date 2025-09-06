//[COMPONENT]
'use strict';

myApp.component('comboCatalogRest', {
  templateUrl: 'libraries/components/rest/comboCatalog.html',
  controller: ['$scope', '$log', 'CatalogService', ComboCatalogController],
  bindings: {	      
     label : "@"
	 ,value : "="
     ,model : "="
     ,catalogDomain : "@"
     ,catalogName   : "@"    
     ,onClick     :'=?'
     ,onChange    : '=?'
     ,style  : "@" //select, radio, dropdown
     ,readOnly  : "=?"
     ,length  : "@?"
     ,name    : '@'
     ,viewContext : '=?'
  }
});

function ComboCatalogController($scope, $log, CatalogService) {
  var ctrl = this;  
  
  ctrl.oldValue = null;  
  ctrl.catalogData = [];
  ctrl.selectedValue = '[null]';
  ctrl.buscarValor = function(shortCode){
	  var l = ctrl.catalogData.length;
	  var i=0;
	  for (i=0; i<l; i++){
		  var catalogDetail = ctrl.catalogData[i];
		  if (catalogDetail.shortCode == shortCode){
			  return catalogDetail;
		  }
	  }
	  return null;
  };
  
  
  ctrl.$onInit = function(){
	  if (ctrl.readOnly == null){
		  ctrl.readOnly = false;
	  }  
	  if (ctrl.length == null || ctrl.length == ""){
		  ctrl.length = 2;
	  }

	  if (esNulo(ctrl.onClick)){
		  ctrl.onClick = function(){};		  
	  }
	  
	  if (esNulo(ctrl.onChange)){
	     ctrl.onChange = function(newValue){};  	  		  
	  }
	  
	  ctrl.viewContext.loadField(ctrl);	        
      ctrl.visible = true;
      
	  
	  /*ctrl.onClickImpl = function(option){
		  ctrl.oldValue = ctrl.value;
		  ctrl.value = option;
		  ctrl.onClick();
		  //detectar si hubo cambio de valor
		  if (ctrl.oldValue === null){
			  ctrl.onChange();
			  return;
		  }
		  if (ctrl.oldValue !== null && ctrl.value !== null
				  && ctrl.oldValue.shortCode !== ctrl.value.shortCode){
			  ctrl.onChange();
		  }
	  }*/
      
      ctrl.onChangeImpl = function(){
    	 //setPropertyPath(ctrl.model, 'shortCode', ctrl.value);
    	  var d = ctrl.buscarValor(ctrl.value);
    	  angular.copy(d, ctrl.model);
         ctrl.onChange();
      };


	  
	  //getcatalog(ctrl.catalogDomain, ctrl.catalogName, ctrl.catalogData, null, null);
	  var param = {
		domain : ctrl.catalogDomain
		,name  : ctrl.catalogName
	  };
	  CatalogService.list(param, function(resp){
		  ctrl.catalogData = resp;
		  if (!esNulo(ctrl.value)){
			  ctrl.oldValue = ctrl.value;
			  ctrl.selectedValue = ctrl.value.shortCode;
		  }		  
	  }, function(error){
		  ctrl.catalogData.length =0;
	  });
  };

  
}

