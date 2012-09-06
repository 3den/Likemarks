class Likemarks.Collections.Users extends Backbone.Collection
  url: "/api/users"
  model: Likemarks.Models.User

  load_current_user: ->
    user = new @model(id: "me")
    user.fetch
      success: (user) ->
        Likemarks.current_user = user.attributes

Likemarks.users = new Likemarks.Collections.Users()
Likemarks.users.load_current_user()
