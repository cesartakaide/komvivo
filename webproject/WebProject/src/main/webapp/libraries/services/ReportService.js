//[SERVICE]
'use strict';
var myApp = angular.module('MainWindow');
		
myApp.factory('ReportService', [    '$log', '$rootScope', '$window', 'projectSite'
                    , function(      $log, $rootScope, $window, projectSite) {
	return function ReportService(reportName, params){
		$log.info('GENERANDO REPORTE:' + reportName);
		var url = projectSite.reportGeneratorServlet + "?";
		url += 'reportName=' + reportName;
		var i = params.length;
		
		for (var c=0; c<i; c++){
			var param = params[c];
			$log.info('PARAMETROS : ' + param.name + '=' + $window.encodeURIComponent(param.value));
			if (param.value == null){
				param.value = "";
			};
			url += ("&" + param.name + '=' + $window.encodeURIComponent(param.value));
			
		};
		//url = $window.encodeURIComponent(url);
		$window.open(url, 'REPORTE:' + reportName);
	};
}]);		