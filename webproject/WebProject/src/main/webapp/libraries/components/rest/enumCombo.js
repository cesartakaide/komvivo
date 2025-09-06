//[COMPONENT]
'use strict';

myApp.component('enumComboRest', {
  templateUrl: 'libraries/components/rest/enumCombo.html',
  controller: ['$scope', '$log',  'EnumService', ComboEnumController],
  bindings: {	 
     label : "@"
	 ,value : "="
     ,enumClass : "@"
     ,readOnly  : "=?"
     ,length  : "@?"
     ,name    : '@'
     ,viewContext : '=?'    	 
  }
});

function ComboEnumController($scope, $log, EnumService) {
  var ctrl = this;  
  ctrl.enumDataList = [];
  
  ctrl.$onInit = function(){
	  if (ctrl.readOnly == null){
		  ctrl.readOnly = false;
	  }  
	  if (ctrl.length == null){
		  ctrl.length = 2;
	  }
	  if (ctrl.viewContext != null){
		   ctrl.viewContext.loadField(ctrl);
	  };		  
	  var param = {
	     enumClass : ctrl.enumClass + "."
	  };
	  EnumService.list(param, function(data){
		  data.forEach(function(enumDataItem){ 	  			 
			  var enumComboItem = {					
				 value : enumDataItem.name
				 ,description : enumDataItem.description
			  };
			  ctrl.enumDataList.push(enumComboItem);				  			  
		  });		  
	  }
	  , function(error){
		  ctrl.enumDataList.length=0;
	  });
  };
  
}

