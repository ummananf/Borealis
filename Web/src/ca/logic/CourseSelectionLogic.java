package ca.logic;

import java.util.ArrayList;
import java.util.LinkedHashMap;

import ca.objects.Course;
import ca.objects.Degree;
import ca.objects.Section;
import ca.persistence.CourseModel;
import ca.persistence.CourseSelectionModel;
import ca.persistence.SectionModel;

public class CourseSelectionLogic 
{

	public CourseSelectionLogic(){}
	
	public LinkedHashMap<String, LinkedHashMap<String, String>> getDegrees( String term )
	{
		
		LinkedHashMap<String, String> degreeMap;
		LinkedHashMap<String, LinkedHashMap<String, String>> listOfDegrees = new LinkedHashMap<String, LinkedHashMap<String, String>>();
		
		ArrayList<Degree> degrees = CourseSelectionModel.getDegrees( term );

		for(int i = 0; i < degrees.size(); i++)
		{
			degreeMap = new LinkedHashMap<String, String>();
			degreeMap.put("degName", degrees.get(i).getDegName());
			degreeMap.put("degOption", degrees.get(i).getDegOption());
			degreeMap.put("degProgram", degrees.get(i).getDegProgram());
			degreeMap.put("totalCreditHrs", String.valueOf(degrees.get(i).getCreditHrs()));
			listOfDegrees.put("degree"+i, degreeMap);
		}
		
		return listOfDegrees;	
	}
	
	public LinkedHashMap<String, LinkedHashMap<String, String>> getCourses(String department) 
	{
		LinkedHashMap<String, String> courseMap;
		LinkedHashMap<String, LinkedHashMap<String, String>> listOfCourses = new LinkedHashMap<String, LinkedHashMap<String, String>>();
		ArrayList<Course> courses = CourseModel.getCoursesByDepartment(department);
		
		for(int i = 0; i < courses.size(); i++){
			courseMap = new LinkedHashMap<String, String>();
			courseMap.put("courseID", courses.get(i).getCourseID());
			courseMap.put("courseName", courses.get(i).getCourseName());
			courseMap.put("dept", courses.get(i).getDept());
			courseMap.put("faculty", courses.get(i).getFaculty());
			courseMap.put("creditHrs", String.valueOf(courses.get(i).getCreditHrs()));
			listOfCourses.put(courses.get(i).getCourseID(), courseMap);
		}
		
		return listOfCourses;
	}
	
	public LinkedHashMap<String, LinkedHashMap<String, String>> getSections(String courseId) 
	{
		LinkedHashMap<String, String> sectionMap;
		LinkedHashMap<String, LinkedHashMap<String, String>> listOfSections = new LinkedHashMap<String, LinkedHashMap<String, String>>();
		ArrayList<Section> sections = SectionModel.getSectionByCourseId(courseId);
		
		for(int i = 0; i < sections.size(); i++)
		{
			sectionMap = new LinkedHashMap<String, String>();
			sectionMap.put("sectID", sections.get(i).getSectID());
			sectionMap.put("crn", sections.get(i).getCrn());
			sectionMap.put("cID", sections.get(i).getCourseID());
			sectionMap.put("termStart", sections.get(i).getTermStart());
			sectionMap.put("maxSize", String.valueOf(sections.get(i).getMaxSize()));
			sectionMap.put("days", sections.get(i).getDays());
			sectionMap.put("startTime", sections.get(i).getStartTime().toString());
			sectionMap.put("endTime", sections.get(i).getEndTime().toString());
			sectionMap.put("location", sections.get(i).getLocation());
			listOfSections.put(sections.get(i).getCourseID(), sectionMap);
		}
		
		return listOfSections;
	}
	
}
