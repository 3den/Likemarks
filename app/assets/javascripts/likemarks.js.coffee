window.Likemarks =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  cookie: (key) ->
    cookie = document.cookie.replace(/(\w+\=)/, '"$1":').replace("=", "")
    @cookies = $.parseJSON("{#{unescape(cookie)}}")
    @cookies[key]

  init: ->
    new Likemarks.Views.Shared()
    new Likemarks.Routers.Pages()
    new Likemarks.Routers.Users()
    new Likemarks.Routers.Sessions()
    new Likemarks.Routers.Links()

    Backbone.history.start(pushState: true)

$ ->
  Likemarks.init()

  #$(window).scroll (e) ->
  #  height = $(document).height() - 5
  #  distance = $(document).scrollTop() + $(window).height()
  #  if height <= distance
  #    console.log "scrolling..."
  #    Likemarks.links.search(q: $("#q"), limit: 20)
