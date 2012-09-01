class Likemarks.Routers.Users extends Backbone.Router
  routes:
    'user/:id': "show"
    ':id': "show"

  show: (id) ->
    alert("User links for #{id}")
