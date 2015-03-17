package ca.objects;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import ca.objects.Professor;

public class ProfessorTest 
{
	Professor testProfessor;
	

	@BeforeClass
	public static void setupBeforeClass() throws Exception
	{
		System.out.println("-------------------------------");
		System.out.println("Running Professor Test");
	}
	
	@AfterClass
	public static void tearDownAfterClass() throws Exception
	{
		System.out.println("Finished running Professor Tests");
		System.out.println("--------------------------------");
	}
	
	@Before
	public void setUp() throws Exception
	{
		this.testProfessor = new Professor(584786, "John", "123456", "john@gmail.com", "John", "Anna");
	}
	
	@After
	public void tearDown() throws Exception
	{
		this.testProfessor = null;
	}
	

	@Test
	public void testObject()
	{
		assertNotNull(testProfessor);
	}
	
	@Test
	public void testGetUserID()
	{
		assertEquals(584786,testProfessor.getUserID());
	}
	
	@Test
	public void testSetUserID()
	{
		testProfessor.setUserID(456789);
		assertEquals(456789,testProfessor.getUserID());
	}
	
	@Test
	public void testGetUserName()
	{
		assertEquals("John", testProfessor.getUsername());
	}
	
	@Test
	public void testSetInvalidUserName()
	{
		testProfessor.setUsername("11ieie");
		assertNotEquals("11ieie",testProfessor.getUsername());
	}
	
	@Test
	public void testSetValidUserName()
	{
		testProfessor.setUsername("ieiee");
		assertEquals("ieiee",testProfessor.getUsername());
	}
	
	@Test
	public void testGetPassword()
	{
		assertEquals("123456",testProfessor.getPassword());
	}
	
	@Test
	public void testSetInvalidPassword()
	{
		testProfessor.setPassword("a");
		assertNotEquals("a",testProfessor.getPassword());
		assertEquals("123456",testProfessor.getPassword());
	}
	
	@Test
	public void testSetValidPassword()
	{
		testProfessor.setPassword("abcdefg");
		assertEquals("abcdefg",testProfessor.getPassword());
	}
	
	@Test
	public void testGetEmailAddress()
	{
		assertEquals("john@gmail.com", testProfessor.getEmail());
	}
	
	@Test
	public void testSetInvalidEmailAddress()
	{
		testProfessor.setEmail("keeea..dfe@eewer.com");
		assertNotEquals("keeea..dfe@eewer.com",testProfessor.getEmail());
	}
	
	@Test
	public void testSetValidEmailAddress()
	{
		testProfessor.setEmail("lieg@hotmail.com");
		assertEquals("lieg@hotmail.com",testProfessor.getEmail());
	}
	
	@Test
	public void testGetFirstName()
	{
		assertEquals("John", testProfessor.getFirstName());
	}
	
	@Test
	public void testSetInvalidFirstName()
	{
		testProfessor.setFirstName("1John");
		assertNotEquals("1John",testProfessor.getFirstName());
		assertEquals("John",testProfessor.getFirstName());
	}
	
	@Test
	public void testSetValidFirstName()
	{
		testProfessor.setFirstName("Jason");
		assertEquals("Jason",testProfessor.getFirstName());
	}
	
	@Test
	public void testGetLastName()
	{
		assertEquals("Anna",testProfessor.getLastName());
	}
	
	@Test
	public void testSetInvalidLastName()
	{
		testProfessor.setLastName("1Anderson");
		assertNotEquals("1Anderson",testProfessor.getLastName());
	}
	
	@Test
	public void testSetValidLastName()
	{
		testProfessor.setLastName("Anderson");
		assertEquals("Anderson",testProfessor.getLastName());
	}
	
	@Test
	public void testGetType()
	{
		assertEquals("prof",testProfessor.getType());
	}
	
}
