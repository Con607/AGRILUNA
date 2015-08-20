# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


ready = ->

	# Hide form from start
	$('div#div_application_processes_form').hide()

	# Show form on click
	$('#new_application_process_link').click ->
		$('#new_application_process_link').fadeOut()
		$('div#div_application_processes_form').fadeIn()

	# Hide form on click
	$('#new_application_process_submit_button').click ->
		$('div#div_application_processes_form').fadeOut()
		$('#new_application_process_link').fadeIn()


$(document).ready(ready)
$(document).on('page:load', ready)