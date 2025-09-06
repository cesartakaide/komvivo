//[SERVICE]
'use strict';
var myApp = angular.module('MainWindow');
		
myApp.factory('systemMessage', [    '$log', '$rootScope', 'projectSite'
                    , function(      $log, $rootScope, projectSite) {
	return function systemMessage(message, messageType){
		if (messageType == 'INFO'){
			$log.info(message);
		}
		if (messageType == 'WARNING'){
			$log.warning(message);
		}
	    var messageData = {
	    	systemMessage : message
	    	,messageType  : messageType
	    };
		$rootScope.$broadcast('footer_system_message_update', messageData);
	};
}]);


myApp.directive('convertToNumber', function() {
    return {
        require: 'ngModel',
        link: function(scope, element, attrs, ngModel) {
          ngModel.$parsers.push(function(val) {
            return parseInt(val, 10);
          });
          ngModel.$formatters.push(function(val) {
            return '' + val;
          });
        }
    };
});  


