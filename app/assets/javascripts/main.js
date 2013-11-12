"use strict";

angular.module("wrektranet.controllers", [
  "wrektranet.adminVenueCtrl",
  "wrektranet.airContestCtrl",
  "wrektranet.staffSignupCtrl",
  "wrektranet.adminTicketCtrl",
  "wrektranet.airTransmitterLogCtrl",
  "wrektranet.listenerLogsCtrl"
]);

angular.module("wrektranet", [
  "restangular",
  "ui.keypress",
  "ng-rails-csrf",
  "wrektranet.controllers"
]).
  config([
    'RestangularProvider',
    function(RestangularProvider) {
      RestangularProvider.setRequestSuffix('.json');
    }
  ]);