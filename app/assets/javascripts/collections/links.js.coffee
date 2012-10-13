class Likemarks.Collections.Links extends Backbone.Collection
  url: "/api/links"
  model: Likemarks.Models.Link

  search: (@options={}) ->
    @fetch({data: @options})
    this

  scroll: (options) ->
    return this if @done?

    options.start()
    callback = (collection, response) ->
      Likemarks.links.done = true if response.length < 10
      options.finish()

    @options.page ||= 0
    @options.limit = 10
    @options.page++
    @fetch
      data: @options
      add: true
      success: callback
      error: callback
    this

Likemarks.links = new Likemarks.Collections.Links()
