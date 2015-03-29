package ca.persistence;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.Map;



import ca.objects.Admin;
import ca.objects.Professor;
import ca.objects.Student;
import ca.objects.User;

public class UserModel 
{
	
	public static final String TYPE_STUDENT = "student";
	public static final String TYPE_PROFESSOR = "prof";
	public static final String TYPE_ADMIN = "admin";
	
	
	// Returns user associated with username given, or null if no such user
	public static User getUserData(String input) 
	{
		String query = "SELECT * FROM Users WHERE username = '"+input+"';";
		return createUserFromQuery(query);
	}
	
	public static User getUserByID(int userID) 
	{
		String query = "SELECT * FROM Users WHERE userID = '"+userID+"';";
		return createUserFromQuery(query);
	}
	
	public static String getUserPasswordByID(int userID)
	{
		Connection connection = ConnectionManager.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		
		String dbPassword = null;
		String query = "SELECT password FROM Users WHERE userID = '"+userID+"';";
		
		try {
			stmt = connection.createStatement();
			rs = stmt.executeQuery(query);
			
			if(rs.next()){
				dbPassword = rs.getString("password");
			}
		} catch (SQLException e) {
			System.out.println("error in UserModel: getUserPasswordByID");
			e.printStackTrace();
		}
		finally
		{
			try {
				stmt.close();
				rs.close();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		return dbPassword;
	}
	
	public static boolean updatePasswordByID(int userID, String newPassword)
	{
		String query = "UPDATE Users SET password = '"+newPassword+"' WHERE userID = '"+userID+"';";
		
		return DB.execute(query);
	}
	
	
	private static User createUserFromQuery(String query)
	{
		User user = null;
		List<Map<String, Object>> resultList = DB.getData(query);
		
		if (!resultList.isEmpty())
		{
			Map<String, Object> row = resultList.get(0);
	        
	        int userID = (Integer) row.get("userID");
			String username = (String) row.get("username");
			String password = (String) row.get("password");
			String email = (String) row.get("email");
			String firstName = (String) row.get("fName");
			String lastName = (String) row.get("lName");
			String degName = (String) row.get("degName");
			int maxCreditHrs = (Integer) row.get("maxCreditsPerTerm");
			String userType = (String) row.get("userType");
	
			if(userType.equals(TYPE_STUDENT))
				user = new Student(userID, username, password, email, firstName, lastName, degName, maxCreditHrs);
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
	
	public static boolean updateUserName(int userID, String newName)
	{
		String query = "UPDATE Users SET username = '"+newName+"' WHERE userID = '"+userID+"';";
		
		return DB.execute(query);
	}
	
	public static boolean updateUserEmail(int userID, String newEmail)
	{
		String query = "UPDATE Users SET email = '"+newEmail+"' WHERE userID = '"+userID+"';";
		
		return DB.execute(query);
	}
}
