//[COMPONENT]
'use strict';

myApp.component('timePicker', {
  templateUrl: 'libraries/components/timepicker.html',
  controller: ['$scope', '$log',  TimepickerController],
  bindings: {	      
     label : "@"
	 ,value : "="      
     ,meridian : "="
     ,length : "@?"
     ,readOnly  : "=?"
     ,viewContext : '=?'    	 
     ,name    : '@'    	
     ,onClick  : '=?'   
     ,eventData : '=?'    	 
  }
});

function TimepickerController($scope, $log) {
  var ctrl = this; 
  
  ctrl.$onInit = function(){
	  if (ctrl.length == null){
		  ctrl.length = 2;
	  };
	  if (ctrl.readOnly == null){
		  ctrl.readOnly = true;
	  }; 	
	  if (ctrl.viewContext != null){
		  ctrl.viewContext.loadField(ctrl);
	  };		  
  };
}