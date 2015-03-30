package ca.logic;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;


public class ChangePasswordLogicTest 
{	
	ChangePasswordLogic theChangePasswordLogic;
	
	@BeforeClass
	public static void setupBeforeClass() throws Exception
	{
		System.out.println("-------------------------------");
		System.out.println("Running change password logic tests");
	}
	
	@AfterClass
	public static void tearDownAfterClass() throws Exception
	{
		System.out.println("Finished running change password logic tests");
		System.out.println("--------------------------------");
	}
	
	@Before
	public void setUp() throws Exception
	{

	}
	@After
	public void tearDown() throws Exception
	{
	}
	
	
	@Test
	public void testValidPasswordChange()
	{
		this.theChangePasswordLogic = new ChangePasswordLogic("123456","123456789",3);
		assertTrue(this.theChangePasswordLogic.changePassword());
		this.theChangePasswordLogic = new ChangePasswordLogic("123456789","123456",3);
		assertTrue(this.theChangePasswordLogic.changePassword());
	}
	
	@Test
	public void testInValidPasswordChange()
	{
		this.theChangePasswordLogic = new ChangePasswordLogic("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!","12345",3);
		assertFalse(this.theChangePasswordLogic.changePassword());
	}
}
