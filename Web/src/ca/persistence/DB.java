package ca.persistence;



import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.apache.ibatis.jdbc.ScriptRunner;

import com.fdsapi.ResultSetConverter;

// this class makes it easier to execute db statement and retrieve data
// without having to deal with opening and closing connections, statements, results etc.
// uses a ResultSetConverter from an external lib to convert a ResultSet to a Object[][] array.

public class DB {
	
	/// Initialize structure and items of database if not already done so. This should only be done the first time
	/// running on a new system, can comment the call to this method after done so.
	public static void init()
	{	
		Connection connection = ConnectionManager.getConnection();
		
		if (connection != null) {
			// Execute sql script to initialze DB
			ScriptRunner runner = new ScriptRunner(connection);
			InputStreamReader reader = null;
			
			try {
				reader = new InputStreamReader(DB.class.getResourceAsStream("../sqlScripts/borealisInit.sql"));
				
				runner.runScript(reader);
				
				reader.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
			    System.out.println("Closing the connection.");
			    if (connection != null) ConnectionManager.closeConnection(connection);
			}
		}
	}
	
	
	/// This should be refactored somewhere..
	/*
	public static String getUserData(String username)
	{
		String query = "SELECT password FROM Users WHERE username = '" + username + "';";
		Object[][] data = null;
		String password = "";
		
		data = executeQuery(query);
		if(data != null)
		{
			password = data[0][0].toString();
			System.out.println("password retrieved: " + password);
		}

		return password;
	}*/
	
	// execute regular queries: create, insert, etc.
	public static boolean execute(String query) {
		
		boolean success = false;
		Statement statement = null;
		
		Connection connection = ConnectionManager.getConnection();
		
		
		try {
			statement = connection.createStatement();
			success = statement.execute(query);
			statement.close();
			ConnectionManager.closeConnection(connection);
		} catch (SQLException e) {
			System.out.println("DB ERROR!!! execute");
		    System.out.println("SQLException: " + e.getMessage());
		    System.out.println("SQLState: " + e.getSQLState());
		    System.out.println("VendorError: " + e.getErrorCode());
		}
		
		return success;
	}
	
	// execute queries that should return a result (select).
	public static Object[][] executeQuery(String query) {
		
		Object[][] data = null;
		Statement statement = null;
		ResultSet resultSet = null;
		Connection connection = ConnectionManager.getConnection();	
		
		try {
			statement = connection.createStatement();
			resultSet = statement.executeQuery(query);
			data = new ResultSetConverter(resultSet).getResultSet();
			statement.close();
			ConnectionManager.closeConnection(connection);
		} catch (SQLException e) {
			System.out.println("DB ERROR!!! executeQuery");
		    System.out.println("SQLException: " + e.getMessage());
		    System.out.println("SQLState: " + e.getSQLState());
		    System.out.println("VendorError: " + e.getErrorCode());
		}
		
		return data;
	}

}
