class Likemarks.Collections.Links extends Backbone.Collection
  url: "/api/searches"
  model: Likemarks.Models.Link

  search: (query="") ->
    @fetch({data: {q: query}})
    this
