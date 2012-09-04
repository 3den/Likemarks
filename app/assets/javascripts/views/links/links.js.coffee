class Likemarks.Views.LinksIndex extends Backbone.View
  template: JST['links/index']
  el: "#search-results"

  initialize: ->
    $(@el).empty()
    @collection.on('reset', @render, this)

  render: ->
    @collection.each @append
    @remove_broken_images()
    this

  append: (model) =>
    view = new Likemarks.Views.Link(model: model)
    $(@el).append view.render().el

  remove_broken_images: ->
    $("img").error (e) ->
      $(e.target).remove()

    $("img").load (e) ->
      img = $(e.target)
      img.remove() if img.width < 5
