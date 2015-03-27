function showPersonalInfo(myInfo)
{
	var table = $('<table/>').appendTo($('#infoTable'));
    $(myInfo).each(function(i, person)
    {
	    $('<tr/>').appendTo(table)
	        .append($('<td align="right" width="125"/>').text("name:"))
	        .append($('<td width="125"/>').text(person.firstName + " " + person.lastName))
	        .append($('<td align="right" width="125"/>').text("student ID:"))
	        .append($('<td width="125"/>').text(person.userID));
	    $('<tr/>').appendTo(table)
	    	.append($('<td align="right"/>').text("email:"))
	    	.append($('<td/>').text(person.email))
	    	.append($('<td align="right"/>').text("user name:"))
	    	.append($('<td/>').text(person.username));
	    $(myInfo).each(function(i, degree)
	    {
		    $('<tr/>').appendTo(table)
	    		.append($('<td align="right"/>').text("degree:"))
	    		.append($('<td colspan="3"/>').text(degree.degName));
	    });
	});
}