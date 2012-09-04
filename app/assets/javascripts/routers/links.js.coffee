class Likemarks.Routers.Links extends Backbone.Router
  routes:
    'search': "index"
    'search/:query': "index"

  initialize: ->
    @collection = Likemarks.links

  index: (query="") ->
    $("#main").html new Likemarks.Views.LinksIndex(
      collection: @collection.search(q: query)
    ).render().el
