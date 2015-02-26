package ca.logic;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

import ca.objects.User;

public class Profile_BOTest {
	
	User existingUser;
	User nonExistingUser1;
	User nonExistingUser2;
	User nonExistingUser3;

	@Before
	public void setUp() throws Exception {
		
		/* existing user taken from the database 
		 * we shouldn't remove it and let is act as a dummy for the test. */
		existingUser = new User("student1", "password");
		
		// non existing users with similar names and passwords/
		nonExistingUser1 = new User("student1", "passworld");
		nonExistingUser2 = new User("studentl", "password");
		nonExistingUser3 = new User("somename", "somepassword");
	}

	@Test
	public final void testIsValid() {
		Profile_BO pBO;
		
		// test with existing user
		pBO = new Profile_BO(existingUser);
		assertTrue(pBO.isValid());
		
		// test with non existing users
		pBO = new Profile_BO(nonExistingUser1);
		assertFalse(pBO.isValid());
		pBO = new Profile_BO(nonExistingUser2);
		assertFalse(pBO.isValid());
		pBO = new Profile_BO(nonExistingUser3);
		assertFalse(pBO.isValid());
		
	}

}
