angular.module('ArticlesServices', ['ngResource']).
factory 'Article', ($resource) ->
  $resource 'article/:id.json', {}, {
    query: {method:'GET', params:{articleId:'article'}, isArray:true}
  }
