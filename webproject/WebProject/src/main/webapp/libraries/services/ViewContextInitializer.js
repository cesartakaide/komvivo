//[SERVICE]
'use strict';
var myApp = angular.module('MainWindow');
		
myApp.factory('ViewContextInitializer', [    '$log', '$rootScope', 'projectSite', 'showMessage'
                    , function(      $log, $rootScope, projectSite, showMessage) {
	return function ViewContextInitializer(name, viewContext){
		
		viewContext.fieldData = [];
		viewContext.inited = true;
		viewContext.viewName = name;
		viewContext.log = $log;
		viewContext.stateTransition = []; //arreglo de {state, viewSettings}
		viewContext.initialState = null;		
		
		viewContext.addField = function(fieldControl){
			var fieldData = {
				label : (fieldControl.label != null ? fieldControl.label : 'NO DEFINIDO')
				, name : (fieldControl.name != null ? fieldControl.name : 'NO DEFINIDO')
				, control : fieldControl	
				, asociatedEvents : []
			    , visible : true
			};
			
			viewContext.fieldData.push(fieldData);
			
			return fieldData;
		};		
		
		viewContext.loadField = function(fieldControl){  //metodo que debe ser invocado desde el control.
			if (fieldControl.name != null){
			   var f = viewContext.findField(fieldControl.name);
			   if (f == null){
				   f = this.addField(fieldControl);
			   }else{
				   f.label = fieldControl.label;
				   f.control = fieldControl;
				   if (f.defaults != null){
					   f.control.readOnly = (f.defaults.readOnly != null ? f.defaults.readOnly : false);					   
					   f.control.mandatory = (f.defaults.mandatory != null ? f.defaults.mandatory : false);					   
					   f.control.disabled = false;
					   f.control.visible = true;
				   };				   
			   };
			   if (f.control != null){
				   if (f.control.eventData != null){
				   		f.asociatedEvents = f.control.eventData.asociatedEvents;
				   		var authorised = viewContext.validateSecurityField (f);
				   		f.control.disabled = !authorised;
				   }
				   viewContext.setDefaultSettings(f);
			   };
			};
		};
		
		viewContext.findField = function(fieldName){
			var i = viewContext.fieldData.length;
			for (var c = 0; c < i; c++){
				if (viewContext.fieldData[c].name == fieldName){
					return viewContext.fieldData[c];
				}
			};			
			return null;
		};	

		viewContext.setDefaultSettings = function(field){
		   	if (viewContext.initialState != null){
				var state = viewContext.searchState(viewContext.initialState);
				for (var c=0; c < state.viewSettings.length; c++){
					var setting = state.viewSettings[c];
					if (setting.fieldName == field.name){
						field.control.readOnly = setting.readOnly;
						field.control.mandatory = setting.mandatory;
					}
				}
			}
		};
		
		viewContext.isVisible = function(fieldName){
			var fieldData= viewContext.findField(fieldName);
			if (fieldData !== null){
				return fieldData.control.visible;
			}
			return false;
		}
		
		viewContext.setVisibility = function(fieldName, value){
			var fieldData= viewContext.findField(fieldName);
			if (fieldData !== null){
				fieldData.control.visible = value; 
			}
		}
		
		viewContext.setReadOnly = function(fieldName, value){
			var field = this.findField(fieldName);
			if (field != null){
				field.control.readOnly = value;
			}else{
				field = {
					name : fieldName
					,defaults : {
						readOnly : true
					}
				};
				this.fieldData.push(field);
			};
		};
		
		viewContext.setMandatory = function(fieldName, value){
			var field = this.findField(fieldName);
			if (field != null){
				field.control.mandatory = value;
			}else{
				field = {
					name : fieldName
					,defaults : {
						mandatory : true
					}
				};
				this.fieldData.push(field);
			};
		};
		
		viewContext.searchState = function(state){
			var n = this.stateTransition.length;
			var transition = null;
			for (var i=0; i<n; i++){
				transition = this.stateTransition[i];
				if (transition.state == state){
					return transition;
				}
			};			
			transition = {
				state : state
				,viewSettings : []
			};
			this.stateTransition.push(transition);
			
			return transition;
		};
				
		
		//transition = {state, fieldName, readOnly = false/true, mandatory = false/true}
		viewContext.addTransition = function(state, fieldName, readOnly, mandatory){
			var stateTransition = this.searchState(state);
			var fieldSetting = {
				fieldName : fieldName
				,readOnly : readOnly
				,mandatory : mandatory
				,disabled  : false
			};
			stateTransition.viewSettings.push(fieldSetting);
		}
		
		viewContext.fireTransition = function(state){
			var transition = this.searchState(state);
			if (transition != null){
				if (transition.viewSettings != null && transition.viewSettings.length > 0){
					var n = transition.viewSettings.length;
					for (var i =0; i<n ; i++){
						var fieldName = transition.viewSettings[i].fieldName;
						var field= this.findField(fieldName);
						if (field != null){
							field.control.readOnly = transition.viewSettings[i].readOnly;
							field.control.mandatory  = transition.viewSettings[i].mandatory;							
						}else{
							this.log.error('CAMPO (' + fieldName + ') NO ENCONTRADO');
						}					
					};
				};
			}else{
				this.log.error('ESTADO (' + state + ') NO EXISTE');
			};							
		};
		
		
		viewContext.validateSecurityField = function(field){
			if (projectSite.autorizationDisabled){
				return true;
			}
			if (projectSite.userData == null){
				//showMessage('DATOS DE SEGURIDAD NO DEFINIDOS');
				viewContext.log.info('DATOS DE SEGURIDAD NO DEFINIDOS');
				//return;
				return true;
			}
			var userData = projectSite.userData; 
			
			if (field.asociatedEvents != null && field.asociatedEvents.length > 0){
				var v = field.asociatedEvents.length;
				for (var i=0; i<v; i++){
					var asociatedEvent = field.asociatedEvents[i];
					if (asociatedEvent.controllerName != null && asociatedEvent.method != null){
						var authorization= userData.isAuthorisedMethod(asociatedEvent.controllerName, asociatedEvent.method);
						return authorization;
					};
					
					if (asociatedEvent.viewName != null){
                        var authorization = userData.isAuthorisedView(asociatedEvent.viewName);
                        return authorization;
					};
				};
			};
									
			return true;
		};
	}
}]);	