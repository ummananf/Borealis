package ca.logic;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.BeforeClass;
import org.junit.AfterClass;

import ca.objects.User;

public class LoginLogicTest 
{
	
	static LoginLogic loginLogic;
	User testUser;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception
	{
		System.out.println("Testing login logic");
		loginLogic = new LoginLogic();
	}
	
	@AfterClass
	public static void tearDownAfterClass() throws Exception
	{
		System.out.println("Finish testing login logic");
	}
	
	@Before
	public void setUp() throws Exception 
	{	
		testUser = loginLogic.getUserIfValid("bob", "4350"); // This is the default test account for our course registraiton system
	}

	@After
	public void tearDown() throws Exception
	{
	}
	
	@Test
	public final void testGetUserIfValid() 
	{	
		// test with existing user
		assertNotNull(loginLogic.getUserIfValid("bob", "4350"));
		assertNotNull(loginLogic.getUserIfValid("admin1", "password"));
		
		// test with non existing users
		assertNull(loginLogic.getUserIfValid("student1", "passworld"));
		assertNull(loginLogic.getUserIfValid("studentl", "password"));
		assertNull(loginLogic.getUserIfValid("somename", "somepassword"));
		assertNull(loginLogic.getUserIfValid("password", "student1"));
	}
	
	@Test
	public void testFirstName()
	{
		assertEquals("Bob",this.testUser.getFirstName());
	}
	
	@Test
	public void testLastName()
	{
		assertEquals("Carslon",this.testUser.getLastName());
	}
	
	@Test
	public void testStudentID()
	{	
		int id = 7651245;
		int wrongID = 777777;
		assertEquals(id,this.testUser.getUserID());
		assertNotEquals(wrongID,this.testUser.getUserID());
	}
	
	@Test
	public void testEmailAddress()
	{
		String mail = "bob@school.ca";
		assertEquals(mail,this.testUser.getEmail());
	}
	
	@Test
	public void testType()
	{
		String type = "student";
		assertEquals(type,this.testUser.getType());
	}
}
