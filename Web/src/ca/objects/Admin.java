package ca.objects;

import ca.persistence.UserModel;


public class Admin extends User 
{

	public Admin(int userID, String username, String password, String email,
				 String fName, String lName) 
	{
		super(userID, username, password, email, fName, lName, UserModel.TYPE_ADMIN);	
	}
	
	
}
