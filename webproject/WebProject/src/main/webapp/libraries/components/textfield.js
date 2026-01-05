//[COMPONENT]
'use strict';

myApp.component('textField', {
  templateUrl: 'libraries/components/textfield.html',
  controller: ['$scope', '$log',  TextFieldController],
  bindings: {	      
     label : "@"
	 ,value : "="     
     ,length : "@?"
     ,readOnly  : "=?"    
     ,name   : "@"
     ,viewContext : '=?'
     ,onClick  : '=?'       	 
     ,eventData : '=?'  
	 ,mandatory : '=?'
  }
});

function TextFieldController($scope, $log) {
  var ctrl = this;  
  
  ctrl.size=10;
  
  ctrl.$onInit = function(){
	  if (ctrl.readOnly == null){
		  ctrl.readOnly = false;
	  }  	  	 
	  
	  if (ctrl.length == null){
		  ctrl.length = 2;
	  }
	  if (ctrl.mandatory == null){
		ctrl.mandatory = false;
	  }
	  
	  if (ctrl.length > 2){
		  var c = ctrl.length - 2;
		  ctrl.size = ctrl.size + c * 5 * 5;
	  }
	  ctrl.visible = true;
	  
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