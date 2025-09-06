//[COMPONENT]
'use strict';

myApp.component('checkField', {
  templateUrl: 'libraries/components/checkField.html',
  controller: CheckFieldController,
  bindings: {
	 valor  : '=' 
     ,label : '@'
     ,readOnly  : "=?"
     ,length  : "@?"    	
     ,name    : '@'
    ,viewContext : '=?'  
     ,onClick  : '=?'
    ,eventData : '=?'    	 
  }

  
});

function CheckFieldController() {
	var ctrl = this;
	
	if (ctrl.readOnly == null){
		ctrl.readOnly = false;
	};
    if (ctrl.length == null){
	    ctrl.length = 2;
	};	
	
	ctrl.visible = function(){
		return ctrl.viewContex.isVisible(ctrl.name);
	}
	
	ctrl.$onInit = function() {
		if (ctrl.viewContext != null){
		   ctrl.viewContext.loadField(ctrl);
		};	
		
		ctrl.localOnClick = function(){
			if (ctrl.onClick != null){
				ctrl.onClick();
			};
		};			
	};
}