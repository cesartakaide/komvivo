//[COMPONENT]
'use strict';

myApp.component('listCombo', {
  templateUrl: 'libraries/components/listCombo.html',
  controller: ['$scope', '$log',  DropDownController],
  bindings: {	      
     label : "@"
	 ,value : "="    
     ,model : "=?"
     ,listValues  : '='
     ,labelPath  : '@'
     ,keyPath    : '@'    	 
     ,readOnly  : "=?"
     ,length  : "@?"
     ,name    : '@'
     ,viewContext : '=?'    
     ,onChange  : '=?'
     ,eventData : '=?'    	 
  }
});

function DropDownController($scope, $log) {
  var ctrl = this;  

  ctrl.selectedValue = "[null]";
  
  ctrl.$onInit = function(){
	  if (ctrl.readOnly == null){
		  ctrl.readOnly = false;
	  }  
	  if (ctrl.length == null || ctrl.length == ""){
		  ctrl.length = 2;
	  }
	  
	  if (esNulo(ctrl.onClick)){
		  ctrl.onClick = function(){
			  //alert('CLICK');
		  };
	  }
	  if (esNulo(ctrl.onChange)){
		  ctrl.onChange = function(){};
	  }
	  
	  if (esNulo(ctrl.keyPath)){
		  ctrl.keyPath = 'correlativo';
	  }
	  ctrl.visible = true;
      ctrl.selectedValue = null;
	  
	 ctrl.getLabelCombo = function (value){
		 if (value != null){
			 return getPropertyPath(value, ctrl.labelPath);
		 }else{
			 return '';
		 }
	 }
	 
	 ctrl.getLabel = function(){
		 if (!esNulo(ctrl.value)){
			 return getPropertyPath(ctrl.value, ctrl.labelPath);
			 //return ctrl.value.correlativo;
		 }else{
			 return '';
		 }		 
	 }

	  
	  ctrl.getKey = function(value){
		  if (value != null){
			  return getPropertyPath(value, ctrl.keyPath);
		  }else{
			  return '';
		  }
	  }
	  
	  ctrl.findValue = function(key){
		  for (var i = 0; i < ctrl.listValues.length; i++){
			  var item = ctrl.listValues[i];
			  var itemKey = ctrl.getKey(item);
			  if (String(itemKey) === String(key)){
				  return item;
			  }
		  }
		  return null;
	  }
	  
	  ctrl.onClick = function(option){
		  ctrl.value = option;
	  }
	  
	  ctrl.onChangeImpl = function(){
		  var obj = ctrl.findValue (ctrl.value);
		  if (obj !== null && ctrl.model !== null){
			  angular.copy (obj, ctrl.model);
		  }
		  ctrl.onChange();
	  }
	  
	  
	  if (ctrl.viewContext != null){
		  ctrl.viewContext.loadField(ctrl);
	  };	  
  };
  
  
}