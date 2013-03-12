module = angular.module('knowledgeSharing', ['ArticlesServices', 'ArticlesFilters'])

module.config ["$httpProvider", (provider) ->
  provider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
]

module.config ($routeProvider) ->
  $routeProvider
  .when('/', controller: ListCtrl, templateUrl: '/assets/list.html')
  .when('/sharing', controller: CreateCtrl, templateUrl: '/assets/sharing_form.html')
  .when('/show/:articleId', controller: ShowCtrl, templateUrl: '/assets/detail.html')
  .when('/edit/:articleId', controller: EditCtrl, templateUrl: '/assets/sharing_form.html')
  .otherwise redirectTo: '/'

