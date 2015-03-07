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
		Iterator<Map<String, Object>> iter = resultList.iterator();
		
		while(iter.hasNext()) {
			Map<String, Object> row = iter.next();
			
			Prereq prereq = new Prereq((String) row.get("cID"), 
									   (String) row.get("prereqCID"),
									   (Float) row.get("minGrade"));
			prereqs.add(prereq);
		}

		return prereqs;
	}
}
