@ListCtrl =
  ($scope, Article, Tag)->
    $scope.articles = Article.index()
    $scope.tags = Tag.index()

    $scope.addToQuery =  (cate, name)->
      $scope.command.query += ' | ' + cate + ': ' + name

    $scope.getStyle = getStyle
@ListCtrl.$inject = ['$scope', 'Article', 'Tag']

@CreateCtrl =
  ($scope, $location, Article, Tag) ->

    $scope.tags = Tag.index()

    $scope.save = ->
      if($scope.articleForm.$valid)
        $scope.article.tags = $('#tags').val()
        Article.save $scope.article, (article)->
          window.location = '/'

@CreateCtrl.$inject = ['$scope', '$location', 'Article', 'Tag']

@ShowCtrl =
  ($scope, $routeParams, $location, Article) ->
    $scope.article = Article.get({id: $routeParams.articleId, render: true})

    $scope.getShow = (id) ->
      if $('#ars').length != 0 && id != undefined
        article_ids = $('#ars').data('docs').toString().split(', ')
        if _.contains(article_ids, id.toString())
          "manage-show"
        else
          "manage-hide"
      else
        "manage-hide"

    $scope.getStyle = getStyle

    $scope.getSameType = (type)->
      $scope.command.query = 'type: ' + type
      $location.path '/'

    $scope.remove = ()->
      if confirm 'are you sure?'
        $scope.article.$destroy {id: $scope.article.id}, (data)->
          if(data.success)
            $location.path '/'

@ShowCtrl.$inject = ['$scope', '$routeParams', '$location', 'Article']

@EditCtrl =
  ($scope, $routeParams, $location, Article, Tag) ->
    articleId = $routeParams.articleId
    $scope.article = Article.get({id: articleId})
    $scope.tags = Tag.index()
    $scope.save = ->
      if($scope.articleForm.$valid)
        $scope.article.tags = $('#tags').val()
        $scope.article.$update {id: articleId}, (article)->
          window.location = '/'


@EditCtrl.$inject = ['$scope', '$routeParams', '$location', 'Article', 'Tag']

getStyle = (type) ->
  typeMapping = {
    'tip'      : 'icon-star',
    'document' : 'icon-font',
    'book'     : 'icon-book',
    'video'    : 'icon-film',
    'audio'    : 'icon-music',
    'question' : 'icon-wrench'
  }
  typeMapping[type]

