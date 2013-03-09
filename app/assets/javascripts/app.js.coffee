angular.module('knowledgeSharing', []).
  config ($routeProvider) ->
    $routeProvider.when('/', controller: TipListCtrl, templateUrl: '/assets/list.html').
    when('/sharing', controller: SharingCtrl, templateUrl: '/assets/sharing_form.html').
      otherwise redirectTo: '/'

