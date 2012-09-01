$ ->
  # Remove Bugged Images
  $("img").error ->
    $(this).remove()

  # Call local links with Backbone
  $('a').click (e) ->
    href = $(this).attr('href')
    unless href.match(/^http/)?
      Backbone.history.navigate(href, true)
      return false

    return true

