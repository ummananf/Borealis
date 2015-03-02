package ca.logic;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

public class UserLogicTest {
	
	LoginLogic loginLogic;
	
	@Before
	public void setUp() throws Exception {
		
		loginLogic = new LoginLogic();
	}

	@Test
	public final void testGetUserIfValid() {
		
		// test with existing user
		assertNotNull(loginLogic.getUserIfValid("student1", "password"));
		
		// test with non existing users
		assertNull(loginLogic.getUserIfValid("student1", "passworld"));
		assertNull(loginLogic.getUserIfValid("studentl", "password"));
		assertNull(loginLogic.getUserIfValid("somename", "somepassword"));
		assertNull(loginLogic.getUserIfValid("password", "student1"));
	}

}
