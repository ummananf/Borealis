package ca.persistence;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import ca.objects.Prereq;

public class CourseModel {

	// Gets list of prereqs for given courseID
	public static ArrayList<Prereq> getPrereqs(String courseID)
	{
		String query = "SELECT * FROM Prereqs WHERE cID = '"+courseID+"';";

		ArrayList<Prereq> prereqs = new ArrayList<Prereq>();
		
		List<Map<String, Object>> resultList = DB.getData(query);
		int i = 0;
		for (Iterator<Map<String, Object>> iter = resultList.iterator(); iter.hasNext(); i++){
			Map<String, Object> row = resultList.get(i);
			
			Prereq temp = new Prereq((String) row.get("cID"), 
									(String) row.get("prereqCID"),
					 				((Double) row.get("minGrade")).floatValue());
			
			prereqs.add(temp);
		}

		return prereqs;
	}

}
