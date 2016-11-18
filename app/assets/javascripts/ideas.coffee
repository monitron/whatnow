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

  $('.do-it').one 'click', (ev) ->
    slug = $(ev.target).closest('.idea-finder').data('idea-slug')
    # Report click locally
    $.ajax {url: "/ideas/#{slug}/click", method: 'POST'}
    # Report click via Google Analytics
    if window.ga?
      ga('send', 'event', 'Ideas', 'do-it', slug)
