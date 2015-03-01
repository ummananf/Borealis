package ca.persistence;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import ca.objects.Admin;
import ca.objects.Professor;
import ca.objects.Student;
import ca.objects.User;

public class UserModel {

	// Creates new user from data loaded by DB
	private static User initUserObject(ResultSet data) throws SQLException
	{
		User user = null;
		
		// Note: result set data is never null, just check if it has rows
		if(data.next())
		{
			String userType = data.getString("userType");
			
			if(userType.equals("student"))
				user = new Student(data);
			else if(userType.equals("prof"))
				user = new Professor(data);
			else if(userType.equals("admin"))
				user = new Admin(data);
			else
			{
				System.out.println("Warning: unknown user type retrieved");
				user = new User(data);
			}
		}
		
		return user;
	}
	
	
	// Returns user associated with username given, or null if no such user
	public static User getUserData(String username) {
		String query = "SELECT * FROM Users WHERE username = '"+username+"';";
		Connection connection = ConnectionManager.getConnection();
		ResultSet data = null;
		User user = null;
		
		try {
			Statement statement = connection.createStatement();
			data = statement.executeQuery(query);
			
			// This needs to be done before statement and connection is closed!
			user = initUserObject(data);
			
			statement.close();
		} catch (SQLException e) {
			System.out.println("error reading user data from DB");
			e.printStackTrace();
		}
		
		ConnectionManager.closeConnection(connection);

		return user;
	}
}
