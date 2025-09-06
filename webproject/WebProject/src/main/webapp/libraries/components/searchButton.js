//[COMPONENT]
'use strict';

myApp.component('searchButton', {
  templateUrl: 'libraries/components/searchButton.html',
  controller: SearchButtonController,
  bindings: {	 
     label : '@'
     ,onClick : '='
     ,value : "="    	 
     ,length  : "@?"
     ,viewContext : '=?'
     ,disabled   : '=?'
     ,name   : '@'
     ,eventData : '=?'
  }

  
});

function SearchButtonController($scope, $log) {
	var ctrl = this;
	
    if (ctrl.length == null){
	    ctrl.length = 1;
	};
	
	if (ctrl.disabled == null){
		ctrl.disabled = false;
	};
	
	ctrl.$onInit = function() {
		ctrl.localOnClick = function(){
			//$log.log('CLICK EN BOTON');
			ctrl.onClick();
		};	
		
		if (ctrl.viewContext != null){
		   ctrl.viewContext.loadField(ctrl);
		};	
				
	};
	

}

