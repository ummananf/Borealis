package ca.persistence;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.sql.Date;



import ca.objects.Enrollment;



public class StudentModel 
{
	public static ArrayList<Enrollment> getCompletedCourses(int studentID)
	{
		String query = "SELECT * FROM Enrolled WHERE userID = "+studentID+" AND grade IS NOT NULL;";
		
		ArrayList<Enrollment> courses = new ArrayList<Enrollment>();
		List<Map<String, Object>> resultList = DB.getData(query);
		Iterator<Map<String, Object>> iter = resultList.iterator();
		
		while(iter.hasNext()) 
		{
			Map<String, Object> row = iter.next();
			
			Enrollment temp = new Enrollment((Integer) row.get("userID"), 
											(String) row.get("crn"),
											(String) row.get("sectID"),
											(String) row.get("cID"), 
											(Date) row.get("termStart"),
											(Float) row.get("grade") );
			courses.add(temp);
		}

		return courses;
	}

}
