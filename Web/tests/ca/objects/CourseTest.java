package ca.objects;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import ca.objects.Course;

public class CourseTest 
{
	Course testCourse;
	
	@BeforeClass
	public static void setupBeforeClass() throws Exception
	{
		System.out.println("-------------------------------");
		System.out.println("Running Course Tests");
	}
	

	@AfterClass
	public static void tearDownAfterClass() throws Exception
	{
		System.out.println("Finished running Course Tests");
		System.out.println("--------------------------------");
	}
	
	@Before
	public void setUp() throws Exception
	{
		this.testCourse = new Course("COMP4350", "Software engineering II", "Science", "Computer Science", "It's complex!", 3,false);
	}
	
	@After
	public void tearDown() throws Exception
	{
		this.testCourse = null;
	}
	
	@Test
	public void testObject()
	{
		assertNotNull(testCourse);
	}
	
	@Test
	public void testGetCourseID()
	{
		assertEquals("COMP4350",this.testCourse.getCourseID());
	}
	
	@Test
	public void testSetValidCourseID()
	{
		this.testCourse.setCourseID("COMP1260");
		assertEquals("COMP1260",this.testCourse.getCourseID());
	}
	
	@Test
	public void testGetCourseName()
	{
		assertEquals("Software engineering II", this.testCourse.getCourseName());
	}
	
	@Test
	public void testSetValidCourseName()
	{
		this.testCourse.setCourseName("SE II");
		assertEquals("SE II", this.testCourse.getCourseName());
	}
	
	@Test
	public void testGetFaculty()
	{
		assertEquals("Science", this.testCourse.getFaculty());
	}
	
	@Test
	public void testSetValidFaculty()
	{
		this.testCourse.setFaculty("Engineering");
		assertEquals("Engineering",this.testCourse.getFaculty());
	}
	
	@Test
	public void testGetDepartment()
	{
		assertEquals("Computer Science",this.testCourse.getDept());
	}
	
	@Test
	public void testSetValidDepartment()
	{
		this.testCourse.setDept("Computer Engineering");
		assertEquals("Computer Engineering", this.testCourse.getDept());
	}
	@Test
	public void testGetCreditHours()
	{
		assertEquals(3,this.testCourse.getCreditHrs());
	}
	
	@Test
	public void testSetValidCreditHours()
	{
		this.testCourse.setCreditHrs(4);
		assertEquals(4,this.testCourse.getCreditHrs());
	}
	
	@Test
	public void testIsFullYear()
	{
		assertEquals(false,this.testCourse.isFullYr());
	}
}
