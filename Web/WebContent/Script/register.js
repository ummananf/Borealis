// Populates the selector element with JSON data receieved
function populateCategories(data)
{
	var $select = $('#category');
	$select.find('option').remove();
	$.each(data, function(key, value) {
		$('<option>').val(value.degName).text(value.degName).appendTo($select);
	});
};

function onTermChange(event) {
	var $term = $("select#term").val();
	$.post('registerCourses', { termName : $term }, populateCategories);
}


$(document).ready(function() {

	$.ajaxSetup({
		cache : false
	});


	// Changes the options in course category selector when term selector is changed
	$('#term').change(function(event) {
		onTermChange(event);
	});
	
	
	$("#category").change(function(event) {
		var category = $("select#category option:selected").text();
		$.post("registerCourses", {
			categoryName: category
		}, function(data) {
			// clear table so not to append to previous courses
			$("#course_table").empty();
			// add table headers
			var headers = "<tr><th align='left'>Course ID</th><th align='left'>crn</th><th align='left'>Section</th><th align='left'>Capacity</th><th align='left'>Days</th><th align='left'>Start Time</th><th align='left'>End Time</th><th align='left'>Location</th></tr>";
			$("#course_table").append(headers);
			// populate table
			$.each(data, function(key, value) {
				var registerButton = "<button type='button' id='register_" + value.cID + "'>Register</button>";
				var dropButton = "<button type='button' id='drop_" + value.cID + "'>Drop</button>";
				var row = "<tr><td>" + value.cID + "</td><td>" + value.crn + "</td><td>" + value.sectID + "</td><td>" + value.maxSize + "</td><td>" + value.days + "</td><td>" + value.startTime + "</td><td>" + value.endTime + "</td><td>" + value.location + "</td><td>" + registerButton + dropButton + "</td></tr>";
				$("#course_table").append($.parseHTML(row));
				
				// add event handlers to the buttons that were created
				// on register
				$(document).on("click", "#register_" + value.cID, function() { 
					
					var post = $.post("register", {
						action: "register",
						cID: value.cID,
						sectID: value.sectID,
						startDate: value.termStart,
						crn:value.crn
					});
					
					post.done(function(data, textStatus, jqXHR) {
						alert("Successfully registered to " + value.cID + "!");
					});
					
					post.fail(function(jqXHR, textStatus, errorThrown) {
						alert("Registration to " + value.cID + " failed.");
					});
					
				});
				
				// on drop
				$(document).on("click", "#drop_" + value.cID, function() { 
					
					var post = $.post("register", {
						action: "drop",
						cID: value.cID,
						sectID: value.sectID,
						startDate: value.termStart,
						crn: value.crn
					});
					
					post.done(function(data, textStatus, jqXHR) {
						alert("Successfully dropped " + value.cID + "!");
					});
					
					post.fail(function(jqXHR, textStatus, errorThrown) {
						alert("Dropping " + value.cID + " failed.");
					});
					
				});
					
					
			});

		});
	});
});



