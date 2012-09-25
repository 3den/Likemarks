class Likemarks.Views.Shared.TopMenu extends Backbone.View
  template: JST['shared/top_menu']
  el: "#top-menu"

  render: ->
    $(@el).html @template(user: @model.attributes)
    this

