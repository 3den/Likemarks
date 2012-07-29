window.fbAsyncInit = ->
  FB.init
    appId: FACEBOOK_APP_ID
    status: true
    cookie: true
    xfbml: true

$ ->
  $('body').prepend('<div id="fb-root"></div>')
  $.getScript "#{document.location.protocol}//connect.facebook.net/en_US/all.js"

