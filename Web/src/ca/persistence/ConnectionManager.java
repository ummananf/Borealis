package ca.persistence;

import java.sql.*;

public class ConnectionManager {

	public static Connection getConnection() {
		
		Connection connection = null;
		
		// Read RDS dbName; test if we're connected to the RDS
		String dbName = System.getProperty("RDS_DB_NAME");
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			throw new RuntimeException(
					"Cannot find the driver in the classpath!", e);
		}
		 
		// Load driver
		if(dbName != null) {
			// Read the rest of the RDS Connection Information from the Environment
			String userName = System.getProperty("RDS_USERNAME");
			String password = System.getProperty("RDS_PASSWORD");
			String hostname = System.getProperty("RDS_HOSTNAME");
			String port = System.getProperty("RDS_PORT");

			String jdbcUrl = "jdbc:mysql://" + hostname + ":" + port + "/" + dbName
					+ "?user=" + userName + "&password=" + password;
	
			// Try to connect to remote RDS
			try {
				// Create connection to RDS instance
				connection = DriverManager.getConnection(jdbcUrl);
			} catch (SQLException ex) {
				// handle any errors
				System.out.println("RDS ConnectionManager:getConnection Connection error!");
				System.out.println("RDS SQLException: " + ex.getMessage());
				System.out.println("RDS SQLState: " + ex.getSQLState());
				System.out.println("RDS VendorError: " + ex.getErrorCode());
			}
		}
		else {
			// Try to connect to local db (if previous code failed)
			if (connection == null) {
				try {
			//		 connection = DriverManager.getConnection(
			//		 "jdbc:mysql://localhost:3306/borealisDB", "user",
			//		 "comp4350");
	
					connection = DriverManager
							.getConnection("jdbc:mysql://localhost:3306/MySQL",
									"root", "mysql");
				} catch (SQLException ex) {
	
					// handle any errors
					System.out.println("Local ConnectionManager:getConnection Connection error!");
					System.out.println("Local SQLException: " + ex.getMessage());
					System.out.println("Local SQLState: " + ex.getSQLState());
					System.out.println("Local VendorError: " + ex.getErrorCode());
				}
			}
		}

		return connection;
	}

	public static void closeConnection(Connection con) {

		try {
			if (null != con) {
				con.close();
				con = null;
			}
		} catch (SQLException ex) {
			// handle any errors
			System.out.println("ConnectionManager:closeConnection Error!");
			System.out.println("SQLException: " + ex.getMessage());
			System.out.println("SQLState: " + ex.getSQLState());
			System.out.println("VendorError: " + ex.getErrorCode());
		}
	}

}
