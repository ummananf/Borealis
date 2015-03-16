package ca.persistence;

import static org.junit.Assert.*;

import java.util.ArrayList;

import org.junit.Before;
import org.junit.Test;

import ca.objects.Prereq;

public class CourseModelTest 
{

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
