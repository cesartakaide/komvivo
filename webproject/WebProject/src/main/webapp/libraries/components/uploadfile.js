//[COMPONENT]
'use strict';
myApp.component('uploadFile', {
  templateUrl: 'libraries/components/uploadfile1.html',
  controller: UploadFileController,
  bindings: {
	 id : '<'
    ,fileNamePath : '<'
    ,fileContentPath : '<'
    ,fileExtensionPath : '<'
    ,applyBase64 : '@'
    ,enabled  : "="
     ,viewContext : '=?'    	
     ,name    : '@'    	
  }

  
});

function UploadFileController($scope, $element, $attrs, $document, $http) {
  var ctrl = this;
  ctrl.archivo = null;
  
  ctrl.add = function(){
	  var f = document.getElementById('file').files[0];
	  var r = new FileReader();
	  r.onloadend = function(e){
		  var data = e.target.result;
		  var uploadUrl = '/SipsaSPAWebProject/FileUploadServlet?';
		  uploadUrl += ('&uploadFieldId=' + ctrl.id);
		  uploadUrl += ('&fileContentPath=' + ctrl.fileContentPath);
		  uploadUrl += ('&fileNamePath=' + ctrl.fileNamePath);
		  uploadUrl += ('&fileExtensionPath=' + ctrl.fileExtensionPath);
		  uploadUrl += ('&applyBase64=' + ctrl.applyBase64);		  		  
		  
		  //send you binary data via $http or $resource or do anything else with it
	     /* $http.post(uploadUrl, data, {
	            transformRequest: angular.identity,
	            headers: {'Content-Type': undefined}	      
	      }).success(function(){
	         alert('SUBIDO EXITOSAMENTE');
	      }).error(function(){
	         alert('ERROR AL SUBIR');
	      });*/
		  
         
         var request = {
              method: 'POST',
              url: uploadUrl,
              data: data,
                  headers: {
                      'Content-Type': undefined
                  }
         
          };

              // SEND THE FILES.
          $http(request)
               .success(function (d) {
                   alert(d);
           })
               .error(function () {
           });
          
	  }
	  r.readAsArrayBuffer(f);
	}
  
    ctrl.$onInit = function(){
	   if (ctrl.viewContext != null){
		  ctrl.viewContext.loadField(ctrl);
	   };	  
    };

}





