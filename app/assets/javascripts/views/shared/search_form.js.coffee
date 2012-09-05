class Likemarks.Views.Shared.SearchForm extends Backbone.View
  el: "#search-form"
  searched_query: ""

  events:
    'submit': "search"

  search: (e) ->
    e.preventDefault()
    @searched_query = @query()
    Backbone.history.navigate("search/#{@searched_query}", true)

  query: ->
    $("#q").val()
