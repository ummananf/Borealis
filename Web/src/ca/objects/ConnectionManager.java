package ca.objects;

import java.sql.*;
import java.util.*;


public class ConnectionManager {

   static Connection con;
   static String url;
         
   public static Connection getConnection()
   {
     
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

      return con;
   }
   
   public static void closeConnection(Connection con)
   {
	   try
	   {
		   if(null != con)
		   {
			   con.close();
			   con = null;
		   }
	   }
	   catch (SQLException e)
	   {
		   e.printStackTrace();
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
