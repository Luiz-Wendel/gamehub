# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $('#member_game_platform').parent().hide()
  platforms = $('#member_game_platform').html()
  $('#member_game_game_id').change ->
    game = $('#member_game_game_id :selected').text()
    escaped_game = game.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(platforms).filter("optgroup[label='#{escaped_game}']").html()
    if options
      $('#member_game_platform').html(options)
      $('#member_game_platform').parent().show()
    else
      $('#member_game_platform').empty()
      $('#member_game_platform').parent().hide()