facebook.importLinks = (e) ->
  $.post "/import"


$("#load-links").click facebook.importLinks

