package ca.persistence;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.fdsapi.ResultSetConverter;

// this class makes it easier to execute db statement and retrieve data
// without having to deal with opening and closing connections, statements, results etc.
// uses a ResultSetConverter from an external lib to convert a ResultSet to a Object[][] array.

public class DB {
	
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
