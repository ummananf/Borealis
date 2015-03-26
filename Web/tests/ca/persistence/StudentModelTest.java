package ca.persistence;

import static org.junit.Assert.*;

import java.util.ArrayList;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import ca.objects.Enrollment;
import ca.objects.Section;

public class StudentModelTest 
{
	
	String queryInsertStudent;
	String queryDeleteStudent;
	String queryInsertEnrollment;
	String queryDeleteEnrollment;

	@Before
	public void setUp() throws Exception 
	{	
		queryInsertStudent = "INSERT INTO Users VALUES (99, 'somestudent', 'p', 'qwe@qwe.qwe', 'john', 'johnson','computer science', 'student');";
		queryDeleteStudent = "DELETE FROM Users WHERE userID=99;";
		
		queryInsertEnrollment = "INSERT INTO Enrolled VALUES (99, '10000', 3.5);";
		queryDeleteEnrollment = "DELETE FROM Enrolled WHERE userID=99;";
		
		
		DB.execute(queryInsertStudent);
		DB.execute(queryInsertEnrollment);
	}
	@After
	public void tearDown() throws Exception 
	{
		DB.execute(queryDeleteEnrollment);
		DB.execute(queryDeleteStudent);
		
	}
	
	@Test
	public final void testGetCompletedCourses() 
	{
		ArrayList<Enrollment> enrols = StudentModel.getCompletedEnrollments(99);
		assertTrue(enrols.size() == 1);
		assertTrue(enrols.get(0).getSection() != null);
	}
	@Test
	public void testEnrollmentCID()
	{
		ArrayList<Enrollment> enrols = StudentModel.getCompletedEnrollments(99);
		assertTrue(enrols.size() == 1);
		assertTrue(enrols.get(0).getSection().getCourseID().equals("COMP1010"));
	}
	
	

}
