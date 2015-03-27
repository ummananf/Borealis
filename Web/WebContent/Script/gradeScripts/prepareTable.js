function prepareTable()
{
	// show first row of table now
     $('<tr/>').appendTo(table)
    	.append($('<th width="75"/>').text("Course ID"))
    	.append($('<th width="300"/>').text("Course Name"))
   		.append($('<th width="40"/>').text("Grade")); 
}