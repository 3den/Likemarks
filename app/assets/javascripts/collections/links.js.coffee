class Likemarks.Collections.Links extends Backbone.Collection
  url: "/api/links"
  model: Likemarks.Models.Link

  search: (@options={}) ->
    @fetch({data: @options})
    this

  scroll: ->
    @options.page ||= 0
    @options.page++
    @fetch({data: @options, add: true})
    this

Likemarks.links = new Likemarks.Collections.Links()
