package ca.persistence;

import static org.junit.Assert.*;

import java.util.ArrayList;

import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import ca.objects.Degree;
import ca.objects.Prereq;

public class CourseSelectionModelTest 
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

	@Test
	public final void testIntegrationDegrees() 
	{
		ArrayList<Degree> testDegrees = CourseSelectionModel.getDegrees( "Winter2015" );
		assertNotNull(testDegrees);
		assertNotEquals("", testDegrees.get(0));
		
	}

}
