module = angular.module 'ArticlesFilters', []
module.filter 'maxFilter', ->
  (articles, query) ->
    if query.length != 0
      commands = query.split('|')
      _.each commands, (command) ->
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

    query = query.replace /tags:\s*/, ''
    query = query.replace /,*\s*$/, ''

    _.every query.split(','), (term)->
      term = term.replace /\s*/, ''
      article_tags = _.map article.tags, (t) ->
        t.name

      res = _.find article_tags, (tag)->
        patt =  new RegExp('\\s*' + term + '\\s*')
        patt.test(tag)

      res != undefined

matchType = (articles, query) ->
  _.filter articles, (article) ->
    query = query.replace /\s*type:\s*/, ''
    patt = new RegExp(query)
    patt.test article.article_type

defaultMatch = (articles, query) ->
  _.filter articles, (article) ->
    patt = new RegExp('\\s*' + query + '\\s*', 'i')
    patt.test article.title

