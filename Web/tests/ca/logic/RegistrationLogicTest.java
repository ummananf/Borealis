package ca.logic;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

public class RegistrationLogicTest 
{
	RegistrationLogic regLogic;
	
	@BeforeClass
	public static void setupBeforeClass() throws Exception
	{
		System.out.println("------------------------");
		System.out.println("Testing Registration Logic");
	}
	
	@AfterClass
	public static void tearDownAfterClass() throws Exception
	{
		System.out.println("Done Testing Registration Logic");
		System.out.println("--------------------------------");
	}
	
	@Before
	public void setUp() throws Exception 
	{
		regLogic = new RegistrationLogic();
	}
	@After
	public void tearDown() throws Exception
	{
		
	}
	@Test
	public void testMeetsPrereqs() 
	{
		assertTrue(regLogic.meetsPrereqs(7651245, "COMP1020"));
	}
	@Test
	public void testIfUserNotExists()
	{
		assertFalse(regLogic.meetsPrereqs(3, "COMP1020")); //user doesnt exist
	}
	
	@Test
	public void testNoPreReqs()
	{
		assertTrue(regLogic.meetsPrereqs(7651245, "COMP1010"));
	}
	
	@Test
	public void testCourseNotExist()
	{
		assertTrue(regLogic.meetsPrereqs(7651245, "COMP2000"));
	}

}
