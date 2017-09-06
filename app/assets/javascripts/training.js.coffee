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