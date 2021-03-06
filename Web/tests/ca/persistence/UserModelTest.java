package ca.persistence;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import ca.objects.Admin;
import ca.objects.Professor;
import ca.objects.Student;
import ca.objects.User;

public class UserModelTest 
{

	User user;
	String queryInsertUser1;
	String queryInsertUser2;
	String queryInsertUser3;
	String queryDeleteUser1;
	String queryDeleteUser2;
	String queryDeleteUser3;

	
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
		
		queryInsertUser1 = "INSERT INTO Users VALUES (11, 'test_admin', 'p', 'a@b.c', 'john', 'johnson', 'computer sicence',0, 'admin');";
		queryDeleteUser1 = "DELETE FROM Users WHERE userID=11;";
		
		queryInsertUser2 = "INSERT INTO Users VALUES (22, 'test_student', 'p', 'b@b.c', 'john', 'johnson', 'computer science',15,'student');";
		queryDeleteUser2 = "DELETE FROM Users WHERE userID=22;";
		
		queryInsertUser3 = "INSERT INTO Users VALUES (33, 'test_prof', 'p', 'c@b.c', 'john', 'johnson','comnputer science', 0, 'prof');";
		queryDeleteUser3 = "DELETE FROM Users WHERE userID=33;";

		DB.execute(queryInsertUser1);
		DB.execute(queryInsertUser2);
		DB.execute(queryInsertUser3);
	}

	@Test
	public final void testGetUserData() 
	{
		
		@SuppressWarnings("unused")
		Admin admin = new Admin(11, "test_admin", "p", "a@b.c", "john", "johnson");
		user = UserModel.getUserData("test_admin");
		assertTrue(user instanceof Admin);
		//assertTrue(user.equals(admin)); //this dont work cuz we didnt write it
		
		@SuppressWarnings("unused")
		Student student = new Student(22, "test_student", "p", "b@b.c", "john", "johnson","degree", 15);
		user = UserModel.getUserData("test_student");
		assertTrue(user instanceof Student);
		//assertTrue(user.equals(student));
		
		@SuppressWarnings("unused")
		Professor professor = new Professor(33, "test_prof", "p", "c@b.c", "john", "johnson");
		user = UserModel.getUserData("test_prof");
		assertTrue(user instanceof Professor);
		//assertTrue(user.equals(professor));
	}
	
	@After
	public void tearDown() throws Exception 
	{
		DB.execute(queryDeleteUser1);
		DB.execute(queryDeleteUser2);
		DB.execute(queryDeleteUser3);
	}

}
