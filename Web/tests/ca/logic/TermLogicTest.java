package ca.logic;

import static org.junit.Assert.assertTrue;

import java.sql.Date;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import ca.objects.Term;

public class TermLogicTest {

	@BeforeClass
	public static void setupBeforeClass() throws Exception
	{
		System.out.println("------------------------");
		System.out.println("Testing Term Logic");
	}
	
	@AfterClass
	public static void tearDownAfterClass() throws Exception
	{
		System.out.println("Done Testing Term Logic");
		System.out.println("--------------------------------");
	}
	
	
	@Test
	public void testGetCurrentTerm() 
	{
		Term currTerm = TermLogic.getTerm(new Date(System.currentTimeMillis()));
		assertTrue(currTerm.getTermID().equals("Winter2015"));
	}
}
