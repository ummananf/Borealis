package ca.persistence;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;


import java.sql.Time;

import ca.objects.Course;
import ca.objects.Enrollment;
import ca.objects.Section;



public class StudentModel 
{
	public static ArrayList<Enrollment> getCompletedEnrollments(int studentID)
	{
		String query = "SELECT * FROM Sections S, Enrolled E, Courses C" +
					   " WHERE S.crn = E.crn AND S.cID = C.cID AND E.userID = "+studentID +
					   " AND E.grade >= 0;";
		
		return createDetailedEnrollments(query);
	}
	
	
	public static ArrayList<Enrollment> getEnrollmentsByTerm(int studentID, String currTerm)
	{
		String query = "SELECT * FROM Enrolled E, Sections S, Courses C "
					  +"WHERE E.crn = S.crn AND S.cID = C.cID "
					  +"AND E.userID = "+studentID+" AND S.termStart = '"+currTerm+"';";
		
		return createDetailedEnrollments(query);
	}
	
	// Returns total num of credit hrs student is registered for in term given
	public static int getNumCreditHrsRegistered(int studentID, String term)
	{
		String query = "SELECT creditHrs FROM Courses C, Enrolled E, Sections S "
					   +"WHERE E.crn = S.crn AND S.cID = C.cID "
					   +"AND E.userID = "+studentID+" AND S.termStart = '"+term+"';";
		
		int count = 0;
		
		List<Map<String, Object>> resultList = DB.getData(query);
		Iterator<Map<String, Object>> iter = resultList.iterator();
		
		while(iter.hasNext()) 
		{
			Map<String, Object> row = iter.next();
			
			count += (Integer) row.get("creditHrs");
		}
		
		return count;
	}
	
	
	
	// Creates list of enrollments with their section & course info from DB query
	private static ArrayList<Enrollment> createDetailedEnrollments(String query)
	{
		ArrayList<Enrollment> enrollments = new ArrayList<Enrollment>();
		List<Map<String, Object>> resultList = DB.getData(query);
		Iterator<Map<String, Object>> iter = resultList.iterator();
		
		while(iter.hasNext()) 
		{
			Map<String, Object> row = iter.next();
			
			Course course = new Course(
							(String) row.get("cID"),
							(String) row.get("cName"),
							(String) row.get("faculty"),
							(String) row.get("department"),
							(String) row.get("description"),
							(Integer) row.get("creditHrs"),
							(Boolean) row.get("isFullYr") );
	
			Section sect = new Section(
							(String) row.get("crn"),
							(String) row.get("sectID"), 
							(String) row.get("cID"), 
							(String) row.get("termStart"),
							(Integer) row.get("maxSize"), 
							(String) row.get("days"), 
							(Time) row.get("startTime"),
							(Time) row.get("endTime"), 
							(String) row.get("location"), course);
			
			Enrollment enrol = new Enrollment(
							(Integer) row.get("userID"),
							(String) row.get("crn"),
							(Float) row.get("grade"), sect);
			
			enrollments.add(enrol);
		}

		return enrollments;
	}
	
	public static double getOverallGPA(int studentID)
	{
		double gpa = 0.0;
		
		ArrayList<Enrollment> enrollments = getCompletedEnrollments(studentID);
		
		if(enrollments.size()>0)
		{
			for(int i = 0; i < enrollments.size();i++)
			{
				gpa +=enrollments.get(i).getGrade();
			}
			gpa = gpa/enrollments.size();
		}
		return gpa;
	}
	
	
	public static int getNumCompletedEnrollments(int studentID)
	{
		int numCompleted = 0;
		
		ArrayList<Enrollment> enrollments = getCompletedEnrollments(studentID);
		
		numCompleted = enrollments.size();
		
		return numCompleted;
	}
	
	public static int getNumTotalEnrollments(int studentID)
	{
		int numTotal = 0;
		
		ArrayList<Enrollment> enrollments = EnrollmentModel.getEnrollmentRecord(studentID);
		
		numTotal = enrollments.size();
		
		return numTotal;
	}
	
}
