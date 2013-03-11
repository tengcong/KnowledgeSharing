module = angular.module('knowledgeSharing', ['ArticlesServices'])

module.config ["$httpProvider", (provider) ->
  provider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
]

module.config ($routeProvider) ->
  $routeProvider
  .when('/', controller: ListCtrl, templateUrl: '/assets/list.html')
  .when('/sharing', controller: SharingCtrl, templateUrl: '/assets/sharing_form.html')
  .otherwise redirectTo: '/'

