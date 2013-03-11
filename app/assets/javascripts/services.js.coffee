angular.module('ArticlesServices', ['ngResource']).factory 'Article', ($resource)->
  $resource '/articles/:id', {}, {
    index: {method:'GET', params:{}, isArray:true},
    create: {method: 'POST'},
    update: {method: 'PUT'},
    destroy: {method: 'DELETE'}
  }

