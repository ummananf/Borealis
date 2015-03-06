package ca.persistence;

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
	
	
	// Returns user associated with username given, or null if no such user
	public static User getUserData(String input) {
		String query = "SELECT * FROM Users WHERE username = '"+input+"';";
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

		return user;
	}
}
