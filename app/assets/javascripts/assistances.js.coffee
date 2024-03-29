# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


ready = ->

	# Hide form from start
	$('div#div_assistances_form').hide()

	# Show form on click
	$('#new_assistance_link').click ->
		$('#new_assistance_link').fadeOut()
		$('div#div_assistances_form').fadeIn()

	# Hide form on click
	$('#new_assistance_submit_button').click ->
		$('div#div_assistances_form').fadeOut()
		$('#new_assistance_link').fadeIn()


$(document).ready(ready)
$(document).on('page:load', ready)