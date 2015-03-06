package ca.persistence;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import ca.objects.Admin;
import ca.objects.Professor;
import ca.objects.Student;
import ca.objects.User;

public class UserModel {
	
	public static final String TYPE_STUDENT = "student";
	public static final String TYPE_PROFESSOR = "prof";
	public static final String TYPE_ADMIN = "admin";

	// Creates new user from data loaded by DB
	/*
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
	*/
	
	
	// Returns user associated with username given, or null if no such user
	public static User getUserData(String input) {
		String query = "SELECT * FROM Users WHERE username = '"+input+"';";
		//Connection connection = ConnectionManager.getConnection();
		User user = null;
		

		List<Map<String, Object>> resultList = DB.getData(query);
        
		if (resultList != null){
			Map<String, Object> row = resultList.get(0);
	        
	        int userID = (Integer) row.get("userID");
			String username = (String) row.get("username");
			String password = (String) row.get("password");
			String email = (String) row.get("email");
			String firstName = (String) row.get("fName");
			String lastName = (String) row.get("lName");
			String userType = (String) row.get("userType");
	
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
		/*
		try {
			Statement statement = connection.createStatement();
			data = statement.executeQuery(query);
			
			// This needs to be done before statement and connection is closed!
			//user = initUserObject(data);
			
			statement.close();
		} catch (SQLException e) {
			System.out.println("error reading user data from DB");
			e.printStackTrace();
		}*/
		
		//ConnectionManager.closeConnection(connection);

		return user;
	}
}
