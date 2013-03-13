@ListCtrl =
  ($scope, Article, Tag)->
    $scope.articles = Article.index()
    $scope.tags = Tag.index()

    $scope.addToQuery =  (cate, name)->
      $scope.query.commands = cate + ': ' if $scope.query.commands == ''
      $scope.query.commands += name + ', '

    $scope.getStyle = getStyle
ListCtrl.$inject = ['$scope', 'Article', 'Tag'];

@CreateCtrl =
  ($scope, $location, Article) ->
    $scope.save = ->
      if($scope.articleForm.$valid)
        Article.save $scope.article, (article)->
          $location.path '/'
CreateCtrl.$inject = ['$scope', '$location', 'Article'];

@ShowCtrl =
  ($scope, $routeParams, $location, Article) ->
    $scope.article = Article.get({id: $routeParams.articleId, render: true})

    $scope.getShow = (id) ->
      if $('#ars').length != 0 && id != undefined
        article_ids = $('#ars').data('docs').split(', ')
        if _.contains(article_ids, id.toString())
          "manage-show"
        else
          "manage-hide"
      else
        "manage-hide"

    $scope.getStyle = getStyle

    $scope.getSameType = (type)->
      $scope.query.commands = 'type: ' + type
      $location.path '/'

    $scope.remove = ()->
      if confirm 'are you sure?'
        $scope.article.$destroy {id: $scope.article.id}, (data)->
          if(data.success)
            $location.path '/'
ShowCtrl.$inject = ['$scope', '$routeParams', '$location', 'Article'];

@EditCtrl =
  ($scope, $routeParams, $location, Article) ->
    articleId = $routeParams.articleId
    $scope.article = Article.get({id: articleId})
    $scope.save = ->
      if($scope.articleForm.$valid)
        $scope.article.$update {id: articleId}, (article)->
          $location.path '/show/' + article.id


EditCtrl.$inject = ['$scope', '$routeParams', '$location', 'Article'];

getStyle = (type) ->
  typeMapping = {
    'tip'      : 'icon-star',
    'document' : 'icon-font',
    'book'     : 'icon-book',
    'video'    : 'icon-film',
    'audio'    : 'icon-music'
  }
  typeMapping[type]

