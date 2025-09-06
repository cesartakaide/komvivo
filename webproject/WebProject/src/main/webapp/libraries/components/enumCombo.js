//[COMPONENT]
'use strict';

myApp.component('enumCombo', {
  templateUrl: 'libraries/components/enumCombo.html',
  controller: ['$scope', '$log', 'getEnumData', ComboEnumController],
  bindings: {	 
     label : "@"
	 ,value : "="
     ,enumClass : "@"
     ,readOnly  : "=?"
     ,length  : "@?"  
     ,name    : '@'
     ,viewContext : '=?'
     ,onClick  : '=?'    	
     ,eventData : '=?'    	 
  }
});

function ComboEnumController($scope, $log, getEnumData) {
  var ctrl = this;  
  ctrl.enumDataList = [];
  
  ctrl.$onInit = function(){
	  if (ctrl.readOnly == null){
		  ctrl.readOnly = false;
	  }  
	  if (ctrl.length == null){
		  ctrl.length = 2;
	  }
	  
	  getEnumData(ctrl.enumClass, function(enumDataList){
		  enumDataList.data.forEach(function(enumDataItem){
			  			  	  			 
			  var enumComboItem = {					
				 value : enumDataItem.name
				 ,description : enumDataItem.description
			  };
			  ctrl.enumDataList.push(enumComboItem);				  
			  
		  });
	  });
	  if (ctrl.viewContext != null){
		  ctrl.viewContext.loadField(ctrl);
	  };
	  
	  ctrl.localOnClick = function(){
		if (ctrl.onClick != null){
			ctrl.onClick();
		};
	  };				  
  };
  
	ctrl.visible = function(){
		return ctrl.viewContex.isVisible(ctrl.name);
	}  
  
}

