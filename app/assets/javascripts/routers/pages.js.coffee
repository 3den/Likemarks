class Likemarks.Routers.Pages extends Backbone.Router
  routes:
    '': "home"
    'terms': "terms"

  initialize: ->
    @collection = Likemarks.links

  home: ->
    $("#q").val("")
    new Likemarks.Views.LinksIndex(
      collection: @collection.search(limit: 10)
    ).render()

