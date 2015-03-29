package ca.persistence;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import ca.objects.Degree;
import ca.objects.Course;

public class DegreeModel 
{
    public static ArrayList<Course> getDegreeCourses(String degName)
    {
        String query = "SELECT * FROM DegreeCourses D, Courses C WHERE D.cID = C.cID AND "
                        + "D.degName = '" + degName + "';";
        
        return createCourses(query);
    }
    
    public static Degree getDegreeInfo(String degName)
    {
        String query = "SELECT * FROM Degrees WHERE degName = '" + degName + "';";
        return createDegree(query);
    }
    
    private static ArrayList<Course> createCourses(String query)
    {
        ArrayList<Course> courses = new ArrayList<Course>();
        List <Map<String, Object>> resultList = DB.getData(query);
        Iterator<Map<String, Object>> iter = resultList.iterator();
        
        while (iter.hasNext())
        {
            Map <String, Object> row = iter.next();
            boolean isFullYr = false;
            
            if ((String)row.get("isFullYr") == "TRUE")
                isFullYr = true;
            
            Course course = new Course(
                (String)row.get("cID"),
                (String)row.get("cName"),
                (String)row.get("faculty"),
                (String)row.get("department"),
                (String)row.get("description"),
                (Integer)row.get("creditHrs"),
                isFullYr);
            
            courses.add(course);
        }
        
        return courses;
    }
    
    private static Degree createDegree(String query)
    {
        Degree degree = null;
        List <Map<String, Object>> resultList = DB.getData(query);
        Iterator <Map<String, Object>> iter = resultList.iterator();
        
        // we only need the first Degree - since query is searching for a Degree by primary key, it will only find one
        if (iter.hasNext())
        {
            Map <String, Object> row = iter.next();
        
            degree = new Degree(
                (String)row.get("degName"),
                (String)row.get("degProgram"),
                (String)row.get("degOption"),
                (Integer)row.get("totalCreditHrs"));
        }
        
        return degree;
    }
}