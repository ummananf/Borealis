package ca.logic;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

public class UserLogicTest {
	

	@Before
	public void setUp() throws Exception {
	}

	@Test
	public final void testGetUserIfValid() {
		LoginLogic loginLogic = new LoginLogic();
		
		// test with existing user
		assertNotNull(loginLogic.getUserIfValid("student1", "password"));
		
		// test with non existing users
		assertNull(loginLogic.getUserIfValid("student1", "passworld"));
		assertNull(loginLogic.getUserIfValid("studentl", "password"));
		assertNull(loginLogic.getUserIfValid("somename", "somepassword"));
		assertNull(loginLogic.getUserIfValid("password", "student1"));
	}

}
