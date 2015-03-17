package ca.objects;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

public class AdminTest 
{
	Admin testAdmin;
	
	@BeforeClass
	public static void setupBeforeClass() throws Exception
	{
		System.out.println("-------------------------------");
		System.out.println("Running Admin Tests");
	}
	
	@AfterClass
	public static void tearDownAfterClass() throws Exception
	{
		System.out.println("Finished running Admin Tests");
		System.out.println("--------------------------------");
	}
	
	@Before
	public void setUp() throws Exception
	{
		this.testAdmin = new Admin( 111111, "root", "root321", "root@gmail.com", "Root", "Toor");
	}
	
	@After
	public void tearDown() throws Exception
	{
		this.testAdmin = null;
	}
	
	
	@Test
	public void testObject()
	{
		assertNotNull(testAdmin);
	}
	
	@Test
	public void testGetUserID()
	{
		assertEquals(111111,testAdmin.getUserID());
	}
	
	@Test
	public void testSetUserID()
	{
		testAdmin.setUserID(801);
		assertEquals(801,testAdmin.getUserID());
	}
	
	@Test
	public void testGetUserName()
	{
		assertEquals("root",testAdmin.getUsername());
	}
	
	@Test
	public void testSetUserName()
	{
		testAdmin.setUsername("toor");
		assertEquals("toor",testAdmin.getUsername());
	}
	
	@Test
	public void testGetPassword()
	{
		assertEquals("root321", testAdmin.getPassword());
	}
	
	@Test
	public void testSetPassword()
	{
		testAdmin.setPassword("222");
		assertEquals("222",testAdmin.getPassword());
	}
	
	@Test
	public void testGetEmail()
	{
		assertEquals("root@gmail.com", testAdmin.getEmail());
	}
	
	@Test
	public void setInvalidEmail()
	{
		testAdmin.setEmail("dfdfdfdafsdf");
		assertNotEquals("dfdfdfdafsdf",testAdmin.getEmail());  
		assertEquals("root@gmail.com", testAdmin.getEmail());
		
		testAdmin.setEmail("teier@xxx....dfde");
		assertNotEquals("teier@xxx....dfde",testAdmin.getEmail());
		assertEquals("root@gmail.com", testAdmin.getEmail());
	}
	
	@Test
	public void setValidEmail()
	{
		testAdmin.setEmail("tier@hotmail.com");
		assertEquals("tier@hotmail.com",testAdmin.getEmail());
	}
	
	@Test
	public void getFirstName()
	{
		assertEquals("Root", testAdmin.getFirstName());
	}
	
	@Test
	public void getLastName()
	{
		assertEquals("Toor", testAdmin.getLastName());
	}
}
