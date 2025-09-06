

"use strict";
var myApp = angular.module('MainWindow');

myApp.controller('FooterController', ['$scope',  'projectSite'  //dependencias
                                      
                                       , function($scope,  projectSite) {
	 $scope.systemData = {
		userName : ''
		,terminal : ''
		,systemDate : ''
		,lastSignOn : ''
		,systemMessage : 'NO DEFINIDO'
		,messageType : 'INFO'
	 };
	 $scope.iconImageSrc = '/' + projectSite.siteName + '/' + projectSite.appBaseDir + '/icons/info.jpg';
	 
	 $scope.$on('footer_system_data_update', function(evt,args){
		$scope.userName = args.userName;
		$scope.terminal = args.terminal;
	 });
	 
	 $scope.$on('footer_system_message_update', function(evt, message){
		 $scope.systemData.systemMessage = message.systemMessage;
		 $scope.systemData.messageType = message.messageType;
		 
		 if ($scope.systemData.messageType == 'INFO'){
			 $scope.iconImageSrc = '/' + projectSite.siteName + '/' + projectSite.appBaseDir + '/icons/info.jpg'; 
		 }
		 if ($scope.systemData.messageType == 'ERROR'){
			 $scope.iconImageSrc = '/' + projectSite.siteName + '/' + projectSite.appBaseDir + '/icons/error.png';
		 }
		 if ($scope.systemData.messageType == 'WARNING'){
			 $scope.iconImageSrc = '/' + projectSite.siteName + '/' + projectSite.appBaseDir + '/icons/warning.png';
		 }
		 
	 });
	
     $scope.init = function(){
    	 
     };
}]);


