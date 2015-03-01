package ca.objects;

import java.sql.ResultSet;

public class Professor extends User {

	public Professor(int userID, String username, String password,
			String email, String fName, String lName, String type) {
		super(userID, username, password, email, fName, lName, type);
		
		
	}
	public Professor(ResultSet data)
	{
		super(data);
	}
}
