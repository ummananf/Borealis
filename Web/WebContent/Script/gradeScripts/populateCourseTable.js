function populateCourseTable(coursesTaken)
{
	// clear previous information
    $('#gradeTable').empty();
    	
     var table = $('<table/>').appendTo($('#gradeTable'));
     $('<tr/>').appendTo(table)
    	.append($('<th width="75"/>').text("Course ID"))
   		.append($('<th width="300"/>').text("Course name"))
   		.append($('<th width="40"/>').text("Grade"));  
    	
    // populate table with courses from the selected term
   	$(coursesTaken).each(function(i, course)
   	{
    	var courseGrade = getLetterGrade(course.grade);
    	
    	if (course.term == $('#termSelect').val())
    	{
			$('<tr/>').appendTo(table)
				.append($('<td/>').text(course.cID))
				.append($('<td/>').text(course.cName))
				.append($('<td/>').text(courseGrade));
    	}
   	});
}