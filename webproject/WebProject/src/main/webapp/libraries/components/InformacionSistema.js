//[COMPONENT]
'use strict';

myApp.component('informacionSistema', {
  templateUrl: 'libraries/components/InformacionSistema.html',
  controller: ['$scope', '$log', InformacionSistemaController],
  bindings: {	      
     bean : "="
  }
});

function InformacionSistemaController($scope, $log) {
  var ctrl = this;
}
