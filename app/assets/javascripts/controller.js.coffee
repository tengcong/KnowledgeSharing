@TipListCtrl =
  ($scope)->
    $scope.articles = [{ 'content': 'you can use rspec to write unit test', 'type': 'tip','tags': ['=program', '@rails', '-rspec', '@unittest']},{ 'content': 'classmethod 可以被继承', 'type': 'tip','tags': ['=program', '@ruby', '-metaprogramming', '-classmethod'] },{'content': 'you can use float to do layout stuff', 'type': 'article','tags': ['=program', '@css', '-float', '-layout']},{'content': 'BabyFace release new album', 'type': 'article', 'tags': ['=music', '@rnb', '-babyface']}]

@SharingCtrl =
  ($scope) ->
    1
