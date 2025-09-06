//[COMPONENT]
'use strict';

myApp.component('checkListCatalogCombo', {
  templateUrl: 'libraries/components/checkListCatalogCombo.html',
  controller: ['$scope', '$log', 'getcatalog', CheckListCatalogComboController],
  bindings: {	      
     label : "@"
	 ,value : "="
	 ,catalogDomain : "@"
	 ,catalogName   : "@" 
	 ,readOnly  : "=?"
	 ,length  : "@?"
     ,name    : "@"
     ,viewContext : '=?'   
     ,eventData : '=?'    	 
  }
});

function CheckListCatalogComboController($scope, $log, getcatalog) {  
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
	  getcatalog(ctrl.catalogDomain, ctrl.catalogName, ctrl.catalogData, null, function(catalogData){
		  catalogData.forEach(function(detail){
			  try{
				  var vt = Number.parseInt(ctrl.value);
				  var v = Number.parseInt(detail.shortCode);
				  var checked = ((vt & v) == v);
				  
				  var chkListItem = {
				      shortCode  : v
				      ,description : detail.description
				      ,checked : checked
				  };
				  
				  ctrl.chkListItems.push(chkListItem);
			  }catch(Error){
				  alert(Error);
				  ctrl.log.error(Error);
			  }			  
		  });		  
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
  
	ctrl.visible = function(){
		return ctrl.viewContex.isVisible(ctrl.name);
	}  
}

