function getLetterGrade(grade)
{
    var result = "n/a";
    	
    // grade is represented by a number depending on grade points
   	// (ie. 4.5 for A+, 4.0 for A, etc.)
    // voluntary withdrawl is represented by a -1 grade.
   	// if grade is null, the course is not yet completed
    switch(grade)
   	{
    	case 4.5: result = "A+";
    		break;
   		case 4.0: result = "A";
    		break;
    	case 3.5: result = "B+";
    		break;
    	case 3.0: result = "B";
    		break;
   		case 2.5: result = "C+";
    		break;
    	case 2.0: result = "C";
    		break;
    	case 1.0: result = "D";
    		break;
   		case 0.0: result = "F";
    		break;
    	case -1.0: result = "VW";
    		break;
    	case "null": result = "inc.";
    		break;
   	}
    	
    return result;
}