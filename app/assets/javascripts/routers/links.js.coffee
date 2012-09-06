class Likemarks.Routers.Links extends Backbone.Router
  routes:
    'search': "index"
    'search/:query': "index"
    ':username': "user_index"

  initialize: ->
    @collection = Likemarks.links

  index: (query="") ->
    $("#main").html new Likemarks.Views.LinksIndex(
      collection: @collection.search(q: query)
    ).render().el

  user_index: (username) ->
    $("#q").val("@#{username}")
    $("#main").html new Likemarks.Views.LinksIndex(
      collection: @collection.search(username: username)
    ).render().el


