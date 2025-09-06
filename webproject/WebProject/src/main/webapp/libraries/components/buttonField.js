//[COMPONENT]
'use strict';
myApp.component('buttonField', {
  templateUrl: 'libraries/components/buttonField.html',
  controller: ButtonFieldController,
  bindings: {	 
     label : '@'
     ,onClick : '='
     ,length  : "@?"
     ,viewContext : '=?'
     ,disabled   : '=?'
     ,name   : '@'
     ,eventData : '=?'
  }

  
});

function ButtonFieldController($scope, $log) {
	var ctrl = this;
	
    if (ctrl.length == null){
	    ctrl.length = 1;
	};
	
	if (ctrl.disabled == null){
		ctrl.disabled = false;
	};
	
	ctrl.visible = true;
	
	ctrl.$onInit = function() {
		ctrl.localOnClick = function(){
			//$log.log('CLICK EN BOTON');
			ctrl.onClick();
		};	
		
		if (ctrl.viewContext != null){
		   ctrl.viewContext.loadField(ctrl);
		}	
				
	};
}
