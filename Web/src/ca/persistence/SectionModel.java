package ca.persistence;

import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import ca.objects.Course;
import ca.objects.Section;

public class SectionModel {
	
	public static ArrayList<Section> getSectionByCourseId(String courseId) {
		String query = "SELECT * FROM Sections WHERE cID = '" + courseId + "';";
		ArrayList<Section> sections = new ArrayList<Section>();
		List<Map<String, Object>> resultList = DB.getData(query);
		Iterator<Map<String, Object>> iter = resultList.iterator();
		
		while(iter.hasNext()) {
			Map<String, Object> row = iter.next();
			
			Section course = new Section((String) row.get("sectID"), (String) row.get("cID"), (Date) row.get("termStart"),
					(Integer) row.get("maxSize"), (String) row.get("days"), (Time) row.get("startTime"),
					(Time) row.get("endTime"), (String) row.get("location"));
			
			sections.add(course);
		}
		
		return sections;
	}

}
