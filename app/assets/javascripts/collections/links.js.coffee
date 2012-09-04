class Likemarks.Collections.Links extends Backbone.Collection
  url: "/api/links"
  model: Likemarks.Models.Link

  search: (options={}) ->
    @fetch({data: options})
    this

Likemarks.links = new Likemarks.Collections.Links()
