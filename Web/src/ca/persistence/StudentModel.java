package ca.persistence;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.sql.Date;


import ca.objects.Enrollment;



public class StudentModel {
	
	
	// TODO: may have to add a "gradeReceived" boolean to DB table, since grade will be read as 0 if it is NULL
	public static ArrayList<Enrollment> getCompletedCourses(int studentID)
	{
		String query = "SELECT * FROM Enrolled WHERE userID = "+studentID+" AND grade IS NOT NULL;";
		ArrayList<Enrollment> courses = new ArrayList<Enrollment>();
		List<Map<String, Object>> resultList = DB.getData(query);
		int i = 0;
		
		for (Iterator<Map<String, Object>> iter = resultList.iterator(); iter.hasNext(); i++){
			Map<String, Object> row = resultList.get(i);
			
			Enrollment temp = new Enrollment((Integer) row.get("userID"), 
											(String) row.get("sectID"),
											(String) row.get("cID"), 
											(Date) row.get("termStart"),
											((Double) row.get("grade")).floatValue());
			courses.add(temp);
		}

		return courses;
	}

}