package ca.persistence;

import static org.junit.Assert.*;

import java.util.ArrayList;

import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import ca.objects.Prereq;

public class CourseModelTest 
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
	public final void testGetPrereqs() 
	{
		ArrayList<Prereq> prereqs = CourseModel.getPrereqs("COMP1020");
		assertEquals(1, prereqs.size());
		assertEquals("COMP1010", prereqs.get(0).getRequiredCourseID());
	}

}
