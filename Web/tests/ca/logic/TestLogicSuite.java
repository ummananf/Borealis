package ca.logic;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;

@RunWith(Suite.class)
@Suite.SuiteClasses({
	ChangeEmailLogicTest.class, 
	ChangeNameLogicTest.class,
	ChangePasswordLogicTest.class,
	CourseSelectionLogicTest.class,
	LoginLogicTest.class,
	RegistrationLogicTest.class,
	TermLogicTest.class
	})
public class TestLogicSuite {
  //nothing
}
