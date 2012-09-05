window.translations = {}
window.I18n = {}
class window.I18n
  constructor: (@lang) ->
    window.locale = this
    window.t = window.locale.translate

  translate: (term) =>
    console.log("window.translations.#{@lang}.#{term}")
    eval("window.translations.#{@lang}.#{term}")
