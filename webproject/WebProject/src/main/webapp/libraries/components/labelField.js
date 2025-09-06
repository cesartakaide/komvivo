//[COMPONENT]
'use strict';

myApp.component('labelField', {
  templateUrl: 'libraries/components/labelField.html',
  controller: ['$scope', '$log',  LabelFieldController],
  bindings: {	      
     label : "@"
     ,name : '@'
	 ,value : "="     
     ,length : "@?"    
     ,viewContext : '=?'    	 
  }
});

function LabelFieldController($scope, $log) {
  var ctrl = this;  
  
  ctrl.$onInit = function(){	 
	  if (ctrl.length == null){
		  ctrl.length = 2;
	  };
	  
	  if (ctrl.viewContext != null){
		  ctrl.viewContext.loadField(ctrl);
	  };		  
  };
  
	ctrl.visible = function(){
		return ctrl.viewContex.isVisible(ctrl.name);
	}
}

