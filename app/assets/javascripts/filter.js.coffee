module = angular.module 'ArticlesFilters', []
module.filter 'tagsFilter', ->
  (articles, query) ->
    if /^tag:/.test(query)
      _.filter articles, (article)->

        query = query.replace /(tag:)/, ''
        query = query.replace /(,+\s*)$/, ''

        _.every query.split(','), (term)->
          article_tags = _.map article.tags, (t) ->
            t.name

          res = _.find article_tags, (tag)->
            patt =  new RegExp('\\s*' + tag + '\\s*,*\\s*')
            patt.test(term)

          res != undefined
    else
      _.filter articles, (article) ->
        patt = new RegExp('\\s*' + query + '\\s*', 'i')
        patt.test article.title
