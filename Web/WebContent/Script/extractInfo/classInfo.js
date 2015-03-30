function displayClassInfo(mySections, myInfo)
{
	var table2 = $('<table/>').appendTo($('#infoTable'));
    $('<tr/>').appendTo(table2)
        .append($('<td colspan="8"/>').text("Current Courses"));
    $('<tr/>').appendTo(table2)
        .append($('<th width="75"/>').text("Course"))
		.append($('<th width="50"/>').text("Section"))
		.append($('<th width="280"/>').text("Course Name"))
		.append($('<th width="50"/>').text("Credits"))
		.append($('<th width="60"/>').text("Days"))
		.append($('<th width="80"/>').text("Time"))
		.append($('<th width="65"/>').text("Location"))
		.append($('<th width="50"/>').text("Drop"));
    $.each(mySections, function(i, enrol)
    {
        $('<tr/>').appendTo(table2)
    		.append($('<td/>').text(enrol.section.cID))
    		.append($('<td/>').text(enrol.section.sectID))
    		.append($('<td/>').text(enrol.section.course.courseName))
   			.append($('<td/>').text(enrol.section.course.creditHrs))
    		.append($('<td/>').text(enrol.section.days))
    		.append($('<td/>').text(enrol.section.startTime + "-\n" + enrol.section.endTime))
    		.append($('<td/>').text(enrol.section.location))
   			.append($("<td align='center'><button class='btn btn-primary' type='button' id='drop_" + enrol.crn + "'>Drop</button></td>"));
        	
        // on drop
		$(document).on("click", "#drop_" + enrol.crn, function(event) { 
				
			var post = $.post("register", {
				action: "drop",
				crn: enrol.crn
			});
				
			post.done(function(data, textStatus, jqXHR) {
				// Update view to show course dropped:
				var tableRow = $("#drop_" + enrol.crn).parents("tr");
				tableRow.empty();
				tableRow.append($('<td colspan="100%" align="center"/>').text("Successfully dropped " + enrol.section.cID + "!"));
			});
				
			post.fail(function(jqXHR, textStatus, errorThrown) {
				alert("Dropping " + enrol.section.cID + " failed.");
			});
				
		});
    });
        
    $(myInfo).each(function(i, person){
        $('<tr/>').appendTo(table2).append($('<td colspan="100%"/>').text("Max credit hours: " + person.maxCreditsPerTerm ));
    });
}