class Likemarks.Views.LinksIndex extends Backbone.View
  template: JST['links/index']
  el: "#main"

  initialize: ->
    @collection.on('reset', @render, this)

  render: ->
    $(@el).html @template(links: @collection)
    this

