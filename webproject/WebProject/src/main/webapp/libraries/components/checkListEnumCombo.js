//[COMPONENT]
'use strict';

myApp.component('checkListEnumCombo', {
  templateUrl: 'libraries/components/checkListEnumCombo.html',
  controller: ['$scope', '$log', 'getEnumData', 'showError', CheckListEnumComboController],
  bindings: {	      
     label : "@"
	 ,value : "="
     ,enumClass : '@'
     ,readOnly  : "=?"
     ,length  : "@?"
     ,name    : '@'
     ,viewContext : '=?'
     ,eventData : '=?'    	 
  }
});

function CheckListEnumComboController($scope, $log,  getEnumData, showError) {  
	var ctrl = this;
	ctrl.chkListItems = [];
	
	ctrl.$onInit = function() {
		if (ctrl.readOnly == null){
		  ctrl.readOnly = false;
		}
		if (ctrl.length == null){
		  ctrl.length = 2;
		}		
		  
		var enumData = getEnumData(ctrl.enumClass, function(enumDataList){
			if (enumDataList.hasErrors == true){
				showError(enumDataList.errorMessage, '','');
				return;
			}
			if (enumDataList.data == null){
				showError('LISTADO VACIO','','');
				return;
			}
			if (enumDataList.data.length == 0){
				showError('LISTADO VACIO','','');
				return;				
			}
			enumDataList.data.forEach(function(enumData){
				var vt = Number.parseInt(ctrl.value);
				var v =  Number.parseInt(enumData.position);
				var checked = ((vt & v) == v);
				var chkListItem = {
				     valor  : v
				     ,label : enumData.description
				     ,checked : checked
				};
				ctrl.chkListItems.push(chkListItem);		  
			});			  			  	
		});	
		if (ctrl.viewContext != null){
		   ctrl.viewContext.loadField(ctrl);
		};		
	};

	ctrl.onClick = function(chkListItem){
		chkListItem.checked = !chkListItem.checked;
		//calcular el nuevo valor.
		var v = 0;
		ctrl.chkListItems.forEach(function(chkItem){
		   if (chkItem.checked){
			  v = v | chkItem.valor;
		   }
		});
		  
		ctrl.value = v.toString();
	}
	
	ctrl.visible = function(){
		return ctrl.viewContex.isVisible(ctrl.name);
	}
};

