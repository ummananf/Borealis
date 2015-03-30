package ca.logic;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import ca.persistence.UserModel;
import ca.validate.EmailValidator;


public class ChangeEmailLogicTest 
{	
	
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
	}
	@After
	public void tearDown() throws Exception
	{
	}
	
	
	@Test
	public void testEmailValidator()
	{
		assertTrue(EmailValidator.validate("test@school.ca"));
		assertTrue(EmailValidator.validate("test.mctester@mytestschool.com"));
		assertFalse(EmailValidator.validate("test0~^^1@school.ca"));
		assertFalse(EmailValidator.validate("!!!!!!!!!!!!"));
		assertFalse(EmailValidator.validate("Isthis____abademail%?@school.ca"));
	}
	
	@Test
	public void testUpdateUserEmail(){
		
		assertTrue(UserModel.updateUserEmail(7651245, "newEmail@school.ca")); //bobs ID
		assertFalse(UserModel.updateUserEmail(-1, "invalidID@school.ca")); //unregistered ID
		
	}
	
	@Test public void testTypicalCase(){
		
		assertTrue(EmailValidator.validate("test@school.ca")); //valid Email
		assertTrue(UserModel.updateUserEmail(7651245, "test@school.ca")); //bobs ID
		
	}
	
}
	
	
	