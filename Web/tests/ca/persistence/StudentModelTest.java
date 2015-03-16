package ca.persistence;

import static org.junit.Assert.*;

import java.sql.Date;
import java.util.ArrayList;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import ca.objects.Enrollment;

public class StudentModelTest {
	
	String queryInsertStudent;
	String queryDeleteStudent;
	String queryInsertEnrollment;
	String queryDeleteEnrollment;

	@Before
	public void setUp() throws Exception {
		
		queryInsertStudent = "INSERT INTO Users VALUES (99, 'somestudent', 'p', 'qwe@qwe.qwe', 'john', 'johnson', 'student');";
		queryDeleteStudent = "DELETE FROM Users WHERE userID=99;";
		
		queryInsertEnrollment = "INSERT INTO Enrolled VALUES (99, 'A01', 'COMP1010', '2014-09-01', 3.5);";
		queryDeleteEnrollment = "DELETE FROM Enrolled WHERE userID=99;";
		
		DB.execute(queryDeleteStudent);
		DB.execute(queryDeleteEnrollment);
		
		DB.execute(queryInsertStudent);
		DB.execute(queryInsertEnrollment);
	}

	@Test
	public final void testGetCompletedCourses() {
		ArrayList<Enrollment> enrollment = StudentModel.getCompletedCourses(99);
		assertTrue(enrollment.size() == 1);
		Enrollment en = new Enrollment(99, "10000","A01", "COMP1010", Date.valueOf("2014-09-01"), 3.5f);
		//assertTrue(enrollment.get(0).equals(en));
	}
	
	@After
	public void tearDown() throws Exception {
		DB.execute(queryDeleteStudent);
		DB.execute(queryDeleteEnrollment);
	}

}
