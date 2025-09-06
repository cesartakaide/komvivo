//[COMPONENT]
'use strict';

myApp.component('datePicker', {
  templateUrl: 'libraries/components/datepicker.html',
  controller: DatePickerController,
  bindings: {
	  fechaValor : '='
     ,fechaMascara : '@'     
     ,label : '@'
     ,readOnly  : "=?"
     ,length  : "@?"
     ,name    : '@'
     ,viewContext : '=?'
     ,onClick  : '=?'   
     ,eventData : '=?'    	 
  }

  
});

function DatePickerController() {
  var ctrl = this;
  
  ctrl.$onInit = function(){
	  if (ctrl.readOnly == null){
		  ctrl.readOnly = false;
	  }; 
	  if (ctrl.length == null){
		  ctrl.length = 2;
	  };
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


