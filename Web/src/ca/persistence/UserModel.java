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
	
	public static final String TYPE_STUDENT = "student";
	public static final String TYPE_PROFESSOR = "prof";
	public static final String TYPE_ADMIN = "admin";

	// Creates new user from data loaded by DB
	private static User initUserObject(ResultSet data) throws SQLException
	{
		User user = null;
		
		// Note: result set data is never null, just check if it has rows
		if(data.next())
		{
			int userID = data.getInt("userID");
			String username = data.getString("username");
			String password = data.getString("password");
			String email = data.getString("email");
			String firstName = data.getString("fName");
			String lastName = data.getString("lName");
			String userType = data.getString("userType");

			if(userType.equals(TYPE_STUDENT))
				user = new Student(userID, username, password, email, firstName, lastName);
			else if(userType.equals(TYPE_PROFESSOR))
				user = new Professor(userID, username, password, email, firstName, lastName);
			else if(userType.equals(TYPE_ADMIN))
				user = new Admin(userID, username, password, email, firstName, lastName);
			else
			{
				System.out.println("Warning: unknown user type retrieved");
				user = new User(userID, username, password, email, firstName, lastName, userType);
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
