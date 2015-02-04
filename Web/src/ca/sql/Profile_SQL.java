package ca.sql;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import ca.objects.User;

/**
 * All statements shalt be preparithed within this class.
 * Note the spacing in the sql Strings and the ? where the setStrings are occurring.
 * @author IceMasterCho
 *
 */
public class Profile_SQL {

	private static ResultSet rs = null;
	private static PreparedStatement stmt = null;
	
	private static final String USER_LOGIN_MATCH =
		"Select 1 " +
		"From UserTable " +
		"Where  user.username = ? " +
		"  AND  user.password = ? ";
	
	public static boolean isUserValid( Connection conn, User user ) throws SQLException{
		
	    boolean isFound = false;

		try {
			
			//prepare statement
			stmt = conn.prepareStatement( USER_LOGIN_MATCH );
			stmt.setString(1, user.getUsername());
			stmt.setString(2, user.getPassword());
 
			// execute select SQL stetement
			rs = stmt.executeQuery();
 
			//while (rs.next()) {
			//if a result is returned
			if( rs.next()){
 
				//String username = rs.getString("USERNAME");
				//String userpassword = rs.getString("PASSWORD");
 
				isFound = true;
			}
 
		} catch (SQLException e) {
 
			System.out.println(e.getMessage());
 
		} finally {
 
			if (stmt != null) {
				stmt.close();
			}
			if (rs != null){
				rs.close();
			}
		}
		
		return isFound;
	}
	
}
