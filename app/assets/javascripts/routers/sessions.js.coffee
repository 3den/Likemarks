class Likemarks.Routers.Sessions extends Backbone.Router
  routes:
    'auth/:provider': "create"
    'signout': "destroy"

  create: (provider) ->
    alert("login")

  destroy: ->
    alert("logout")
