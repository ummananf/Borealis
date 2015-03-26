           
function parseWelcomeTag(persons) 
{
    var table = $('<table/>').appendTo($('#welcomeTag'));
    $(persons).each(function(i, person) {
        $('<tr/>').appendTo(table)
            .append($('<td/>').text(person.username))
            .append($('<td/>').text(person.userID))
        	.append($('<td/>').text(",Welcome back!"));
    });
};