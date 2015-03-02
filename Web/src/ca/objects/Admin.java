package ca.objects;

import java.sql.ResultSet;

public class Admin extends User {

	public Admin(int userID, String username, String password, String email,
			String fName, String lName, String type) {
		super(userID, username, password, email, fName, lName, type);
		
		
	}
	public Admin(ResultSet data)
	{
		super(data);
	}
}
