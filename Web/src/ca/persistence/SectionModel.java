package ca.persistence;

import java.sql.Time;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import ca.objects.Course;
import ca.objects.Section;

public class SectionModel 
{	
	public static ArrayList<Section> getSectionByCourseId(String courseId) 
	{
		String query = "SELECT * FROM Sections WHERE cID = '" + courseId + "';";
		return createSections(query);
	}
	
	// will only return one as long as crn is primary key
	public static Section getSectionByCRN(String crn) 
	{
		String query = "SELECT * FROM Sections WHERE crn = '" + crn + "';";
		ArrayList<Section> sec = createSections(query);
		if(!sec.isEmpty())
			return sec.get(0);
		else
			return null;
	}
	
	public static ArrayList<Section> getSectionsByDeptAndTerm(String dept, String term)
	{
		String query = "SELECT * FROM Sections S, Courses C "
					  +"WHERE S.cID = C.cID AND C.department = '"+dept+"' AND S.termStart = '"+term+"';";
		return createSectionsWithCourseInfo(query);
	}

	
	
	private static ArrayList<Section> createSections(String query)
	{
		ArrayList<Section> sections = new ArrayList<Section>();
		List<Map<String, Object>> resultList = DB.getData(query);
		Iterator<Map<String, Object>> iter = resultList.iterator();
		
		while(iter.hasNext()) {
			Map<String, Object> row = iter.next();
			
			Section sect = new Section(
					(String)row.get("crn"),
					(String) row.get("sectID"), 
					(String) row.get("cID"), 
					(String) row.get("termStart"),
					(Integer) row.get("maxSize"), 
					(String) row.get("days"), 
					(Time) row.get("startTime"),
					(Time) row.get("endTime"), 
					(String) row.get("location"),
					null);
			
			sections.add(sect);
		}
		
		return sections;
	}
	
	private static ArrayList<Section> createSectionsWithCourseInfo(String query)
	{
		ArrayList<Section> sections = new ArrayList<Section>();
		List<Map<String, Object>> resultList = DB.getData(query);
		Iterator<Map<String, Object>> iter = resultList.iterator();
		
		while(iter.hasNext()) {
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
							(String)row.get("crn"),
							(String) row.get("sectID"), 
							(String) row.get("cID"), 
							(String) row.get("termStart"),
							(Integer) row.get("maxSize"), 
							(String) row.get("days"), 
							(Time) row.get("startTime"),
							(Time) row.get("endTime"), 
							(String) row.get("location"), course);
			
			sections.add(sect);
		}
		
		return sections;
	}
}
