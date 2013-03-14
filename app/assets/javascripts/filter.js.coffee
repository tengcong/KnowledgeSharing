module = angular.module 'ArticlesFilters', []
module.filter 'maxFilter', ->
  (articles, query) ->
    if query.length != 0
      commands = removeSfxSpace(removePreSpace(query)).split('|')
      _.each commands, (command) ->
        command = removeSfxSpace removePreSpace(command)
        if cateReg('tags').test(command) || cateReg('#').test(command)
          articles = matchTags(articles, command)
        else if cateReg('type').test(command) || cateReg('&').test(command)
          articles = matchType(articles, command)
        else if cateReg('user').test(command) || cateReg('@').test(command)
          articles = matchUser(articles, command)
        else
          articles = defaultMatch(articles, command)
      articles
    else
      articles

matchTags = (articles, query) ->
  _.filter articles, (article)->

    query = removeCate(query, 'tags')
    query = removeCate(query, '#')
    query = removeSfxComma query

    _.every query.split(','), (term)->
      term = removeSfxSpace(removePreSpace(term))
      article_tags = _.map article.tags, (t) ->
        t.name

      res = _.find article_tags, (tag)->
        patt =  new RegExp('\\s*' + term + '\\s*', 'i')
        patt.test(tag)

      res != undefined

matchType = (articles, query) ->
  _.filter articles, (article) ->
    query = removeCate(query, 'type')
    query = removeCate(query, '&')
    query = removeSfxComma query
    patt = new RegExp(query, 'i')
    patt.test article.article_type

matchUser = (articles, query) ->
  _.filter articles, (article) ->
    query = removeCate(query, 'user')
    query = removeCate(query, '@')
    query = removeSfxComma query
    patt = new RegExp(query, 'i')
    patt.test article.user.email

defaultMatch = (articles, query) ->
  _.filter articles, (article) ->
    query = removePreSpace(removePreSpace(query))
    patt = new RegExp('\\s*' + query + '\\s*', 'i')
    patt.test article.title

removePreSpace = (origin)->
  origin.replace /^\s*/, ''

removeSfxSpace = (origin)->
  origin.replace /\s*$/, ''

removeSfxComma = (origin) ->
  origin.replace /\s*,*\s*$/, ''

cateReg = (cate)->
  new RegExp('\\s*' + cate + '\\s*:')

removeCate = (query, cate) ->
  patt = new RegExp('\\s*' + cate + '\\s*:\\s*')
  query.replace patt, ''
