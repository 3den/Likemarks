class Likemarks.Routers.Sessions extends Backbone.Router
  initialize: ->
    @model = Likemarks.users.load_current_user @update_menu

  update_menu: (user) ->
    new Likemarks.Views.Shared.TopMenu(
      model: user
    ).render()
