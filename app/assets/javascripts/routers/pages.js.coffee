class Likemarks.Routers.Pages extends Backbone.Router
  routes:
    '': "home"
    'terms': "terms"

  home: ->
    alert("home")

  terms: ->
    alert("terms")
