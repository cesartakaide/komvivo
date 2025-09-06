//[SERVICE]
'use strict';
var myApp = angular.module('MainWindow');
		
myApp.factory('fileUpload', [ '$window',  function($window) {
	
	return function fileUpload (fileUploadID, applyBase64){		
		var url = 'FileUploadServlet?fileUploadFieldID=' + fileUploadID + "&base64=" + applyBase64;
		$window.open(url, 'fileUpload', 'menubar=no, status=no, fullscreen=no, height=200, width=400, top=100, left=100');
	}
}]);
