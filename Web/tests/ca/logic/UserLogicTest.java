package ca.logic;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

public class UserLogicTest {
	
//	User existingUser;
//	User nonExistingUser1;
//	User nonExistingUser2;
//	User nonExistingUser3;

	@Before
	public void setUp() throws Exception {
		
//		/* existing user taken from the database 
//		 * we shouldn't remove it and let is act as a dummy for the test. */
//		existingUser = new User("student1", "password");
//		
//		// non existing users with similar names and passwords/
//		nonExistingUser1 = new User("student1", "passworld");
//		nonExistingUser2 = new User("studentl", "password");
//		nonExistingUser3 = new User("somename", "somepassword");
	}

	@Test
	public final void testIsValid() {
		UserLogic uLogic = new UserLogic();
		
		// test with existing user
		assertNotNull(uLogic.getUserIfValid("student1", "password"));
		
		// test with non existing users
		assertNull(uLogic.getUserIfValid("student1", "passworld"));
		assertNull(uLogic.getUserIfValid("studentl", "password"));
		assertNull(uLogic.getUserIfValid("somename", "somepassword"));
		assertNull(uLogic.getUserIfValid("password", "student1"));
	}

}
