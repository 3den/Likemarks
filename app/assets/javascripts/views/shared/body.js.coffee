class Likemarks.Views.Shared.Body extends Backbone.View
  el: "body"

  events:
    'click a.brand': "click_link"
    'click a#load-links': "click_link"

  click_link: (e) ->
    href = $(e.target).attr('href')
    unless href.match(/^http/)?
      e.preventDefault()
      Backbone.history.navigate(href, true)
      return false
    true
