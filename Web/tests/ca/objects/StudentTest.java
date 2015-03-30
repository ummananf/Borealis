package ca.objects;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertNotNull;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import ca.objects.Student;


public class StudentTest 
{
	Student testStudent;
	

	@BeforeClass
	public static void setupBeforeClass() throws Exception
	{
		System.out.println("-------------------------------");
		System.out.println("Running Student Test");
	}
	
	@AfterClass
	public static void tearDownAfterClass() throws Exception
	{
		System.out.println("Finished running Student Tests");
		System.out.println("--------------------------------");
	}
	

	@Before
	public void setUp() throws Exception
	{
		this.testStudent = new Student(681201, "Eve", "123456", "eve@gmail.com", "Eve", "Titan", "computer science", 15);
	}
	
	@After
	public void tearDown() throws Exception
	{
		this.testStudent = null;
	}
	
	@Test
	public void testObject()
	{
		assertNotNull(testStudent);
	}
	
	@Test
	public void testGetUserID()
	{
		assertEquals(681201,testStudent.getUserID());
	}
	
	@Test
	public void testSetUserID()
	{
		testStudent.setUserID(123456);
		assertEquals(123456,testStudent.getUserID());
	}
	
	@Test
	public void testGetUserName()
	{
		assertEquals("Eve", testStudent.getUsername());
	}
	
	@Test
	public void testSetInvalidUserName()
	{
		testStudent.setUsername("1eve");
		assertNotEquals("1eve",testStudent.getUsername());
	}
	
	@Test
	public void testSetValidUserName()
	{
		testStudent.setUsername("evea");
		assertEquals("evea",testStudent.getUsername());
	}
	
	@Test
	public void testGetPassword()
	{
		assertEquals("123456",testStudent.getPassword());
	}
	
	@Test
	public void testSetInvalidPassword()
	{
		testStudent.setPassword("b");
		assertNotEquals("b",testStudent.getPassword());
		assertEquals("123456",testStudent.getPassword());
	}
	
	@Test
	public void testSetValidPassword()
	{
		testStudent.setPassword("789456123");
		assertEquals("789456123",testStudent.getPassword());
	}
	
	@Test
	public void testGetEmailAddress()
	{
		assertEquals("eve@gmail.com", testStudent.getEmail());
	}
	
	@Test
	public void testSetInvalidEmailAddress()
	{
		testStudent.setEmail("@fff@wer.com");
		assertNotEquals("@fff@wer.com",testStudent.getEmail());
	}
	
	@Test
	public void testSetValidEmailAddress()
	{
		testStudent.setEmail("eeve@hotmail.com");
		assertEquals("eeve@hotmail.com",testStudent.getEmail());
	}
	
	@Test
	public void testGetFirstName()
	{
		assertEquals("Eve", testStudent.getFirstName());
	}
	
	@Test
	public void testSetInvalidFirstName()
	{
		testStudent.setFirstName("1Eve");
		assertNotEquals("1Eve",testStudent.getFirstName());
		assertEquals("Eve",testStudent.getFirstName());
	}
	
	@Test
	public void testSetValidFirstName()
	{
		testStudent.setFirstName("Even");
		assertEquals("Even",testStudent.getFirstName());
	}
	
	@Test
	public void testGetLastName()
	{
		assertEquals("Titan",testStudent.getLastName());
	}
	
	@Test
	public void testSetInvalidLastName()
	{
		testStudent.setLastName("1Titan");
		assertNotEquals("1Titan",testStudent.getLastName());
	}
	
	
	@Test
	public void testSetValidLastName()
	{
		testStudent.setLastName("supertitan");
		assertEquals("supertitan",testStudent.getLastName());
	}
	
	@Test
	public void testGetType()
	{
		assertEquals("student",testStudent.getType());
	}
	
	public void testGetDegreeName()
	{
		assertEquals("computer science",testStudent.getDegName());
	}
}
