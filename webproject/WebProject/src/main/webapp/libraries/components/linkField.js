//[COMPONENT]
'use strict';

myApp.component('linkField', {
  templateUrl: 'libraries/components/linkField.html',
  controller: LinkFieldController,
  bindings: {	 
     label : '@'
     ,imageUrl : '@?'
     ,url : '@?'
     ,length  : "@?"
     ,viewContext : '=?'
     ,disabled    : '=?'
     ,name   : '@'  
     ,onClick : '=?'
     ,eventData : '=?'    	 
  }
});

function LinkFieldController($scope, $log) {
	var ctrl = this;
	
    if (ctrl.length == null){
	    ctrl.length = 1;
	};
	
	if (ctrl.external == null){
		ctrl.external = false;
	};
	
	if (ctrl.disabled == null){
		ctrl.disabled = false;
	};	
	
	ctrl.isExternal = function(){
		return ctrl.external;
	};
	
	ctrl.$onInit = function() {
		if (ctrl.viewContext != null){
		   ctrl.viewContext.loadField(ctrl);
		};		
	};
	
	ctrl.hasImage = function(){
		return (ctrl.imageUrl != null);
	};
	
	ctrl.onClickImpl = function(){
		if (ctrl.onClick != null){
			ctrl.onClick();
		}else{
			$log.info('METODO ONCLICK NO DEFINIDO');
		}
	};
	
	ctrl.visible = function(){
		return ctrl.viewContex.isVisible(ctrl.name);
	}
}
