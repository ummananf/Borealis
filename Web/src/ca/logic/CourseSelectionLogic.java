package ca.logic;

import java.util.ArrayList;
import java.util.LinkedHashMap;

import ca.objects.Degree;
import ca.persistence.CourseSelectionModel;

public class CourseSelectionLogic {

	public CourseSelectionLogic(){}
	
	public LinkedHashMap<String, LinkedHashMap<String, String>> getDegrees( String term ){
		
		LinkedHashMap<String, String> degreeMap;
		LinkedHashMap<String, LinkedHashMap<String, String>> listOfDegrees = new LinkedHashMap<String, LinkedHashMap<String, String>>();
		
		ArrayList<Degree> degrees = CourseSelectionModel.getDegrees( term );

		for(int i = 0; i < degrees.size(); i++){
			degreeMap = new LinkedHashMap<String, String>();
			degreeMap.put("degName", degrees.get(i).getDegName());
			degreeMap.put("degOption", degrees.get(i).getDegOption());
			degreeMap.put("degProgram", degrees.get(i).getDegProgram());
			degreeMap.put("totalCreditHrs", String.valueOf(degrees.get(i).getCreditHrs()));
			listOfDegrees.put("degree"+i, degreeMap);
		}
		
		return listOfDegrees;	
	}
	
}
