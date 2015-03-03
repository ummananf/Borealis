package ca.persistence;

import static org.junit.Assert.*;

import java.util.ArrayList;

import org.junit.Before;
import org.junit.Test;

import ca.objects.Prereq;

public class CourseModelTest {

	@Before
	public void setUp() throws Exception {
	}

	@Test
	public final void testGetPrereqs() {
		
		ArrayList<Prereq> prereqs = CourseModel.getPrereqs("COMP1010");
		assert(prereqs.size() == 1);
		Prereq prereq = new Prereq("COMP1010", "COMP1020", 2.0f);
		assert(prereqs.get(0).equals(prereq));
	}

}
