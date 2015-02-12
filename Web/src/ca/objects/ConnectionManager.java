package ca.objects;

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
	   
	   try {
		    System.out.println("Loading driver...");
		    Class.forName("com.mysql.jdbc.Driver");
		    System.out.println("Driver loaded!");
		  } catch (ClassNotFoundException e) {
		    throw new RuntimeException("Cannot find the driver in the classpath!", e);
		  }
	   
	   try {
		    // Create connection to RDS instance
		   connection = DriverManager.getConnection(jdbcUrl);
	   } catch (SQLException ex) {
		    // handle any errors
		    System.out.println("SQLException: " + ex.getMessage());
		    System.out.println("SQLState: " + ex.getSQLState());
		    System.out.println("VendorError: " + ex.getErrorCode());
	   }
	   
	   if (connection == null) {
		   System.out.println("trying local connection...");
		   // connect to local db if previous connection failed
		   try {
			   connection = DriverManager.getConnection(
					   "jdbc:mysql://localhost:3306/MySQL", "root", "mysql");
		   } catch (SQLException ex) {
			   
			    // handle any errors
			    System.out.println("SQLException: " + ex.getMessage());
			    System.out.println("SQLState: " + ex.getSQLState());
			    System.out.println("VendorError: " + ex.getErrorCode());
		   }
	   }
     
	   /*
      try
      {
         String url = "jdbc:odbc:" + "DataSource"; 
         // assuming "DataSource" is your DataSource name

         Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
         
         try
         {            	
        	//TODO: USERNAME, PASSWORD 
            con = DriverManager.getConnection(url,"username","password"); 
             								
         // assuming your SQL Server's	username is "username"               
         // and password is "password"
              
         }
         
         catch (SQLException ex)
         {
            ex.printStackTrace();
         }
      }

      catch(ClassNotFoundException e)
      {
         System.out.println(e);
      }
      
      */

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
