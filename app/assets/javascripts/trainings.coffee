# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
	$('#training_instructor_id').parent().hide()
	instructors = $('#training_instructor_id').html()
	$('#training_institution_id').change ->
		institution = $('#training_institution_id :selected').text()
		options = $(instructors).filter("optgroup[label='#{institution}']").html()
		if options
			$('#training_instructor_id').html(options)
			$('#training_instructor_id').parent().show()
		else
			$('#training_instructor_id').empty()
			$('#training_instructor_id').parent().hide()