package ca.persistence;

import static org.junit.Assert.*;

import java.util.ArrayList;

import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import ca.objects.Degree;
import ca.objects.Enrollment;
import ca.objects.Prereq;

public class EnrollmentModelTest 
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
	public final void testIntegrationEnrollmentRecord() 
	{
		ArrayList<Enrollment> en = EnrollmentModel.getEnrollmentRecord( 7651245 ); //bob
		assertNotNull(en);
		assertNotEquals("", en.get(0));
		
		ArrayList<Enrollment> enTest = EnrollmentModel.getEnrollmentRecord( -1 ); 
		assertTrue(enTest.isEmpty());
		
	}
	
	@Test
	public final void testIntegrationDetailedEnrollment(){
		
		ArrayList<Enrollment> en = EnrollmentModel.getDetailedEnrollmentRecords( 7651245 ); //bob
		assertNotNull(en);
		assertNotEquals("", en.get(0));
		
		ArrayList<Enrollment> enTest = EnrollmentModel.getDetailedEnrollmentRecords( -1 ); 
		assertTrue(enTest.isEmpty());
	}
	
	

}
