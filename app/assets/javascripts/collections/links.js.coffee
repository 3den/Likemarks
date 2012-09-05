class Likemarks.Collections.Links extends Backbone.Collection
  url: "/api/links"
  model: Likemarks.Models.Link

  search: (@options={}) ->
    @fetch({data: @options})
    this

  scroll: ->
    return this if this.models.length < 1

    @options.page ||= 0
    @options.page++
    @fetch({data: @options, add: true})
    this

Likemarks.links = new Likemarks.Collections.Links()
