window.h =
  picture_for: (src, options={}) ->
    if src? and src.match(/^http/)?
      "<img src=\"#{src}\" class=\"link-picture\" \\>"
    else
      ""

  links_for_users: (users) ->
    html = for user in users
      "<a href=\"/#{user.username}\">#{user.name}</a>"
    html.join ", "

  date: (value) ->
    d = new Date(value)
    d.toDateString()
