function prepareTable()
{
	var table = $('#gradeTable');
	
	// show first row of table now
     $('<tr/>').appendTo(table)
    	.append($('<th width="75"/>').text("Course ID"))
    	.append($('<th width="300"/>').text("Course Name"))
    	.append($('<th width="50"/>').text("Credits"))
   		.append($('<th width="40"/>').text("Grade")); 
}