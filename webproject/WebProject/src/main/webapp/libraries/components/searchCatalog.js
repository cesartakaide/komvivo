//[COMPONENT]
'use strict';

myApp.component('searchCatalog', {
  templateUrl: 'libraries/components/searchCatalog.html',
  controller: ['$scope', '$log', 'ListadoCatalogoModal' ,SearchCatalogController],
  bindings: {	 
     label : '@'
     ,value : "="    	 
     ,length  : "@?"
     ,viewContext : '=?'
     ,disabled   : '=?'
     ,name   : '@'
     ,eventData : '=?'
  }

  
});

function SearchCatalogController($scope, $log, ListadoCatalogoModal) {
	var ctrl = this;
	
    if (ctrl.length == null){
	    ctrl.length = 1;
	};
	
	if (ctrl.disabled == null){
		ctrl.disabled = false;
	};
	
	ctrl.$onInit = function() {
		ctrl.localOnClick = function(){
			ListadoCatalogoModal();
		};	
		
		if (ctrl.viewContext != null){
		   ctrl.viewContext.loadField(ctrl);
		};	
				
	};
	

}

