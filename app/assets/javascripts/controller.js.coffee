@ListCtrl =
  ($scope, Article)->
    $scope.articles = Article.index()

@CreateCtrl =
  ($scope, $location, Article) ->
    $scope.save = ->
      Article.save $scope.sharing_form, (article)->
        $location.path '/'

@ShowCtrl =
  ($scope, $routeParams, Article) ->
    $scope.article = Article.get({id: $routeParams.articleId})


