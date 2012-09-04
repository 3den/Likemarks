class Likemarks.Views.Link extends Backbone.View
  template: JST['links/link']

  render: ->
    $(@el).html @template(link: @model)
    this

