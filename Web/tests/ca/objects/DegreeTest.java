package ca.objects;

import static org.junit.Assert.assertNotNull;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import ca.objects.Degree;


public class DegreeTest 
{
	Degree testDegree;
	
	@BeforeClass
	public static void setupBeforeClass() throws Exception
	{
		System.out.println("-------------------------------");
		System.out.println("Running Degree Tests");
	}
	
	@AfterClass
	public static void tearDownAfterClass() throws Exception
	{
		System.out.println("Finished running Degree Tests");
		System.out.println("--------------------------------");
	}
	
	@Before
	public void setUp() throws Exception
	{
		this.testDegree = new Degree("Computer Science (Honor)", "Computer Science", "Coop",120);
	}
	@After
	public void tearDown() throws Exception
	{
		this.testDegree = null;
	}
	

	@Test
	public void testObject()
	{
		assertNotNull(testDegree);
	}
	
}
