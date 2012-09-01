class Likemarks.Views.Shared.SearchForm extends Backbone.View
  el: "#search-form"

  events:
    'submit': "search"
    'change': "auto_search"

  search: (e) ->
    e.preventDefault()
    Backbone.history.navigate("search/#{@query()}", true)

  auto_search: (e) ->
    @search(e)

  query: ->
    $("#q").val()
