# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


ready = ->

	###  index view  ###
	# Hide form from start
	$('div#div_new_phenological_stage_form').hide()

	# Show form on click
	$('#new_phenological_stage_link').click ->
		$('#new_phenological_stage_link').fadeOut()
		$('div#div_new_phenological_stage_form').fadeIn()

	# Hide form on click
	$('#new_phenological_stage_submit_button').click ->
		$('div#div_new_phenological_stage_form').fadeOut()
		$('#new_phenological_stage_link').fadeIn()


$(document).ready(ready)
$(document).on('page:load', ready)