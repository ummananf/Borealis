package ca.persistence;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;

@RunWith(Suite.class)
@Suite.SuiteClasses({
	ConnectionManagerTest.class,
	CourseModelTest.class,
	CourseSelectionModelTest.class,
	EnrollmentModelTest.class,
	SectionModelTest.class,
	StudentModelTest.class,
	UserModelTest.class
	})
public class TestPersistenceSuite {
  //nothing
}