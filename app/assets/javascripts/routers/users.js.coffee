class Likemarks.Routers.Users extends Backbone.Router
  routes:
    'user/:id': "show"
    ':id': "show"

  initialize: ->
    @collection = Likemarks.links

  show: (id) ->
    $("#q").val("@#{id}")
    $("#main").html new Likemarks.Views.LinksIndex(
      collection: @collection.search(q: "@#{id}")
    ).render().el
