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
