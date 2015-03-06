package ca.persistence;

import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.jdbc.ScriptRunner;


// this class makes it easier to execute db statement and retrieve data
// without having to deal with opening and closing connections, statements, results etc.
// uses a ResultSetConverter from an external lib to convert a ResultSet to a ResultSet array.


public class DB {

	// / Initialize structure and items of database if not already done so. This
	// should only be done the first time
	// / running on a new system, can comment the call to this method after done
	// so.
	public static void init() {
		Connection connection = ConnectionManager.getConnection();

		if (connection != null) {
			// Execute sql script to initialze DB
			ScriptRunner runner = new ScriptRunner(connection);
			InputStreamReader reader = null;

			try {
				reader = new InputStreamReader(
						DB.class.getResourceAsStream("../sqlScripts/borealisInit.sql"));

				runner.runScript(reader);

				reader.close();

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				System.out.println("Closing the connection.");
				if (connection != null)
					ConnectionManager.closeConnection(connection);
			}
		}
	}

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
	public static ResultSet executeQuery(String query) {
		Statement statement = null;
		ResultSet resultSet = null;
		Connection connection = ConnectionManager.getConnection();

		try {
			statement = connection.createStatement();
			
			resultSet = statement.executeQuery(query);
			statement.close();
			ConnectionManager.closeConnection(connection);
		} catch (SQLException e) {
			System.out.println("DB ERROR!!! executeQuery");
			System.out.println("SQLException: " + e.getMessage());
			System.out.println("SQLState: " + e.getSQLState());
			System.out.println("VendorError: " + e.getErrorCode());
		}

		return resultSet;
	}

	public static List<Map<String, Object>> getData(String query) {
		// TODO Auto-generated method stub
		List<Map<String, Object>> resultList = new ArrayList<Map<String, Object>>();
		Map<String, Object> row = null;
		
 		ResultSet data = null; 
		Connection connection = ConnectionManager.getConnection();
		
		try {
			Statement statement = connection.createStatement();
			data = statement.executeQuery(query);
			
			ResultSetMetaData metaData = data.getMetaData();
			Integer col = metaData.getColumnCount();
			
			while (data.next()){
				row = new HashMap<String, Object>();
				for (int i = 1; i <= col; i++) {
					row.put(metaData.getColumnName(i), data.getObject(i));
				}
				resultList.add(row);
			}

			statement.close();
		} catch (SQLException e) {
			System.out.println("error reading user data from DB");
			e.printStackTrace();
		}
		
		ConnectionManager.closeConnection(connection);
		
		return resultList;
	}

}
