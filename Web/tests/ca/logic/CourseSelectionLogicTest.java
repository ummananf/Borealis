package ca.logic;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.util.ArrayList;
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
import ca.objects.Course;
import ca.objects.Degree;
import ca.objects.Section;
import ca.persistence.CourseModel;
import ca.persistence.CourseSelectionModel;
import ca.persistence.SectionModel;

public class CourseSelectionLogicTest 
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
		ArrayList<Degree> degrees = CourseSelectionModel.getDegrees("Winter2015");
		assertNotNull(degrees);
		assertNotEquals(degrees.get(0), "");
		
	}
	
	@Test
	public final void testIntegrationCoursesCase() 
	{
		ArrayList<Course> courses = CourseModel.getCoursesByDepartment("Computer Science");
		assertNotNull(courses);
		assertNotEquals(courses.get(0), "");
		
	}
	
	@Test
	public final void testIntegrationSectionsCase() 
	{
		ArrayList<Section> sections = SectionModel.getSectionByCourseId("COMP1010");
		assertNotNull(sections);
		assertNotEquals(sections.get(0), "");
	}


}
