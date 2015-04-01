package ca.servlets;

import static org.junit.Assert.*;

import java.sql.Connection;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import ca.logic.ChangePasswordLogic;
import ca.persistence.UserModel;

public class ChangePasswordTest 
{
	
	Connection connection;

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
	}

	@After
	public void tearDown() throws Exception 
	{
	}

	@Test
	public final void testChangingPasswords() 
	{

		//bob
		String pass = UserModel.getUserPasswordByID(7651245);
		assertEquals(pass, "4350");
		ChangePasswordLogic changePasswordLogic = new ChangePasswordLogic("newP", pass, 7651245);
		changePasswordLogic.changePassword();
		
		String newPass = UserModel.getUserPasswordByID(7651245);
		assertEquals(newPass, "newP");
		
		changePasswordLogic = new ChangePasswordLogic("4350", newPass, 7651245);
		changePasswordLogic.changePassword();
		
	}
	
	@Test
	public final void testRejectedPasswordChange(){
		
		String pass = UserModel.getUserPasswordByID(7651245);
		assertEquals(pass, "4350");
		ChangePasswordLogic changePasswordLogic = new ChangePasswordLogic("newP!$$#!^$%^&&(()*&^", pass, 7651245); //too many chars
		changePasswordLogic.changePassword();
		
		String newPass = UserModel.getUserPasswordByID(7651245);
		assertEquals(newPass, "4350");		
		
		
		
	}
}


