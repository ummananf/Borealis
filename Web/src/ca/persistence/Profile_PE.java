package ca.persistence;


import java.sql.*;

import ca.objects.ConnectionManager;
import ca.objects.User;


/**
 * This class is used strictly for creating connections and returning objects to the 'logic' layer for analysis
 * @author IceMasterCho
 *
 */
public class Profile_PE {

    static Connection conn = null;
	
    public static boolean isUserValid( User user ){
    	
    	 boolean isValid = false;
    	
    	 try 
         {
            //connect to DB 
            //conn = ConnectionManager.getConnection();
    		//isFound = Profile_SQL.isUserValid( conn, user );
            isValid = true;
            //conn.close();
         } 
    	 catch (Exception ex) 
         {
            System.out.println("Login failed: An Exception has occurred! " + ex);
         } 
    	 return isValid;
    }
    
    // ** CREATE METHODS FOR CONNECTIONS FOR EVERY SQL CALL **
    
}
