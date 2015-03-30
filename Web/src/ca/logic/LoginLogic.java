package ca.logic;


import ca.objects.User;
import ca.persistence.UserModel;


/**
 * This class is used as the business logic class - will talk to the persistence
 * and send data back to the servlet layer through returns
 * 
 *
 */
public class LoginLogic 
{
	public LoginLogic() {}
	

	// Checks if user data is correct, then returns a User obj, or null if not valid
	public User getUserIfValid(String username, String password)
	 {
		User validUser = null;
		User tempUser = UserModel.getUserData(username);
		

		if (tempUser != null)
		{
		
			if (tempUser.getPassword().equals(password))
				validUser = tempUser;
		}
		return validUser;
	}

}
