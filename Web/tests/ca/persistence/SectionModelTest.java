package ca.persistence;

import static org.junit.Assert.*;

import java.util.ArrayList;

import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import ca.objects.Section;

public class SectionModelTest 
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
	public final void testIntegrationSectionByCourse() 
	{
		ArrayList<Section> sec = SectionModel.getSectionByCourseId("COMP1010");
		assertNotNull(sec);
		assertNotEquals("", sec.get(0));
		
		ArrayList<Section> secTest =  SectionModel.getSectionByCourseId( "BADSECTION" ); 
		assertTrue(secTest.isEmpty());
		
	}
	
	@Test
	public final void testIntegrationSectionByCRN(){
		
		Section sec =  SectionModel.getSectionByCRN("10000");
		assertNotNull(sec);
		assertNotEquals("", sec);
		
		Section secTest =  SectionModel.getSectionByCRN("-1");
		assertNull(secTest);
		
	}
	
	@Test
	public final void testIntegrationSectionsByDeptAndTerm(){
		
		ArrayList<Section> sec =  SectionModel.getSectionsByDeptAndTerm("Computer Science", "Winter2015");
		assertNotNull(sec);
		assertNotEquals("", sec.get(0));
		
		ArrayList<Section> secTest =   SectionModel.getSectionsByDeptAndTerm("!!!!!", "!!!2015");
		assertTrue(secTest.isEmpty());		
		
	}
	
	

}


