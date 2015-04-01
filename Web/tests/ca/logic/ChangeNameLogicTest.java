package ca.logic;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import ca.persistence.UserModel;
import ca.validate.EmailValidator;
import ca.validate.UsernameValidator;


public class ChangeNameLogicTest 
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
	public void testUsernameValidator()
	{
		assertTrue(UsernameValidator.validate("bob"));
		assertTrue(UsernameValidator.validate("SuperNameCompiledOfNoSpaces"));
		assertFalse(UsernameValidator.validate("!bob!"));
		assertFalse(EmailValidator.validate("!!!!!!!!!!!!"));
		assertFalse(EmailValidator.validate("Isthis____bad"));
	}
	
	@Test
	public void testUpdateUserName(){
		
		assertTrue(UserModel.updateUserName(7651245, "bobby")); //bobs ID
		assertFalse(UserModel.updateUserName(-1, "bobbyWrongs")); //unregistered ID
		assertTrue(UserModel.updateUserName(7651245, "bob")); //revert to bob
		
	}
	
	@Test public void testTypicalCase(){
		
		assertTrue(UsernameValidator.validate("bobname")); //valid Email
		assertTrue(UserModel.updateUserName(7651245, "bobname")); //bobs ID
		assertTrue(UserModel.updateUserName(7651245, "bob")); //revert to bob
		
	}
	
}
	
	
	