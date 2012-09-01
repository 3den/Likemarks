window.Likemarks =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
    new Likemarks.Views.Shared()
    new Likemarks.Routers.Pages()
    new Likemarks.Routers.Users()
    new Likemarks.Routers.Sessions()
    new Likemarks.Routers.Links()

    Backbone.history.start(pushState: true)

$ ->
  Likemarks.init()

