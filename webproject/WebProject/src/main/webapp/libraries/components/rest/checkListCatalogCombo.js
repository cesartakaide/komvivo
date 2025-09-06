//[COMPONENT]
'use strict';

myApp.component('checkListCatalogComboRest', {
  templateUrl: 'libraries/components/rest/checkListCatalogCombo.html',
  controller: ['$scope', '$log', 'CatalogService', CheckListCatalogComboController],
  bindings: {	      
     label : "@"
	 ,value : "="
	 ,catalogDomain : "@"
	 ,catalogName   : "@" 
	 ,readOnly  : "=?"
	 ,length  : "@?"
	 ,name    : '@'
	,viewContext : '=?'		 
  }
});

function CheckListCatalogComboController($scope, $log, CatalogService) {  
  var ctrl = this;  
  ctrl.checked=false;
  ctrl.chkListItems = [];
  
   
  
  ctrl.$onInit = function() {
	  if (ctrl.style == null){
		  ctrl.style = "SELECT";
	  }
	  if (ctrl.readOnly == null){
		  ctrl.readOnly = false;
	  }
	  if (ctrl.length == null){
		  ctrl.length = 2;
	  }
	  
	  ctrl.chkListItems = [];
	  ctrl.catalogData = [];
	  $log.info('CATALOGO BITWISE:' + ctrl.value);
	  
	  var param = {
	     domain : ctrl.catalogDomain
	     ,name  : ctrl.catalogName
	  };
	  CatalogService.list(param, function(resp){
		  catalogData.forEach(function(detail){
			  var vt = Number.parseInt(ctrl.value);
			  var v = Number.parseInt(detail.shortCode);
			  var checked = ((vt & v) == v);
			  
			  var chkListItem = {
			      shortCode  : v
			      ,description : detail.description
			      ,checked : checked
			  };
			  
			  ctrl.chkListItems.push(chkListItem);
		  });		  
	  }
	  ,function(error){
		  ctrk,chkListItems.length=0;
	  });
	  if (ctrl.viewContext != null){
		  ctrl.viewContext.loadField(ctrl);
	  };	
  };
  
  ctrl.onClick = function(chkListItem){
	  chkListItem.checked = !chkListItem.checked;
	  //calcular el nuevo valor.
	  var v = 0;
	  ctrl.chkListItems.forEach(function(chkItem){
		  if (chkItem.checked){
			  v = v | chkItem.valor;
		  }
	  });
	  
	  ctrl.value = v.toString();
  }
}

