module = angular.module('ArticlesServices', ['ngResource'])

module.factory 'Article', ['$resource', ($resource) ->
  $resource '/articles/:id', {}, {
    index:   {method:'GET', params:{}, isArray:true},
    create:  {method: 'POST'},
    update:  {method: 'PUT'},
    destroy: {method: 'DELETE'}
  }
]

module.factory 'Tag', ['$resource', ($resource) ->
  $resource 'tags/:id', {}, {
    index:   {method: 'GET', params:{}, isArray: true}
  }
]
