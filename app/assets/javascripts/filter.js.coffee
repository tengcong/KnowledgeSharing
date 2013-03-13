module = angular.module 'ArticlesFilters', []
module.filter 'maxFilter', ->
  (articles, query) ->
    if query.length != 0
      commands = removeSfxSpace(removePreSpace(query)).split('|')
      _.each commands, (command) ->
        command = removeSfxSpace removePreSpace(command)
        if /\s*tags\s*:/.test command
          articles = matchTags(articles, command)
        else if /\s*type\s*:/.test command
          articles = matchType(articles, command)
        else
          articles = defaultMatch(articles, command)
      articles
    else
      articles

matchTags = (articles, query) ->
  _.filter articles, (article)->

    query = query.replace /\s*tags\s*:\s*/, ''
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
    query = query.replace /\s*type\s*:\s*/, ''
    query = removeSfxComma query
    patt = new RegExp(query, 'i')
    patt.test article.article_type

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
