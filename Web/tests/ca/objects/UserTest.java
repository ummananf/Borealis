package ca.objects;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import ca.objects.User;;

public class UserTest 
{
	User testUser;
	
	@BeforeClass
	public static void setupBeforeClass() throws Exception
	{
		System.out.println("-------------------------------");
		System.out.println("Running User Test");
	}
	
	@AfterClass
	public static void tearDownAfterClass() throws Exception
	{
		System.out.println("Finished running User Test");
		System.out.println("--------------------------------");
	}
	
	@Before
	public void setUp() throws Exception
	{
		this.testUser = new User(123456, "henry", "123456", "henry@gmail.com", "henry", "haul", "student" );
	}
	
	@After
	public void tearDown() throws Exception
	{
		this.testUser = null;
	}
	
	@Test
	public void testObject()
	{
		assertNotNull(testUser);
	}
	
	@Test
	public void testGetUserID()
	{
		assertEquals(123456,testUser.getUserID());
	}
	
	@Test
	public void testSetUserID()
	{
		testUser.setUserID(555555);
		assertEquals(555555,testUser.getUserID());
	}
	
	@Test
	public void testGetUserName()
	{
		assertEquals("henry", testUser.getUsername());
	}
	
	@Test
	public void testSetInvalidUserName()
	{
		testUser.setUsername("11hello");
		assertNotEquals("11hello",testUser.getUsername());
	}
	
	@Test
	public void testSetValidUserName()
	{
		testUser.setUsername("Johnson");
		assertEquals("Johnson",testUser.getUsername());
	}
	
	@Test
	public void testGetPassword()
	{
		assertEquals("123456",testUser.getPassword());
	}
	
	@Test
	public void testSetInvalidPassword()
	{
		testUser.setPassword("1");
		assertNotEquals("1",testUser.getPassword());
		assertEquals("123456",testUser.getPassword());
	}
	
	@Test
	public void testSetValidPassword()
	{
		testUser.setPassword("555464");
		assertEquals("555464",testUser.getPassword());
	}
	
	@Test
	public void testGetEmailAddress()
	{
		assertEquals("henry@gmail.com", testUser.getEmail());
	}
	
	@Test
	public void testSetInvalidEmailAddress()
	{
		testUser.setEmail("kkk@e@ee@@.com");
		assertNotEquals("kkk@e@ee@@.com",testUser.getEmail());
		
		testUser.setEmail("@@jakdf.com");
		assertNotEquals("@@jakdf.com", testUser.getEmail());
		
		testUser.setEmail("eeekdkdaaaa");
		assertNotEquals("eeekdkdaaaa",testUser.getEmail());
	}
	
	@Test
	public void testSetValidEmailAddress()
	{
		testUser.setEmail("ke@hotmail.com");
		assertEquals("ke@hotmail.com",testUser.getEmail());
	}
	
	@Test
	public void testGetFirstName()
	{
		assertEquals("henry", testUser.getFirstName());
	}
	
	@Test
	public void testSetInvalidFirstName()
	{
		testUser.setFirstName("222");
		assertNotEquals("222",testUser.getFirstName());
		assertEquals("henry",testUser.getFirstName());
	}
	
	@Test
	public void testSetValidFirstName()
	{
		testUser.setFirstName("light");
		assertEquals("light",testUser.getFirstName());
	}
	
	@Test
	public void testGetLastName()
	{
		assertEquals("haul",testUser.getLastName());
	}
	
	@Test
	public void testSetInvalidLastName()
	{
		testUser.setLastName("fe,.");
		assertNotEquals("fe,.",testUser.getLastName());
	}
	
	@Test
	public void testSetValidLastName()
	{
		testUser.setLastName("joss");
		assertEquals("joss",testUser.getLastName());
	}
}
