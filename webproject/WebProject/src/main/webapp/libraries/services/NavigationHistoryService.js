//[SERVICE]
'use strict';
var myApp = angular.module('MainWindow');
		
myApp.factory('NavigationHistoryService', [ 'showError',  '$http', '$log', '$state', '$rootScope', 'projectSite', 'systemMessage', 'navigationControl'
 , function(showError, $http, $log, $state, $rootScope, projectSite, systemMessage, navigationControl) {
	
    return function NavigationHistoryService(navigationHistory){
    	
    	//estableciendo parametros.
    	navigationHistory.itemList = [];   //listado de breadcrumbs
    	navigationHistory.actualIndex = -1;
    	navigationHistory.log = $log;
    	navigationHistory.stateService = $state; 
    	
    	navigationHistory.addItem = function(stateName, newState){
    		var breadCrumb = {};  //linkItem en la pantalla principal
    		
    		if (newState.urlValue == 'HomePage'){
    			navigationHistory.itemList.length = 0;
    			return;
    		}
    		
    		if (newState.reset == true){
    			navigationHistory.itemList.length = 0;
    		}
    		
    		setPropertyPath(breadCrumb, 'name', stateName);
    		setPropertyPath(breadCrumb, 'state', newState);
    		setPropertyPath(breadCrumb, 'asLink', false);
    		
    		var n = navigationHistory.itemList.length;
    		var pos = -1;
    		//validar si el estado ya existe dentro del historial.
    		for (var i=0; i<n; i++){
    			var item = navigationHistory.itemList[i];
    			if (item.name == breadCrumb.name){
    				pos = i;
    			}
    		}
    		
    		if (pos >= 0){
    			navigationHistory.itemList = navigationHistory.itemList.slice(0, pos);
    			n--;
    		}
    		    		
    		breadCrumb.onClick = function(){    			
    			navigationHistory.toLog('REDIRECCIONANDO (' + this.state.state + ')');
    			//navigationHistory.stateService.go(this.state);
    			var stateParam = {};
    			for (var i=0; i < this.state.urlParams.length; i++){
    				var paramName = this.state.urlParams[i];
    				var paramValue = this.state[paramName];
    				setPropertyPath(stateParam, paramName, paramValue);
    			};    			
    			
    			navigationHistory.stateService.go(this.name, stateParam);
    		};
    		
    		breadCrumb.getLinkAlias = function(){
    			return this.state.linkAlias;
    		};    	    		
    		

    		navigationHistory.itemList.push(breadCrumb);
    		
    		n = navigationHistory.itemList.length;
       		if (n > 1){
    		  for (var i=0; i < (n-1); i++){
    		    navigationHistory.itemList[i].asLink = true;
    		  }
    		} 
    	};
    	
    	navigationHistory.toLog = function(msg){
    		navigationHistory.log.log(msg);
    	}
    	
        navigationHistory.navigateToLast = function(){
        	var i = navigationHistory.itemList.length;
        	if (i > 0){
        		var navigationItem = navigationHistory.itemList[i--];
        		navigationHistory.onClick();
        	}
        }
        
        navigationHistory.navigateToPrevious = function(){
        	var i = navigationHistory.itemList.length;
        	if (i > 1){
        		i = i - 2;
        		var navigationItem = navigationHistory.itemList[i];
        		navigationItem.onClick();
        	}    	
        }
        
        navigationControl.manager = navigationHistory;     	
    }    
    
}]);
