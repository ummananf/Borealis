// restrict scope of these functions to register...
var register = {
	// Populates the selector element with JSON data receieved
	populateCategories: function(data)
	{
		var $select = $('#category');
		$select.find('option').remove();
		$.each(data, function(key, value) {
			$('<option>').val(value.degName).text(value.degName).appendTo($select);
		});
	},
	
	onTermChange: function(event) {
		var $term = $("select#term").val();
		$.post('registerCourses', { termName : $term }, register.populateCategories);
	},
	
	
	populateCoursesTable: function(data) {
		// clear table so not to append to previous courses
		$("#course_table").empty();
		// add table headers
		var headers = "<tr><th align='left'>Course ID</th><th align='left'>crn</th><th align='left'>Section</th><th align='left'>Capacity</th><th align='left'>Days</th><th align='left'>Start Time</th><th align='left'>End Time</th><th align='left'>Location</th></tr>";
		$("#course_table").append(headers);
		// populate table
		$.each(data, function(key, value) {
			
			var registerButton = "<button class='btn btn-primary' type='button' id='register_" + value.crn + "'>Register</button>";
			var dropButton = "<button class='btn btn-primary' type='button' id='drop_" + value.crn + "'>Drop</button>";
			var row = "<tr><td>" + value.cID + "</td><td>" + value.crn + "</td><td>" + value.sectID + "</td><td>" + value.maxSize + "</td><td>" + value.days + "</td><td>" + value.startTime + "</td><td>" + value.endTime + "</td><td>" + value.location + "</td><td>" + registerButton + dropButton + "</td></tr>";
			$("#course_table").append($.parseHTML(row));
			
			// Hide all drop btns as default
			$("#drop_" + value.crn).hide();
			
			// add event handlers to the buttons that were created
			// on register
			$(document).on("click", "#register_" + value.crn, function() { 
				
				var post = $.post("register", {
					action: "register",
					crn: value.crn
				});
				
				post.done(function(data, textStatus, jqXHR) {
					//alert("Successfully registered to " + value.cID + "!");
					
					$("#drop_" + value.crn).show(100);
					$("#register_" + value.crn).text('Registered!');
					$("#register_" + value.crn).prop('disabled', true);
				});
				
				post.fail(function(jqXHR, textStatus, errorThrown) {
					alert("Registration to " + value.cID + " failed.");
				});
				
				
			});
			
			// on drop
			$(document).on("click", "#drop_" + value.crn, function() { 
				
				var post = $.post("register", {
					action: "drop",
					crn: value.crn
				});
				
				post.done(function(data, textStatus, jqXHR) {
					//alert("Successfully dropped " + value.cID + "!");
					
					$("#drop_" + value.crn).hide(100);
					$("#register_" + value.crn).text('Register');
					$("#register_" + value.crn).prop('disabled', false);
				});
				
				post.fail(function(jqXHR, textStatus, errorThrown) {
					alert("Dropping " + value.cID + " failed.");
				});
				
			});
				
			

		});
	},
	
	// TODO: update registered buttons when course list if first loaded
//	getCurrentEnrollments: function() {
//		$.post("classInfo", {}, 
//			function(userEnrols) {
//				$.each(userEnrols, function(i, enrol) {
//					
//				}
//			}
//	}
};




$(document).ready(function() {
	
	$.ajaxSetup({
		cache : false
	});

	// Changes the options in course category selector when term selector is changed
	$('#term').change(function(event) {
		register.onTermChange(event);
	});
	
	
	$("#category").change(function(event) {
		var category = $("select#category option:selected").text();
		var term = $("select#term").val();
		$.post("registerCourses", {
			categoryName: category,
			termName: term
			},
			register.populateCoursesTable); 

	});
});



