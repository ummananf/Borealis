package ca.servlets;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Set;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import com.google.gson.Gson;

import ca.logic.CourseSelectionLogic;

public class RegisterCoursesTest 
{
	
	Connection connection;
	CourseSelectionLogic csLogic;

	@BeforeClass
	public static void setupBeforeClass() throws Exception
	{
		System.out.println("-------------------------------");
		System.out.println("Running change email logic tests");
	}
	
	@AfterClass
	public static void tearDownAfterClass() throws Exception
	{
		System.out.println("Finished running email password logic tests");
		System.out.println("--------------------------------");
	}
	
	@Before
	public void setUp() throws Exception 
	{
		csLogic = new CourseSelectionLogic();
	}

	@After
	public void tearDown() throws Exception 
	{
	}

	@Test
	public final void testIntegrationDegreesCase() 
	{
		LinkedHashMap<String, LinkedHashMap<String, String>> degreeList = csLogic.getDegrees("Winter2015"); 
		assertNotNull(degreeList);
		
		String json= new Gson().toJson(degreeList);
		assertNotEquals("", json);
		assertNotEquals(null, json);
		
	}
	
	@Test
	public final void testIntegrationCoursesCase() 
	{
		LinkedHashMap<String, LinkedHashMap<String, String>> degreeList = csLogic.getCourses("Computer Science");
		assertNotNull(degreeList);
		
		String json= new Gson().toJson(degreeList);
		assertNotEquals("", json);
		assertNotEquals(null, json);
		
	}
	
	@Test
	public final void testIntegrationSectionsCase() 
	{
		LinkedHashMap<String, LinkedHashMap<String, String>> courses = csLogic.getCourses("Computer Science");
		LinkedHashMap<String, LinkedHashMap<String, String>> sections = new LinkedHashMap<String, LinkedHashMap<String, String>>();
		
		Set<String> courseKeys = courses.keySet();
		Iterator<String> iterator = courseKeys.iterator();
		
		while(iterator.hasNext()) 
		{
			String key = (String) iterator.next();
			assertNotNull(key);
			assertNotEquals("", key);
			
			LinkedHashMap<String, LinkedHashMap<String, String>> section = csLogic.getSections(key);
			assertNotNull(section);
			
			LinkedHashMap<String, String> sec = section.get(key);
			assertNotNull(key);
			sections.put(key, sec);
		}
		
		String json = new Gson().toJson(sections);
		assertNotEquals("", json);
		assertNotEquals(null, json);
		
	}


}
