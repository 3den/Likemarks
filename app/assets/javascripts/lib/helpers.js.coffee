window.h =
  picture_for: (src, options={}) ->
    if src? and src.match(/^http/)?
      "<img src=\"#{src}\" class=\"link-picture\" \\>"
    else
      ""

  date: (value) ->
    d = new Date(value)
    d.toDateString()
