package ca.persistence;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;


import java.sql.Time;

import ca.objects.Enrollment;
import ca.objects.Section;



public class StudentModel 
{
	public static ArrayList<Enrollment> getCompletedEnrollments(int studentID)
	{
		String query = "SELECT * FROM Sections S, Enrolled E" +
					   " WHERE S.crn = E.crn AND E.userID = "+studentID +
					   " AND E.grade IS NOT NULL;";
		
		ArrayList<Enrollment> enrollments = new ArrayList<Enrollment>();
		List<Map<String, Object>> resultList = DB.getData(query);
		Iterator<Map<String, Object>> iter = resultList.iterator();
		
		while(iter.hasNext()) 
		{
			Map<String, Object> row = iter.next();
			
			Section sect = new Section(
					(String) row.get("crn"),
					(String) row.get("sectID"), 
					(String) row.get("cID"), 
					(String) row.get("termStart"),
					(Integer) row.get("maxSize"), 
					(String) row.get("days"), 
					(Time) row.get("startTime"),
					(Time) row.get("endTime"), 
					(String) row.get("location"), null);
			
			Enrollment enrol = new Enrollment(
					(Integer) row.get("userID"),
					(String) row.get("crn"),
					(Float) row.get("grade"), sect);
			
			enrollments.add(enrol);
		}

		return enrollments;
	}
	
//	public static ArrayList<Enrollment> getCurrentEnrollments(int studentID)
//	{
//		String query = "SELECT * FROM Enrolled WHERE userID = "+studentID+" AND grade IS NOT NULL;";
//		
//		ArrayList<Course> enrollments = new ArrayList<Course>();
//		List<Map<String, Object>> resultList = DB.getData(query);
//		Iterator<Map<String, Object>> iter = resultList.iterator();
//		
//		while(iter.hasNext()) 
//		{
//			Map<String, Object> row = iter.next();
//			
//			Enrollment temp = new Enrollment((Integer) row.get("userID"), 
//											(String) row.get("crn"),
//											(Float) row.get("grade") );
//			enrollments.add(temp);
//		}
//
//		return enrollments;
//	}

}
