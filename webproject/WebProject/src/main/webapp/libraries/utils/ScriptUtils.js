"use strict";

	
	function setPropertyPathRecursive(object, position, pathArray, value){
		var path = pathArray[position];
		if (position < (pathArray.length-1)){			
			var propValue = object[path];
			if (propValue == null){
				var prototype= {};
				propValue= Object.create(prototype);
				//crear atributo.
				Object.defineProperty(object, path, 
					{
					 enumerable: true,
					 configurable: true,
					 writable: true,
					 value   : propValue
					});						
			}
			position++;
			setPropertyPathRecursive(propValue, position, pathArray, value);
		}else{
			object[path] = value;
		}
	}
	
	function setPropertyPathToNull (object, path){
		var pathArray = path.split('.');
		setPropertyPathRecursive(object, 0, pathArray, null);
	}	

	function setPropertyPath (object, path, value){
		//if (value != null && value != ""){
		if (value != null){
			var pathArray = path.split('.');
			setPropertyPathRecursive(object, 0, pathArray, value);
		}
	}
	
	function setPropertyPathWithNullValidation (fieldName, object, path, value, mandatory){
		if (esNulo(value)){
			if (mandatory === true){
				throw  "Campo:" + fieldName + " es mandatorio.";
			}
		}
		setPropertyPath (object, path, value);
	}
	
	function setPropertyPathWithValidation (fieldName, object, path, value, type, mandatory){
		//validar primero.		
		if (!esNulo(value)){
			if (type === 'INTEGER'){
				if (!Number.isInteger(value)){
					throw "Campo:" + fieldName + " no tiene un valor entero (" + value + ")";
					return;
				}
			}
			if (type === 'DECIMAL'){
				if (isNaN(value)){
					throw "Campo:" + fieldName + " no tiene un valor numerico (" + value + ")";
					return;
				}
			}
		}else{
			if (mandatory === true){
				throw  "Campo:" + fieldName + " es mandatorio.";
			}
		}
		
		setPropertyPath (object, path, value);
	}

	
	function getPropertyPathRecursive(object, pathArray, position){		
		var path = pathArray[position];
		var value = object[path];
		if (value != null && position < pathArray.length){
			if (position == pathArray.length-1){
				return value;
			}else{
				return getPropertyPathRecursive(value, pathArray, ++position);
			}
		}else{
			return null;
		}
	}
	
	function getPropertyPath(object, path){
		var pathArray = path.split('.');
		return getPropertyPathRecursive(object, pathArray,0);
	}
	
	
	function toJsonString (objeto) {
		var primero = true;
	   var objKeys = Object.keys(objeto);
	   var i = 0;
	   var stringOutput = "";
	   for (i=0; i< objKeys.length; i++){
		   if (!primero){
			   stringOutput += ",";
		   }
		   var propName = objKeys[i];
		   var objValue = objeto[propName];
		   var type = typeof objValue;
		   if (type == 'string' || type == 'number'){
			   stringOutput += ( '"' + propName + '":"'  +  objValue + '"' );			
		   }else{
			   if (type =='object'){
				   stringOutput += '"' + propName + '":' + toJsonString(objValue);
			   }
		   }
		   primero = false;
	   }
	   return "{" + stringOutput + "}";
	}

    

   
    function deleteFromArray(arrayList, path, value){    	
    	for (var d=0; d<arrayList.length; d++){
    		var item= arrayList[d];
    		var itemValue = getPropertyPath(item, path);
    		if (itemValue != null){
    			if (itemValue == value){
    				arrayList.splice(d,1);
    				return;
    			}
    		}
    	};
    }
    
    function copyArray (orig, dest){
    	dest.length = 0;
    	var c = orig.length;
    	for (var i=0; i<c; i++){
    		dest.push(orig[i]);
    	};
    }


    function esNulo(value){
    	if (value === undefined){
    		return true;
    	}
    	if (value === null){
    		return true;
    	}
    	return false;
    }
             
    function assertIfNull(value, nombreVariable){
    	if (esNulo(value)){
    		alert('Variable (' + (esNulo(nombreVariable) ? 'No definida' : nombreVariable) + ') no puede ser nula');
    		return true;
    	}
    	return false;
    }
    

    
  
   
   
