package ca.persistence;

import static org.junit.Assert.*;

import java.sql.Connection;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

public class ConnectionManagerTest 
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
	public final void testGetConnection() 
	{
		connection = ConnectionManager.getConnection();
		assertNotNull(connection);
	}

	@Test
	public final void testCloseConnection() 
	{
		ConnectionManager.closeConnection(connection);
		assertNull(connection);
	}

}
