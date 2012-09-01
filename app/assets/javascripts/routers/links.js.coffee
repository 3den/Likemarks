class Likemarks.Routers.Links extends Backbone.Router
  routes:
    'search': "index"
    'search/:query': "index"

  initialize: ->
    @collection = new Likemarks.Collections.Links()

  index: (query="") ->
    new Likemarks.Views.LinksIndex(
      collection: @collection.search query
    ).render().el
