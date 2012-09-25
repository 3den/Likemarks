class Likemarks.Collections.Users extends Backbone.Collection
  url: "/api/users"
  model: Likemarks.Models.User

  load_current_user: (callback) ->
    user = new @model(id: "me")
    user.fetch
      success: (user) ->
        callback(user)

Likemarks.users = new Likemarks.Collections.Users()
