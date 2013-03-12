@ListCtrl =
  ($scope, Article, Tag)->
    $scope.articles = Article.index()
    $scope.tags = Tag.index()

    $scope.addToQuery = (name)->
      $scope.query.commands += name + ', '

@CreateCtrl =
  ($scope, $location, Article) ->
    $scope.save = ->
      if($scope.articleForm.$valid)
        Article.save $scope.article, (article)->
          $location.path '/'

@ShowCtrl =
  ($scope, $routeParams, $location, Article) ->
    $scope.article = Article.get({id: $routeParams.articleId, render: true})

    $scope.remove = ()->
      $scope.article.$destroy {id: $scope.article.id}, (data)->
        if(data.success)
          $location.path '/'

@EditCtrl =
  ($scope, $routeParams, $location, Article) ->
    articleId = $routeParams.articleId
    $scope.article = Article.get({id: articleId})
    $scope.save = ->
      if($scope.articleForm.$valid)
        $scope.article.$update {id: articleId}, (article)->
          $location.path '/show/' + article.id
