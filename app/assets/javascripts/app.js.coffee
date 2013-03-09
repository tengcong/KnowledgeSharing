angular.module('knowledgeSharing', []).
  config ($routeProvider) ->
    $routeProvider.when('/', controller: TipListCtrl, templateUrl: '/assets/list.html').
      otherwise redirectTo: '/'

@TipListCtrl =
  ($scope)->
    $scope.articles = [{ 'content': 'you can use rspec to write unit test','num': 2, 'type': 'tip','tags': ['=program', '@rails', '-rspec', '@unittest']},{ 'content': 'classmethod 可以被继承', 'num': 4, 'type': 'tip','tags': ['=program', '@ruby', '-metaprogramming', '-classmethod'] },{'content': 'you can use float to do layout stuff', 'num': 1, 'type': 'article','tags': ['=program', '@css', '-float', '-layout']},{'content': 'BabyFace release new album', 'num': 1, 'type': 'article', 'tags': ['=music', '@rnb', '-babyface']}]
