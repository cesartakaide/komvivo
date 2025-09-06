
function serializeUrlParams(params){
  	var v = '';
   	params.forEach(function(param){
   		v += '/{' + param + '}';
   	});
   	return v;
}
   
function addRoute(appBaseDir, state, urlTemplate, alias, params, $stateProvider, reset){
    	if (alias == null){
    		alias = state;
    	}
    	//$log.info('DANDO DE ALTA LA RUTA:(' + state +  ')(' + urlTemplate + ')(' + alias + ')');
    	
    	var stateData= {
		    urlValue : state
		   ,linkType : 'URL'
		   ,linkAlias : alias
		   ,urlParams : params //['clientID', 'nombre']
		   ,reset     : reset
	    };
    	
        var i = params.length;
        var c=0;
        for (c=0; c<i; c++){
        	param = params[c];
        	setPropertyPath(stateData, param, ' ');        	
        };        
        
    	
        $stateProvider.state(  state 
          ,{
        	  url : '/' + state + serializeUrlParams(params)
        	  ,cache : false
  	          ,params : stateData
            ,views: {
               'header': {
                   templateUrl: appBaseDir + '/header.html'
               },   	 
               'content' :{
    	           templateUrl : urlTemplate         
               },
               'footer': {
                   templateUrl: appBaseDir + '/footer.html'
               }
            }  
        });          
}


function addRoutes (appBaseDir, routes,$stateProvider, $log){
	routes.forEach(function(route){
		addRoute(appBaseDir, route.state, route.urlTemplate, route.alias, route.params, $stateProvider, $log);
	});
}

 
    