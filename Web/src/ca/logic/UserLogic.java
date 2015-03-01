package ca.logic;

import ca.model.UserModel;
import ca.objects.Admin;
import ca.objects.Professor;
import ca.objects.User;
import ca.objects.Student;

/**
 * This class is used as the business logic class - will talk to the persistence
 * and send data back to the servlet layer through returns
 * 
 * @author IceMasterCho
 *
 */
public class UserLogic {

	public UserLogic() {
	}
	
	// Creates new user from data loaded by DB
	private User initUserObject(Object[][] data)
	{
		User user = null;
		
		if(data != null)
		{
			String userType = data[0][6].toString();
			
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

	// Checks if user data is correct, then returns a User obj, or null if not valid
	public User getUserIfValid(String username, String password) {
		User result = null;
		Object[][] data = UserModel.getUserData(username);

		if (data != null) {
			String retrievedPassword = data[0][2].toString();
			
			if (retrievedPassword.equals(password))
				result = initUserObject(data);
		}

		return result;
	}

}
