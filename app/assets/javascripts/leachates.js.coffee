# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


ready = ->

	###  index view  ###
	# Hide form from start
	$('div#div_new_leachate_form').hide()

	# Show form on click
	$('#new_leachate_link').click ->
		$('#new_leachate_link').fadeOut()
		$('div#div_new_leachate_form').fadeIn()

	# Hide form on click
	$('#new_leachate_submit_button').click ->
		$('div#div_new_leachate_form').fadeOut()
		$('#new_leachate_link').fadeIn()


$(document).ready(ready)
$(document).on('page:load', ready)