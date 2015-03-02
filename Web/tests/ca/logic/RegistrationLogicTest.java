package ca.logic;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

public class RegistrationLogicTest {
	

	@Before
	public void setUp() throws Exception {
	}

	@Test
	public final void testMeetsPrereqs() {
		RegistrationLogic regLogic = new RegistrationLogic();
		
		// has one prereq
		assertTrue(regLogic.meetsPrereqs(2, "COMP1020"));
		assertFalse(regLogic.meetsPrereqs(3, "COMP1020")); //user doesnt exist
		
		// has no prereqs
		assertTrue(regLogic.meetsPrereqs(2, "COMP1010"));
		
		// Courses don't exist
		assertTrue(regLogic.meetsPrereqs(2, "COMP2000"));
	}

}
