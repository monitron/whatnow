# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$ ->
  $('.learn-more').on 'click', (ev) ->
    ev.preventDefault()
    $('.idea').addClass 'with-more'
    if window.ga?
      label = $(ev.target).closest('.idea-finder').data('idea-slug')
      ga('send', 'event', 'Ideas', 'learn-more', label)

  $('.do-it').on 'click', (ev) ->
    if window.ga?
      label = $(ev.target).closest('.idea-finder').data('idea-slug')
      ga('send', 'event', 'Ideas', 'do-it', label)
