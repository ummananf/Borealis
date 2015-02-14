package ca.persistence;

import java.sql.*;
import java.util.*;


public class ConnectionManager {

   private static Connection connection = null;
   private static String jdbcUrl;
         
   public static Connection getConnection() {
	   
	   // Read RDS Connection Information from the Environment
	   String dbName = System.getProperty("RDS_DB_NAME");
	   String userName = System.getProperty("RDS_USERNAME");
	   String password = System.getProperty("RDS_PASSWORD");
	   String hostname = System.getProperty("RDS_HOSTNAME");
	   String port = System.getProperty("RDS_PORT");
	   
	   jdbcUrl = "jdbc:mysql://" + hostname + ":" +
			    port + "/" + dbName + "?user=" + userName + "&password=" + password;
	   
	   // Load driver
	   try {
		    Class.forName("com.mysql.jdbc.Driver");
		  } catch (ClassNotFoundException e) {
		    throw new RuntimeException("Cannot find the driver in the classpath!", e);
		  }
	   
	   // Try to connect to remote RDS
	   try {
		    // Create connection to RDS instance
		   connection = DriverManager.getConnection(jdbcUrl);
	   } catch (SQLException ex) {
		    // handle any errors
		    System.out.println("SQLException: " + ex.getMessage());
		    System.out.println("SQLState: " + ex.getSQLState());
		    System.out.println("VendorError: " + ex.getErrorCode());
	   }
	   
	   // Try to connect to local db (if previous code failed)
	   if (connection == null) {
		   try {
			   connection = DriverManager.getConnection(
					   "jdbc:mysql://localhost:3306/borealisDB", "user", "comp4350");
		   } catch (SQLException ex) {
			   
			    // handle any errors
			    System.out.println("SQLException: " + ex.getMessage());
			    System.out.println("SQLState: " + ex.getSQLState());
			    System.out.println("VendorError: " + ex.getErrorCode());
		   }
	   }
    
      return connection;
   }
   
   public static void closeConnection(Connection con)
   {
	   connection = null;
	   
	   try
	   {
		   if(null != con)
		   {
			   con.close();
			   con = null;
		   }
	   }
	   catch (SQLException ex) {
		    // handle any errors
		    System.out.println("SQLException: " + ex.getMessage());
		    System.out.println("SQLState: " + ex.getSQLState());
		    System.out.println("VendorError: " + ex.getErrorCode());
	   }
   }
   
   public static PreparedStatement getPrepStatement(Connection con, String sql)
   {
	   PreparedStatement prepStatement = null;
	   try
	   {
		   prepStatement = con.prepareStatement(sql);
	   }
	   catch(SQLException e)
	   {
		   e.printStackTrace();
	   }
	   return prepStatement;   
   }
   
   public static Statement getStatement(Connection con)
   {
	   Statement statement = null;
	   try
	   {
		   statement = con.createStatement();
	   }
	   catch (SQLException e)
	   {
		   e.printStackTrace();
	   }
	   return statement;
   }
   
   public static void closeStatement(Statement statement)
   {
	   try
	   {
		   if(null != statement)
		   {
			   statement.close();
			   statement = null;
		   }
	   }
	   catch (SQLException e)
	   {
		   e.printStackTrace();
	   }
   }
   
   public static ResultSet executeQuery(Statement statement, String sql)
   {
	   ResultSet resultSet = null;
	   try
	   {
		   resultSet = statement.executeQuery(sql);
	   }
	   catch (SQLException e)
	   {
		   e.printStackTrace();
	   }
	   return resultSet;
   }
   
   public static void closeResultSet(ResultSet resultSet)
   {
	   try
	   {
		   if(resultSet != null)
		   {
			   resultSet.close();
			   resultSet = null;
		   }
	   }
	   catch (SQLException e)
	   {
		   e.printStackTrace();
	   }
   }
   
}
