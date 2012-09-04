class Likemarks.Routers.Users extends Backbone.Router
  routes:
    'user/:id': "show"
    ':id': "show"

  initialize: ->
    @collection = new Likemarks.links

  show: (id) ->
    $("#main").html new Likemarks.Views.LinksIndex(
      collection: @collection.search(q: "@#{id}")
    ).render().el
