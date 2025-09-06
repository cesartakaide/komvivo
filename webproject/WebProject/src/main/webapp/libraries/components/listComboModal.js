//[COMPONENT]
'use strict';

myApp.component('listComboModal', {
  templateUrl: 'libraries/components/listComboModal.html',
  controller: ['$scope', '$log', 'ListadoComboViewModal', ListComboModalController],
  bindings: {	 
     label : '@'
     ,value : "="    	 
     ,length  : "@?"
     ,list    : '='
     ,labelColumn : '@'
     ,valueColumn : '@'
     ,onChange    : '=?'
     ,viewContext : '=?'
     ,disabled   : '=?'
     ,name   : '@'
     ,eventData : '=?'
  }

  
});

function ListComboModalController($scope, $log, ListadoComboViewModal) {
	var ctrl = this;
	
    if (ctrl.length == null){
	    ctrl.length = 1;
	};
	
	if (ctrl.disabled == null){
		ctrl.disabled = false;
	};
	
	ctrl.getDescription = function(value){
		if (value != null){
			return getPropertyPath(value, ctrl.labelColumn);
		}else{
			return '';
		}
	};
	
	ctrl.getValue = function(value){
		if (value != null){
			return getPropertyPath(value, ctrl.valueColumn);
		}else{
			return '';
		}
	};
	
	ctrl.$onInit = function() {
		ctrl.localOnClick = function(){
			ListadoComboViewModal(ctrl.list, ctrl.value, ctrl.valueColumn, ctrl.labelColumn, function(selectedValue){
				ctrl.value = selectedValue;
				
				if (ctrl.onChange != null){
					ctrl.onChange();
				}
			});
		};	
		
		if (ctrl.viewContext != null){
		   ctrl.viewContext.loadField(ctrl);
		};	
				
	};
	

}

