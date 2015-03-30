function populateCourseTable(coursesTaken)
{
	// clear previous information
    $('#gradeTable').empty();
    	
     var table = $('<table/>').appendTo($('#gradeTable'));
     $('<tr/>').appendTo(table)
    	.append($('<th width="75"/>').text("Course ID"))
   		.append($('<th width="300"/>').text("Course name"))
   		.append($('<th width="50"/>').text("Credits"))
   		.append($('<th width="40"/>').text("Grade"));  
    	
    // populate table with courses from the selected term
   	$(coursesTaken).each(function(i, enrol)
   	{
    	var courseGrade = getLetterGrade(enrol.grade);
    	
    	if (enrol.section.termStart == $('#termSelect').val())
    	{
			$('<tr/>').appendTo(table)
				.append($('<td/>').text(enrol.section.cID))
				.append($('<td/>').text(enrol.section.course.courseName))
				.append($('<td/>').text(enrol.section.course.creditHrs))
				.append($('<td/>').text(courseGrade));
    	}
   	});
}